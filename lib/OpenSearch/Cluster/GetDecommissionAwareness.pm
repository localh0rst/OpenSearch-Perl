package OpenSearch::Cluster::GetDecommissionAwareness;
use strict;
use warnings;
use feature qw(signatures);
use Moose;

with 'OpenSearch::Parameters::Cluster::GetDecommissionAwareness';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 0,
  lazy     => 1,
  default  => sub { OpenSearch::Base->instance; }
);

sub execute($self) {
  my $res =
    $self->_base->_get( $self, [ '_cluster', 'decommission', 'awareness', $self->awareness_attribute, '_status' ] );
}

1;
