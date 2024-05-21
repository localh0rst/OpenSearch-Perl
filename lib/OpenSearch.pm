package OpenSearch;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
use Data::Dumper;
use OpenSearch::Base;
use OpenSearch::Search;

use OpenSearch::Index;

use OpenSearch::Cluster;
use OpenSearch::Remote;

# Filter
use OpenSearch::Filter::Source;

our $VERSION = '0.03';

# Base singleton
has 'base' => (
  is      => 'rw',
  isa     => 'OpenSearch::Base',
  lazy    => 1,
  default => sub { OpenSearch::Base->initialize; }
);

sub BUILD( $self, $args ) {
  $self->base( OpenSearch::Base->new(
    user           => $args->{user},
    pass           => $args->{pass},
    hosts          => $args->{hosts},
    secure         => $args->{secure}         // 0,
    allow_insecure => $args->{allow_insecure} // 1,
    pool_count     => $args->{pool_count}     // 1,
    clear_attrs    => $args->{clear_attrs}    // 0,
  ) );
}

# Index API
sub index { shift; return ( OpenSearch::Index->new(@_) ); }

#Search Endpoint
sub search { shift; return ( OpenSearch::Search->new(@_) ); }

# Cluster
sub cluster { shift; return ( OpenSearch::Cluster->new(@_) ); }

# Remote
sub remote { shift; return ( OpenSearch::Remote->new(@_) ); }

1;

__END__

=encoding utf-8

=head1 NAME

C<OpenSearch> - A Perl client for OpenSearch (https://opensearch.org/)

=head1 SYNOPSIS

    use strict;
    use warnings;
    use OpenSearch;

    my $opensearch = OpenSearch->new(
      user => 'admin',
      pass => 'admin',
      hosts => ['http://localhost:9200'],
      secure => 0,
      allow_insecure => 1,
    );

=head1 DESCRIPTION

This module is a Perl client for OpenSearch (https://opensearch.org/).
It currently only supports a small subset of the OpenSearch API.

=head1 IMPORTANT

This module is still in development and should not be used in production
unless you know what you are doing. The API is subject to change.

Keeep in mind that all attributes are cached in the class instance and will
be reused for the next request. If you want to clear all attributes after
a request you can set the clear_attrs attribute to 1. Another possibility
is to create a new instance of the class for each request.

The preferred way is to create a new class instance for each request:

    my $s = OpenSearch->new(...)->search;

    foreach (...) {
      my $response = $s
        ->search(query => {...})
        ->get;
    }

    my $opensearch = OpenSearch->new(...);
    my $search_api = $opensearch->search;
    my $s = $search_api->search;

    foreach ... (@...) {
      my $response = $search
        ->query(...)
        ->get;
    }

The latter is only safe to use if you know that all other attributes are
the same for every request. It is okay for situations like if you want to 
use `search_after` or `scroll`.

=head1 ATTRIBUTES

=head2 user

The username to use for authentication

=head2 pass

The password to use for authentication

=head2 hosts

An arrayref of hosts to connect to

=head2 secure

Boolean to indicate if the connection should be secure (https)

=head2 allow_insecure

Boolean to indicate if insecure connections are allowed

=head2 pool_count

The number of connections to pool

=head2 clear_attrs

Boolean to indicate if attributes should be cleared after a request.
By default this is set to false. Usualy all attributes are cached in
the class instance and will be reused for the next request. Switch
this to 1 if you want to clear all attributes after a request. Another
possibility is to create a new instance of the class for each request.

=head2 ca_cert

Path to a CA certificate file [UNTESTED]

=head2 client_cert

Path to a client certificate file [UNTESTED]

=head2 client_key

Path to a client key file [UNTESTED]

=head1 METHODS

=head2 cluster

returns a new OpenSearch::Cluster object

  my $cluster = $opensearch->cluster;

=head2 remote

returns a new OpenSearch::Remote object

  my $remote = $opensearch->remote;

=head2 search

returns a new OpenSearch::Search object

  my $search = $opensearch->search;

=head2 index

returns a new OpenSearch::Index object

  my $search = $opensearch->index;
=head1 LICENSE

Copyright (C) localh0rst.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

localh0rst E<lt>git@fail.ninjaE<gt>

=cut

