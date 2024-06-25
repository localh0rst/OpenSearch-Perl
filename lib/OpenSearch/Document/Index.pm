package OpenSearch::Document::Index;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Document::Index';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $method = $self->id ? '_put' : '_post';
  my $res    = $self->_base->$method( $self,
    [ $self->index, ( $self->create ? '_create' : '_doc' ), ( $self->id ? $self->id : () ) ] );
}

__PACKAGE__->meta->make_immutable;
1;
