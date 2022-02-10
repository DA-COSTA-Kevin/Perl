#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

use lib '.';
use Disque;
use Anneau;

# Disques

my $disk = Disque->new(3,4,10);
my $broken = Disque->new();

print Dumper($disk, $broken);
print $disk->surface()."\n";
print $disk->dump()."\n";
print "$disk";

# Anneaux 

my $ring = Anneau->new(3,4,10,5);
my $ring2 = Anneau->new(3,4,10,0);

print $ring->surface()."\n";
print $ring->dump()."\n";

print $ring2->surface()."\n";
print $ring2->dump()."\n";
