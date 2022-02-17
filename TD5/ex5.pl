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

print $from."\n";
print $date."\n";
print $subject."\n";

