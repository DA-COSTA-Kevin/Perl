#!/usr/bin/perl
use strict;
use warnings;


my %uid;

open( my $fd, '<' , 'passwd' ) or die( "open: $!" );
while( defined( my $ligne = <$fd> ) ) {
    chomp $ligne;

    #if( $ligne =~ m/^jc:/){ # Q1
    #    print "$ligne\n";
    #}

    #if( $ligne !~ m/bash$/){ # Q2
    #    print "$ligne\n";
    #}

    #$ligne =~ s:/home/:/mnt/home/:g; # Q3
    #print "$ligne\n";

    #$ligne =~ s/^(.+?):.+?:/$1::/g; # Q4
    #print "$ligne\n";

    #$ligne =~ s/^(.+?):(.+?):/$2:$1:/g; # Q5
    #print "$ligne\n";

    #$ligne =~ s/^((?:.*?:){2})(.+?):(.+?):/$1$3:$2:/g; # Q6
    #print "$ligne\n";
    
    #if( my ($gid) = $ligne =~ m/^(?:.*?:){3}(.+?):/) { # Q7
    #    print "$gid\n";
    #} 
    
    if( my ($gid) = $ligne =~ m/^(?:.*?:){3}(.+?):/) { # Q8
        $gid *= 2;
        $ligne =~ s/^((?:.*?:){3}).+?:/$1$gid:/g;
        print "$ligne\n";
    } 
}

close( $fd ); 