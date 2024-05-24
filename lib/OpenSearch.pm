package OpenSearch;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
use Data::Dumper;
use OpenSearch::Base;

use OpenSearch::Cluster;
use OpenSearch::Remote;
use OpenSearch::Search;
use OpenSearch::Index;
use OpenSearch::Document;

has 'base' => (
  is      => 'rw',
  isa     => 'OpenSearch::Base',
  lazy    => 1,
  default => sub { OpenSearch::Base->initialize; }
);

sub BUILD( $self, $args ) {
  $self->base( OpenSearch::Base->new(
    user            => $args->{user},
    pass            => $args->{pass},
    hosts           => $args->{hosts},
    secure          => $args->{secure}          // 0,
    allow_insecure  => $args->{allow_insecure}  // 1,
    pool_count      => $args->{pool_count}      // 10,
    clear_attrs     => $args->{clear_attrs}     // 0,
    async           => $args->{async}           // 0,
    max_connections => $args->{max_connections} // 10,
  ) );
}

sub cluster($self) {
  return ( OpenSearch::Cluster->new );
}

sub remote($self) {
  return ( OpenSearch::Remote->new );
}

sub search($self) {
  return ( OpenSearch::Search->new );
}

sub index($self) {
  return ( OpenSearch::Index->new );
}

sub document($self) {
  return ( OpenSearch::Document->new );
}
1;

