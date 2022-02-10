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