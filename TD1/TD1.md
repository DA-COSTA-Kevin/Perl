# TD1 de Perl

## Exercice 1

Sur les PC de la fac (ou sur votre pc personnel), on fait la commande suivante :

```
perl -v
```

on obtient la version 5.28.1.

## Exercice 2

Code de base :
```pl
#!/usr/bin/perl

my $nntpmntp = 10;
while($nntpnmtp>5) {
   print "$nntpmntp\n";
   $nntpmntp --;
}

my $x = 'oui';
my $y = 'non';
if( $x == $y )
   print "c'est dingue!\n";
else
   print "tout va bien\n";

print '2'.'9'+'5'."\n";
```

Code corrigé :

```pl
#!/usr/bin/perl
use strict;
use warnings;

my $nntpmntp = 10;
while($nntpmntp>5) {
   print "$nntpmntp\n";
   $nntpmntp --;
}

my $x = 'oui';
my $y = 'non';
if( $x eq $y ) {
   print "c'est dingue!\n";
}
else {
   print "tout va bien\n";
}

print '2'.'9'+'5'."\n";
```

## Exercice 3

```pl
sub SommeTest {
    my ($x, $y, $n) = @_;
    my $r = $x + ($x.$y);
    if($r == $n){
        return 1; # Vrai
    }
    return 0; # Faux
}
```

Sans parametre ligne de commande :
```
print SommeTest(2,10,212)."\n";
```
Avec parametre ligne de commande :
```
print SommeTest(@ARGV)."\n";
```

## Exercice 4

```pl
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
    my ($n) = (@_, 10); # si aucun parametre alors prend 10 par default
    my $r = "";
    foreach my $i (1..$n) {
        foreach my $j (1..$n){
            $r .= sprintf('%5d', $i * $j);
        }
        $r .= sprintf("\n");
    }
    return $r;
}
```

## Exercice 5

```pl
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
```

## Exercice 6

```pl
#!/usr/bin/perl
use strict;
use warnings;

# Exercice 6

my @t = (4, -5, 7);

push(@t, -2, 3);

my $s = join('; ', @t);
printf($s."\n");

unshift(@t, 0, -1);

$t[3] = 9;

@t = map { $_ * 2 } @t;
@t = grep { $_ > 0 } @t;
@t = sort { $b <=> $a } @t;

my $r = join('; ', @t);
printf("$r\n");
```

## Exercice 7
```pl
#!/usr/bin/perl
use strict;
use warnings;

sub Intervalle {
    my ($n,$x) = @_;
    my @tab = ();
    foreach my $v (1..$n){
        if($v != $x){ push(@tab, $v); }
    }
    return @tab;
}

my @tab = Intervalle(10,4);
my $res = join(',', @tab);
printf("[$res]\n");

sub NonMult {
    my ($n,$x) = @_; 
    return (grep {($_ % $x) != 0} (1..$n));
}

my @tab2 = NonMult(10,2);
my $res2 = join(',', @tab2);
printf("[$res2]\n");
```
## Exercice 8
```pl
#TODO
```
## Exercice 9
```pl
#TODO
```