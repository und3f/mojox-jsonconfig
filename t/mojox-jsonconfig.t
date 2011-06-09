#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;

use FindBin qw($Bin);

use_ok 'MojoX::JsonConfig';

can_ok 'MojoX::JsonConfig', 'parse_config', 'parse_config_file';

is_deeply MojoX::JsonConfig::parse_config('{}'), {}, 'Empty config';

is_deeply MojoX::JsonConfig::parse_config(
    <<'CONFIG'), {test => 'ok'}, 'Config with comment';
{
    <%# comment %>
    "test": "ok"
}
CONFIG

is_deeply MojoX::JsonConfig::parse_config_file("$Bin/config.json"),
  {test => 'ok'}, 'Read config from file';
