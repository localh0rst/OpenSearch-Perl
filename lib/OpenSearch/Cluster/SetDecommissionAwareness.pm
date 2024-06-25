package OpenSearch::Cluster::SetDecommissionAwareness;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Cluster::SetDecommissionAwareness';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_put( $self, [ '_cluster', 'decommission', 'awareness', $self->attribute, $self->value ] );
}

__PACKAGE__->meta->make_immutable;
1;
