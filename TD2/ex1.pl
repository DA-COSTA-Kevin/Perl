#!/usr/bin/perl
use strict;
use warnings;

my %jours = ('janvier' => 31,
            'fevrier' => 28,
            'mars' => 31,
            'avril' => 30,
            'mai' => 31,
            'juin' => 30,
            'juillet' => 31,
            'aout' => 30,
            'septembre' => 31,
            'octobre' => 30,
            'novembre' => 31,
            'decembre' => 30);

foreach my $mois (@ARGV){
    if(exists($jours{$mois})){
        print "$mois : $jours{$mois}\n";
    }
    else {
        print "$mois : inconnu\n";
    }
}

my @tab = keys(%jours);
print "@tab\n";

delete($jours{'fevrier'});

@tab = keys(%jours);
print "@tab\n";

