package OpenSearch::Index::DeleteDangling;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Index::DeleteDangling';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_delete( $self, [ '_dangling', $self->index_uuid ] );
}

__PACKAGE__->meta->make_immutable;
1;
