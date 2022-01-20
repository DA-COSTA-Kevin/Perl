#!/usr/bin/perl
use strict;
use warnings;


my %uid;

open( my $fd, '<' , 'passwd' ) or die( "open: $!" );
while( defined( my $ligne = <$fd> ) ) {
    chomp $ligne;
    my @tab = split(':',$ligne); # tab de la forme [login passwd uid ...]
    $uid{$tab[0]} = $tab[2]; # ajout dans la table de hachage
}

# Sortie quelconque

#foreach my $login (keys %uid){
#    print "$login : $uid{$login}\n";
#}


# Sortie trier par ordre alphabetique des logins
#foreach my $login (sort keys %uid){
#    print "$login : $uid{$login}\n";
#}


# Sortie trier par ordre croissant des uid
foreach my $login (sort{$uid{$a} <=> $uid{$b}} keys %uid){
    print "$login : $uid{$login}\n";
}

close( $fd ); 