#!user/bin/perl

use strict;
use warnings;

sub Modif {
    my ($texte, $ancien, $nouveau) = @_;
    
    my $res = 0;
    my $i = 0;

    while(($res = index($texte, $ancien, $i)) != -1) {
        substr($texte, $res, length($ancien), $nouveau);
        $i+= length($nouveau)
    }

    return ($texte);
}

print(Modif("bonjour vous, bonjour", "bonjour", "allo")."\n");
print(Modif("bonjour vous, bonjour", "bonjour", "bonjour bonjour")."\n");