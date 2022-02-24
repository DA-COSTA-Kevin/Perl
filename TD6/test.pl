#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $source = 'dbi:Pg:host=sqletud.u-pem.fr;dbname=kevin.da-costa-moura_db';
my $user = 'kevin.da-costa-moura';
my $pwd = 'Darkevin!77';


my $base = DBI->connect($source,$user,$pwd) or die($DBI::errstr);

#$base->do('CREATE TABLE annuaire (
#    prenom_nom VARCHAR(40),
#    numero_tel VARCHAR(20)
#);') or die('do:'.$base->errstr);

my $sql = 'INSERT INTO annuaire(prenom_nom,numero_tel) VALUES(?,?);';
my $req = $base->prepare($sql) or die($base->errstr());
#$req->execute('Test_Kevin','666') or die($base->errstr());
#$req->execute('Test_Ben','777') or die($base->errstr());
#$req->execute('Test_Steve','888') or die($base->errstr());
#$req->execute('Test_Stephane','999') or die($base->errstr());

my $req2 = $base->prepare('SELECT prenom_nom, numero_tel FROM annuaire') or die($base->errstr);
$req2->execute() or die($base->errstr);
while(my $refh = $req2->fetchrow_hashref) {
    print "$refh->{prenom_nom} $refh->{numero_tel}\n";
}

$base->disconnect();