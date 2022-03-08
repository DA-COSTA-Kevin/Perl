## Anneau
```pl
package Anneau;

use strict;
use warnings;

use Math::Trig;

use parent qw(Disque);

sub new {
    my ($class,$x,$y,$rayon,$rayonInt) = @_;

    my $self = $class->SUPER::new($x,$y,$rayon);
    $self->{RI} = $rayonInt // 0;

    bless($self, $class);
    return $self;
}

sub surface {
    my ($self) = @_;
    my $tmp = $self->SUPER::surface();
    return $tmp - (pi * ($self->{RI} * $self->{RI}));
}

sub dump {
   my ($self) = @_;
   return $self->SUPER::dump().",$self->{RI}";
}

1;
```

## Disque 
```pl
package Disque;

use strict;
use warnings;

use Math::Trig;

use overload '""' => \&my_stringify;

sub new {
    my ($class, $x, $y, $rayon) = @_;

    my $self = {
        X => $x // 0,
        Y => $y // 0,
        R => $rayon // 0,
    };

    bless($self, $class);
    return $self;
}

sub surface {
    my ($self) = @_;
    return pi * ($self->{R} * $self->{R});
}

sub dump {
   my ($self) = @_;
   return ref($self).":$self->{X},$self->{Y},$self->{R}";
}

sub  my_stringify {
   my ($self) = @_;
   return ref($self).":$self->{X},$self->{Y},$self->{R}\n";
}
1;
```

## MonModule 

```pl
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
```

## Personne 

```pl
package Personne;

use strict;
use warnings;
use Moose;

has nom => ( is=>'ro', isa=>'Str' );
1;
```

## Soiree 

```pl
package Soiree;

use strict;
use warnings;
use Moose;

has capacite => ( is=>'ro', isa=>'Int' );
has potes => ( is=>'rw', 
        isa=>'ArrayRef[Personne]', 
        default => sub {[]}, 
        auto_deref => 1,
        traits => ['Array'],
        handles => {
            entrer => 'push',
            expulser => 'pop',
            nbPotes => 'count',
        },
    );

sub fete {
    my ($self) = @_;
    foreach my $p ($self->potes()){
        print $p->nom()."\n";
    }
}

before entrer->sub{
    my ($self, $n) = @_;
    print $p->nom();
};

after entrer->sub{
    my ($self) = @_;
    if ($self->nbPotes() > $self->capacite) {
        my $p = $self->expulser();
        print $p->nom()."\n";
    } else {
        print "Bienvenue\n";
    }
};

1;
```

## Exercice 2 

```pl
#!/usr/bin/perl
use strict;
use warnings;

use lib '.';
use MonModule;
use MonModule qw(TableMult1);

my $test = TableMult1(6);
print("$test\n");
```

## Exercice 3

```pl
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
```

## Exercice 4 

```pl
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
```
