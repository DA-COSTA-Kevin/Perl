## Exercice 1
```pl
#!/usr/bin/perl
use strict;
use warnings;

use POSIX qw(strftime);

my $date = strftime('%A, %d %B %Y', 0,0,0,17,8,98 );
print "$date\n";

close($date);
```

## Exercice 2
```pl
#!/usr/bin/perl
use strict;
use warnings;

use POSIX qw(strftime);

my $date = strftime('%Y/%m/%d %H::%M::%S', localtime((stat($ENV{HOME}))[9]));
my $login = (getpwuid((stat($ENV{HOME}))[4]))[0];
print "$date & $login.\n";

close($date);
close($login);
```

## Exercice 3
```pl
#!/usr/bin/perl
use strict;
use warnings;

use threads;
use threads::shared;
use IO::Socket;

my $cpt : shared = 1;

sub function {
    my ($socket) = @_;

    $socket->send($cpt++."\n");
    
    sleep(5);
    $socket->send($cpt++."\n");
    
    close($socket);
}

my $listen_socket = IO::Socket::INET->new(
    Proto=>'tcp', LocalPort=>2000, Listen=>5, Reuse=>1 ) 
or die("$@");

while( my $accept_socket = $listen_socket->accept() ) {
    print "New client\n";
    my $test_thread = threads->new(\&function, $accept_socket);
    $test_thread->detach();
}

close($listen_socket);
```

## Exercice 4
```pl
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
```

## Exercice 5
```pl
#!/usr/bin/perl
use strict;
use warnings;

use MIME::Parser;
use MIME::Base64;

my $parser = MIME::Parser->new();

my $mine = $parser->parse_open('./courriel');

my $from = $mine->get("From");
my $date = $mine->get("Date");
my $subject = $mine->get("Subject");
$subject =~ s/=\?utf-8\?b\?(.*?)\?=/decode_base64($1)/eig;

print $from."\n";
print $date."\n";
print $subject."\n";
```
