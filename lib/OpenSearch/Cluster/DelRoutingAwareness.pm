package OpenSearch::Cluster::DelRoutingAwareness;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Cluster::DelRoutingAwareness';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_delete( $self, [ '_cluster', 'routing', 'awareness', $self->attribute, 'weights' ] );
}

__PACKAGE__->meta->make_immutable;
1;
