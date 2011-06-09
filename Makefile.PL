#!/usr/bin/env perl

use 5.008001;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'MojoX::JsonConfig',
    AUTHOR        => 'Sergey Zasenko <d3fin3@gmail.com>',
    LICENSE       => 'perl',
    ABSTRACT_FROM => 'lib/MojoX/JsonConfig.pm',
    VERSION_FROM  => 'lib/MojoX/JsonConfig.pm',

    BUILD_REQUIRES => {'Test::More'  => '0.88'},
    PREREQ_PM      => {'Mojolicious' => 0,},
    META_MERGE     => {
        resources =>
          {repository => 'https://github.com/und3f/mojox-jsonconfig'},
    },
);
