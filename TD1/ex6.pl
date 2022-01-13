#!/usr/bin/perl
use strict;
use warnings;

# Exercice 6

my @t = (4, -5, 7);

push(@t, -2, 3);

my $s = join('; ', @t);
printf($s."\n");

unshift(@t, 0, -1);

$t[3] = 9;

@t = map { $_ * 2 } @t;
@t = grep { $_ > 0 } @t;
@t = sort { $b <=> $a } @t;

my $r = join('; ', @t);
printf("$r\n");