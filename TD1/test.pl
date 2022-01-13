#!/usr/bin/perl
use strict;
use warnings;

# Exercice 3

sub SommeTest {
    my ($x, $y, $n) = @_;
    my $r = $x + ($x.$y);
    if($r == $n){
        return 1;
    }
    return 0;
}

# Sans parametre ligne de commande
# print SommeTest(2,10,212)."\n";

# Avec parametre ligne de commande
# print SommeTest(@ARGV)."\n";

# Exercice 4

sub TableMult1 {
    my ($n) = @_;
    for(my $i = 1; $i <= $n; $i++){
        for(my $j = 1; $j <= $n; $j++){
            printf('%5d', $i * $j);
        }
        printf("\n");
    }
}

sub TableMult2 {
    my ($n) = @_;
    foreach my $i (1..$n) {
        foreach my $j (1..$n){
            printf('%5d', $i * $j);
        }
        printf("\n");
    }
}

sub TableMult3 {
    my ($n) = (@_, 10);
    my $r = "";
    foreach my $i (1..$n) {
        foreach my $j (1..$n){
            $r .= sprintf('%5d', $i * $j);
        }
        $r .= sprintf("\n");
    }
    return $r;
}

# TableMult1(@ARGV);
# TableMult2(@ARGV);
# printf(TableMult3(@ARGV));

# Exercice 5

sub Fact {
    my ($n) = (@_, 1);
    if($n < 1){
        return 1;
    }
    else {
        return $n * Fact($n - 1);
    }
}

foreach my $v (0..10){
    printf(Fact($v)."\n");
}

sub Fibo {
    my ($n) = (@_, 1);
    my @t = (0, 1);
    for(my $i=2; $i < $n; $i++){
        $t[$i] = $t[$i - 1] + $t[$i - 2];
    }
    return @t;
}

foreach my $v (my @res = Fibo(10)){
    printf($v."\n");
}

# chmod +x test.pl
# ./test variable1 variable2 variable3
