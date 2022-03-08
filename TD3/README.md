## Exercice 1

```pl
#!/usr/bin/perl
use strict;
use warnings;

print "\n### FILES ###\n";

my @files = glob('~/.*');
@files = grep { not -x $_ } @files;
@files = sort { -s $a <=> -s $b } @files;
print join("\n",@files)."\n";

print "\n### SIZE ###\n";
my @files_size = map { -s $_ } @files;
print join("\n",@files_size)."\n";
```

## Exercice 2

```pl
#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my $r = { 
    Ben => { Tel => '01.02.03.04', Adr => '15, rue de la Faucheuse', Enfants => ['Stephane le rat'], },
    Dylan => { Tel => '06.33.22.44', Adr => '18, rue du Café sauvage', Enfants => ['Loic','Steve'], },
    Kevin => { Tel => '66.66.66.66', Adr => '21, rue de la Force brute', Enfants => ['Ben'], },
};

#print Dumper($r);

print("ref = {\n");
foreach my $name (keys %$r){
    print "     $name => {\n";
    print "         Enfants => [";
    #foreach my $enf (@{$r->{$name}{"Enfants"}}){       # avec un foreach
    #    print "'$enf', ";
    #}
    print join(", ", @{$r->{$name}{"Enfants"}});       # avec un join
    print "],\n";

    # Nombre d'enfants
    my $size = @{$r->{$name}{"Enfants"}};
    print "         Nombre d'Enfants => $size,\n";

    print "         Tel => '$r->{$name}{\"Tel\"}',\n";
    print "         Adr => '$r->{$name}{\"Adr\"}', },\n";
}
print("}\n");
```

## Exercice 3

```pl
#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

sub parse {
    my ($name_file) = @_;
    my $ref = {};
    open( my $fd, '<' , $name_file ) or die( "open: $!" );
    while( defined( my $ligne = <$fd> ) ) {
        chomp $ligne;

        my @split_line = split(":", $ligne);
        $ref->{$split_line[0]} = {
            passwd => $split_line[1],
            uid => $split_line[2],
            gid => $split_line[3],
            info => $split_line[4],
            home => $split_line[5],
            shell => $split_line[6],
        }
    }
    return $ref;
}

sub display1 {
    my ($ref) = @_;
    print("ref = {\n");
    foreach my $name (keys %$ref){
        print "     $name => {\n";
        print "         passwd => '$ref->{$name}{\"passwd\"}',\n";
        print "         uid => '$ref->{$name}{\"uid\"}',\n";
        print "         gid => '$ref->{$name}{\"gid\"}',\n";
        print "         info => '$ref->{$name}{\"info\"}',\n";
        print "         home => '$ref->{$name}{\"home\"}',\n";
        print "         shell => '$ref->{$name}{\"shell\"}', },\n";
    }
    print("}\n");
}

sub display2 {
    my ($ref) = @_;
    print("ref = {\n");
    foreach my $name (sort{$a cmp $b} keys %$ref){
        print "     $name => {\n";
        print "         passwd => '$ref->{$name}{\"passwd\"}',\n";
        print "         uid => '$ref->{$name}{\"uid\"}',\n";
        print "         gid => '$ref->{$name}{\"gid\"}',\n";
        print "         info => '$ref->{$name}{\"info\"}',\n";
        print "         home => '$ref->{$name}{\"home\"}',\n";
        print "         shell => '$ref->{$name}{\"shell\"}', },\n";
    }
    print("}\n");
}

sub display3 {
    my ($ref) = @_;
    print("ref = {\n");
    foreach my $name (sort{$ref->{$b}{uid} <=> $ref->{$a}{uid} or $a cmp $b} keys %$ref){
        print "     $name => {\n";
        print "         passwd => '$ref->{$name}{\"passwd\"}',\n";
        print "         uid => '$ref->{$name}{\"uid\"}',\n";
        print "         gid => '$ref->{$name}{\"gid\"}',\n";
        print "         info => '$ref->{$name}{\"info\"}',\n";
        print "         home => '$ref->{$name}{\"home\"}',\n";
        print "         shell => '$ref->{$name}{\"shell\"}', },\n";
    }
    print("}\n");
}


my ($ref) = parse('passwd');
#print Dumper($ref);
#display1($ref);
#display2($ref);
display3($ref);
```

## Exercice 4

```pl
#!/usr/bin/perl
use strict;
use warnings;

sub positif {
    my ($e) = @_;
    return $e > 0;
}

sub double {
    my ($e) = @_;
    return 2*$e;
}

sub croissant {
    my ($a,$b) = @_;
    return $a <=> $b;
}

# klgjlkdfhjdfjlkh <- message codé a mon ami
sub mygrep {
    my ($ref, @tabl) = @_;

    my @res;

    foreach my $val (@tabl) {
        if ($ref->($val)){
            push(@res, $val);
        }
    }
    return @res;
}

sub mymap {
    my ($ref, @tabl) = @_;

    my @res;

    foreach my $val (@tabl) {
        push(@res, $ref->($val));
    }
    return @res;
}

my @t = mygrep \&positif, 43,654,-43,34,32,-23,652,1,2,1,523;
print "@t\n";
my @t2 = mymap \&double, @t;
print "@t2\n";
```
