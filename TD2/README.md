## Exercice 1

```pl
#!/usr/bin/perl
use strict;
use warnings;

my %jours = ('janvier' => 31,
            'fevrier' => 28,
            'mars' => 31,
            'avril' => 30,
            'mai' => 31,
            'juin' => 30,
            'juillet' => 31,
            'aout' => 30,
            'septembre' => 31,
            'octobre' => 30,
            'novembre' => 31,
            'decembre' => 30);

foreach my $mois (@ARGV){
    if(exists($jours{$mois})){
        print "$mois : $jours{$mois}\n";
    }
    else {
        print "$mois : inconnu\n";
    }
}

my @tab = keys(%jours);
print "@tab\n";

delete($jours{'fevrier'});

@tab = keys(%jours);
print "@tab\n";
```

## Exercice 2

```pl
#!/usr/bin/perl
use strict;
use warnings;

my %uid;

open( my $fd, '<' , 'passwd' ) or die( "open: $!" );
while( defined( my $ligne = <$fd> ) ) {
    chomp $ligne;
    my @tab = split(':',$ligne); # tab de la forme [login passwd uid ...]
    $uid{$tab[0]} = $tab[2]; # ajout dans la table de hachage
}


# Sortie quelconque

foreach my $login (keys %uid){
    print "$login : $uid{$login}\n";
}


# Sortie trier par ordre alphabetique des logins
foreach my $login (sort keys %uid){
    print "$login : $uid{$login}\n";
}


# Sortie trier par ordre croissant des uid
foreach my $login (sort{$uid{$a} <=> $uid{$b}} keys %uid){
    print "$login : $uid{$login}\n";
}

close( $fd );
```

## Exercice 3

```pl
#!/usr/bin/perl
use strict;
use warnings;


my %uid;

open( my $fd, '<' , 'passwd' ) or die( "open: $!" );
while( defined( my $ligne = <$fd> ) ) {
    chomp $ligne;

    #if( $ligne =~ m/^jc:/){ # Q1
    #    print "$ligne\n";
    #}

    #if( $ligne !~ m/bash$/){ # Q2
    #    print "$ligne\n";
    #}

    #$ligne =~ s:/home/:/mnt/home/:g; # Q3
    #print "$ligne\n";

    #$ligne =~ s/^(.+?):.+?:/$1::/g; # Q4
    #print "$ligne\n";

    #$ligne =~ s/^(.+?):(.+?):/$2:$1:/g; # Q5
    #print "$ligne\n";

    #$ligne =~ s/^((?:.*?:){2})(.+?):(.+?):/$1$3:$2:/g; # Q6
    #print "$ligne\n";
    
    #if( my ($gid) = $ligne =~ m/^(?:.*?:){3}(.+?):/) { # Q7
    #    print "$gid\n";
    #} 
    
    if( my ($gid) = $ligne =~ m/^(?:.*?:){3}(.+?):/) { # Q8
        $gid *= 2;
        $ligne =~ s/^((?:.*?:){3}).+?:/$1$gid:/g;
        print "$ligne\n";
    } 
}

close( $fd ); 
```

## Exercice 4

```pl
#!/usr/bin/perl
use strict;
use warnings;

my $cpt_lig = 0;
my $cpt_err = 0;
my $total_octets = 0;

open( my $fd, '<' , 'access_log' ) or die( "open: $!" );
while( defined( my $ligne = <$fd> ) ) {
    chomp $ligne;
    $cpt_lig++;
    if( my ($ip,$url,$status,$volume) =$ligne !~ m/^(.*?) .*?".*? (.*?) .*?" (.*?) (.*?) /) {
        if( $status != 200) {
            $cpt_err++;
        }
        $total_octets += $volume;
    }
}

print "nb de requêtes -> $cpt_lig\n";
print "status d'erreur -> $cpt_err\n";
print "total octets -> $total_octets\n";

close($fd);
```
