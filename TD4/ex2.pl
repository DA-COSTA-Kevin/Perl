#!/usr/bin/perl
use strict;
use warnings;

use lib '.';
use MonModule;
use MonModule qw(TableMult1);

my $test = TableMult1(6);
print("$test\n");
