package OpenSearch::Cluster::GetDecommissionAwareness;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Cluster::GetDecommissionAwareness';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_get( $self, [ '_cluster', 'decommission', 'awareness', $self->attribute, '_status' ] );
}

__PACKAGE__->meta->make_immutable;
1;
