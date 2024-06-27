package OpenSearch::Search;
use strict;
use warnings;
use Moo;
use Types::Standard qw(InstanceOf);
use Data::Dumper;
use OpenSearch::Search::Search;
use OpenSearch::Search::Count;
use feature qw(signatures);
no warnings qw(experimental::signatures);

has '_base' => (
  is  => 'rw',
  isa => InstanceOf['OpenSearch::Base'],
  required => 1,
);

sub search( $self, @params ) {
  return ( OpenSearch::Search::Search->new(@params, _base => $self->_base)->execute );
}

sub count( $self, @params ) {
  return ( OpenSearch::Search::Count->new(@params, _base => $self->_base)->execute );
}

1;
