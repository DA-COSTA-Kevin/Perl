#!/usr/bin/perl
use strict;
use warnings;

sub NbPremier {
    my ($n) = @_;
    my @lst = (2..$n);
    my @res = ();
    while ($#lst) {
        my $val = $lst[0];
        push(@res, $val);
        shift(@lst);
        @lst = grep {$_ % $val} @lst;
    }
    return @res;
}



my @res = NbPremier(100);
print("@res\n");