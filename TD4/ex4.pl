#!/usr/bin/perl
use strict;
use warnings;

use lib '.';
use Personne;
use Soiree;

use Data::Dumper;

# Personnes

my $me = Personne->new(nom=>'Kevin');
my $steve = Personne->new(nom=>'Ben & Stephane');

print Dumper($me, $steve);