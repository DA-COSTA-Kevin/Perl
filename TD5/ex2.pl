#!/usr/bin/perl
use strict;
use warnings;

use POSIX qw(strftime);

my $date = strftime('%Y/%m/%d %H::%M::%S', localtime((stat($ENV{HOME}))[9]));
my $login = (getpwuid((stat($ENV{HOME}))[4]))[0];
print "$date & $login.\n";

close($date);
close($login);