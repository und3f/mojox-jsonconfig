package MojoX::JsonConfig;

use strict;
use warnings;

our $VERSION = 0.1;

use base 'Exporter';
our @EXPORT = qw(parse_config parse_config_file);

use Mojo::Template;
use Mojo::JSON;

require Carp;

sub parse_config($) {
    my ($content) = @_;

    my $mt = Mojo::Template->new({});
    $content = $mt->render($content);
    utf8::encode $content;

    # Parse
    my $json = Mojo::JSON->new;
    $json->decode($content) or do { Carp::carp($json->error); return undef; };
}

sub parse_config_file($) {
    my ($config_file) = @_;

    open my $fh, '<:utf8', $config_file
      or Carp::croak q(Unable to read config file "$config_file": $!);

    my $content = do {
        local $/;
        <$fh>;
    };

    close $fh;

    parse_config($content);
}

1;
__END__

=head1 NAME

MojoX::JsonConfig - simple parsing of L<Mojolicious> json config files.

=head1 SYNOPSIS

    use MojoX::JsonConfig;

    my $config = parse_config_file 'myapp.json';

=head1 DESCRIPTION

L<MojoX::JsonConfig> simple parsing of L<Mojolicious> json config files.

=head2 C<parse_config>

    my $config = parse_config($config_content);

Parse configuration from variable C<$config_content>.

=head2 C<parse_config_file>

    my $config = parse_config_file($config_file);

Parse configuration file C<$config_file>.

=head1 SEE ALSO

L<Mojolicious::Plugin::JsonConfig>

=head1 AUTHOR

Sergey Zasenko, C<undef@cpan.org>.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011, Sergey Zasenko.

This program is free software, you can redistribute it and/or modify it under
the same terms as Perl 5.10.

=cut
