#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my $r = { 
    Ben => { Tel => '01.02.03.04', Adr => '15, rue de la Faucheuse', Enfants => ['Stephane le rat'], },
    Dylan => { Tel => '06.33.22.44', Adr => '18, rue du Café sauvage', Enfants => ['Loic','Steve'], },
    Kevin => { Tel => '66.66.66.66', Adr => '21, rue de la Force brute', Enfants => ['Ben'], },
};

#print Dumper($r);

print("ref = {\n");
foreach my $name (keys %$r){
    print "     $name => {\n";
    print "         Enfants => [";
    #foreach my $enf (@{$r->{$name}{"Enfants"}}){       # avec un foreach
    #    print "'$enf', ";
    #}
    print join(", ", @{$r->{$name}{"Enfants"}});       # avec un join
    print "],\n";

    # Nombre d'enfants
    my $size = @{$r->{$name}{"Enfants"}};
    print "         Nombre d'Enfants => $size,\n";

    print "         Tel => '$r->{$name}{\"Tel\"}',\n";
    print "         Adr => '$r->{$name}{\"Adr\"}', },\n";
}
print("}\n");