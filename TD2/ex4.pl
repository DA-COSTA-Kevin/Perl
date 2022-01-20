#!/usr/bin/perl
use strict;
use warnings;

my $cpt_lig = 0;
my $cpt_err = 0;
my $total_octets = 0;

open( my $fd, '<' , 'access_log' ) or die( "open: $!" );
while( defined( my $ligne = <$fd> ) ) {
    chomp $ligne;
    $cpt_lig++;
    if( my ($ip,$url,$status,$volume) =$ligne !~ m/^(.*?) .*?".*? (.*?) .*?" (.*?) (.*?) /) {
        if( $status != 200) {
            $cpt_err++;
        }
        $total_octets += $volume;
    }
}

print "nb de requêtes -> $cpt_lig\n";
print "status d'erreur -> $cpt_err\n";
print "total octets -> $total_octets\n";

close($fd);

# ERREURRRRRRRRRRRRRRRRRRRRR