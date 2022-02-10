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