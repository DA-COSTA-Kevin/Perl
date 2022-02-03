#!/usr/bin/perl
use strict;
use warnings;

print "\n### FILES ###\n";

my @files = glob('~/.*');
@files = grep { not -x $_ } @files;
@files = sort { -s $a <=> -s $b } @files;
print join("\n",@files)."\n";

print "\n### SIZE ###\n";
my @files_size = map { -s $_ } @files;
print join("\n",@files_size)."\n";