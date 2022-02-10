package MonModule;
use strict;
use warnings;

use parent qw(Exporter);
our @EXPORT = qw(TableMult1);

sub TableMult1 {
    my ($n) = @_;
    for(my $i = 1; $i <= $n; $i++){
        for(my $j = 1; $j <= $n; $j++){
            printf('%5d', $i * $j);
        }
        printf("\n");
    }
}
1;