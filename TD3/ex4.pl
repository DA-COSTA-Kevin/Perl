#!/usr/bin/perl
use strict;
use warnings;

sub positif {
    my ($e) = @_;
    return $e > 0;
}

sub double {
    my ($e) = @_;
    return 2*$e;
}

sub croissant {
    my ($a,$b) = @_;
    return $a <=> $b;
}

# klgjlkdfhjdfjlkh <- message codé a mon ami
sub mygrep {
    my ($ref, @tabl) = @_;

    my @res;

    foreach my $val (@tabl) {
        if ($ref->($val)){
            push(@res, $val);
        }
    }
    return @res;
}

sub mymap {
    my ($ref, @tabl) = @_;

    my @res;

    foreach my $val (@tabl) {
        push(@res, $ref->($val));
    }
    return @res;
}

my @t = mygrep \&positif, 43,654,-43,34,32,-23,652,1,2,1,523;
print "@t\n";
my @t2 = mymap \&double, @t;
print "@t2\n";