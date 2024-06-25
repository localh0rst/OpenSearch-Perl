package OpenSearch::Document;
use strict;
use warnings;
use Moose;
use Data::Dumper;
use OpenSearch::Document::Index;
use OpenSearch::Document::Bulk;
use OpenSearch::Document::Get;
use feature qw(signatures);
no warnings qw(experimental::signatures);

has '_base' => (
  is  => 'rw',
  isa => 'OpenSearch::Base',
  required => 1,
);

sub index( $self, @params ) {
  return ( OpenSearch::Document::Index->new(@params, _base => $self->_base)->execute );
}

sub bulk( $self, @params ) {
  return ( OpenSearch::Document::Bulk->new(@params, _base => $self->_base)->execute );
}

sub get( $self, @params ) {
  return ( OpenSearch::Document::Get->new(@params, _base => $self->_base)->execute );
}

__PACKAGE__->meta->make_immutable;
1;
