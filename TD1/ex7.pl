#!/usr/bin/perl
use strict;
use warnings;

sub Intervalle {
    my ($n,$x) = @_;
    my @tab = ();
    foreach my $v (1..$n){
        if($v != $x){ push(@tab, $v); }
    }
    return @tab;
}

my @tab = Intervalle(10,4);
my $res = join(',', @tab);
printf("[$res]\n");

sub NonMult {
    my ($n,$x) = @_; 
    return (grep {($_ % $x) != 0} (1..$n));
}

my @tab2 = NonMult(10,2);
my $res2 = join(',', @tab2);
printf("[$res2]\n");
