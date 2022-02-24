#!/usr/bin/perl
use strict;
use warnings;

use CGI;

my $query = CGI->new();
print "Content-Type: text/html\n\n";
my $contenu = $query->param('prenom');
print "$contenu<br/>\n";
