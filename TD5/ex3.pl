#!/usr/bin/perl
use strict;
use warnings;

use threads;
use threads::shared;
use IO::Socket;

my $cpt : shared = 1;

sub function {
    my ($socket) = @_;

    $socket->send($cpt++."\n");
    
    sleep(5);
    $socket->send($cpt++."\n");
    
    close($socket);
}

my $listen_socket = IO::Socket::INET->new(
    Proto=>'tcp', LocalPort=>2000, Listen=>5, Reuse=>1 ) 
or die("$@");

while( my $accept_socket = $listen_socket->accept() ) {
    print "New client\n";
    my $test_thread = threads->new(\&function, $accept_socket);
    $test_thread->detach();
}

close($listen_socket);