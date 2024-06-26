package OpenSearch::Document;
use strict;
use warnings;
use Moo;
use Types::Standard qw(InstanceOf);
use Data::Dumper;
use OpenSearch::Document::Index;
use OpenSearch::Document::Bulk;
use OpenSearch::Document::Get;
use feature qw(signatures);
no warnings qw(experimental::signatures);

has '_base' => (
  is  => 'rw',
  isa => InstanceOf['OpenSearch::Base'],
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


1;
