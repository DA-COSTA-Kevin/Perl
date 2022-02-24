#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $source = 'dbi:Pg:host=sqletud.u-pem.fr;dbname=kevin.da-costa-moura_db';
my $user = 'kevin.da-costa-moura';
my $pwd = 'Darkevin!77';

use CGI;

my $query = CGI->new();
print "Content-Type: text/html\n\n";

my $base = DBI->connect($source,$user,$pwd) or die($DBI::errstr);

my $sql = 'INSERT INTO annuaire(prenom_nom,numero_tel) VALUES(?,?);';
my $req = $base->prepare($sql) or die($base->errstr());


my $prenom_nom = $query->param('prenom_nom');
my $numero_tel = $query->param('numero_tel');

#print "$prenom_nom<br/>\n";
#print "$numero_tel<br/>\n";
$req->execute($prenom_nom, $numero_tel) or die($base->errstr());

print "<h1>table</h1>\n";
my $req2 = $base->prepare('SELECT prenom_nom, numero_tel FROM annuaire') or die($base->errstr);
$req2->execute() or die($base->errstr);
while(my $refh = $req2->fetchrow_hashref) {
    print "$refh->{prenom_nom}  $refh->{numero_tel} <br/>\n";
}

$base->disconnect();