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