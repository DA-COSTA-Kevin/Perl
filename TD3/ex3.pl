#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

sub parse {
    my ($name_file) = @_;
    my $ref = {};
    open( my $fd, '<' , $name_file ) or die( "open: $!" );
    while( defined( my $ligne = <$fd> ) ) {
        chomp $ligne;

        my @split_line = split(":", $ligne);
        $ref->{$split_line[0]} = {
            passwd => $split_line[1],
            uid => $split_line[2],
            gid => $split_line[3],
            info => $split_line[4],
            home => $split_line[5],
            shell => $split_line[6],
        }
    }
    return $ref;
}

sub display1 {
    my ($ref) = @_;
    print("ref = {\n");
    foreach my $name (keys %$ref){
        print "     $name => {\n";
        print "         passwd => '$ref->{$name}{\"passwd\"}',\n";
        print "         uid => '$ref->{$name}{\"uid\"}',\n";
        print "         gid => '$ref->{$name}{\"gid\"}',\n";
        print "         info => '$ref->{$name}{\"info\"}',\n";
        print "         home => '$ref->{$name}{\"home\"}',\n";
        print "         shell => '$ref->{$name}{\"shell\"}', },\n";
    }
    print("}\n");
}

sub display2 {
    my ($ref) = @_;
    print("ref = {\n");
    foreach my $name (sort{$a cmp $b} keys %$ref){
        print "     $name => {\n";
        print "         passwd => '$ref->{$name}{\"passwd\"}',\n";
        print "         uid => '$ref->{$name}{\"uid\"}',\n";
        print "         gid => '$ref->{$name}{\"gid\"}',\n";
        print "         info => '$ref->{$name}{\"info\"}',\n";
        print "         home => '$ref->{$name}{\"home\"}',\n";
        print "         shell => '$ref->{$name}{\"shell\"}', },\n";
    }
    print("}\n");
}

sub display3 {
    my ($ref) = @_;
    print("ref = {\n");
    foreach my $name (sort{$ref->{$b}{uid} <=> $ref->{$a}{uid} or $a cmp $b} keys %$ref){
        print "     $name => {\n";
        print "         passwd => '$ref->{$name}{\"passwd\"}',\n";
        print "         uid => '$ref->{$name}{\"uid\"}',\n";
        print "         gid => '$ref->{$name}{\"gid\"}',\n";
        print "         info => '$ref->{$name}{\"info\"}',\n";
        print "         home => '$ref->{$name}{\"home\"}',\n";
        print "         shell => '$ref->{$name}{\"shell\"}', },\n";
    }
    print("}\n");
}


my ($ref) = parse('passwd');
#print Dumper($ref);
#display1($ref);
#display2($ref);
display3($ref);