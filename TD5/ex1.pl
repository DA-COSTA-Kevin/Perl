#!/usr/bin/perl
use strict;
use warnings;

use POSIX qw(strftime);

my $date = strftime('%A, %d %B %Y', 0,0,0,17,8,98 );
print "$date\n";

close($date);