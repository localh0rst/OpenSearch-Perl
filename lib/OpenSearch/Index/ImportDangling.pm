package OpenSearch::Index::ImportDangling;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Index::ImportDangling';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_post( $self, [ '_dangling', $self->index_uuid ] );
}

__PACKAGE__->meta->make_immutable;
1;
