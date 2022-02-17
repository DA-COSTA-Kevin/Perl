#!/usr/bin/perl
use strict;
use warnings;

use MIME::Lite;

my $mine = MIME::Lite->new(
    From => 'Moi <kevindacostam@gmail.com>',
    To => 'thomas <pourchetthomas93@gmail.com>',
    Subject => 'RDV Gare du Nord!',
    Type => 'Text',
    Encoding => 'quoted-printable',
    Data => "Jt'attend devant la gare !!!\n",
);

$mine->attach(
    Type => 'image/jpeg', # application/pdf
    Encoding => 'base64',
    Path => './baston.jpeg',
    Filename => 'baston.jpeg',
);

$mine->send();