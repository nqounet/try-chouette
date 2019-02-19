#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use Path::Tiny;
use Chouette;

use Data::Printer {deparse => 1, caller_info => 1};

my $chouette = Chouette->new(
    +{
        config_defaults => +{
            var_dir => Path::Tiny->tempdir,
            listen  => '9876',
        },
        routes => +{
            '/' => +{
                GET => sub {
                    my $c = shift;
                    die $c->respond(+{hello => 'world!'});
                },
            },
        },
    }
);

$chouette->run;
