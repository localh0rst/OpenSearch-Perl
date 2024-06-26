package OpenSearch::Cluster::DelDecommissionAwareness;
use strict;
use warnings;
use Moo;
use Types::Standard qw(InstanceOf);
use feature qw(signatures);
no warnings qw(experimental::signatures);

#with 'OpenSearch::Parameters::Cluster::DelDecommissionAwareness';

has '_base' => (
  is       => 'rw',
  isa      => InstanceOf['OpenSearch::Base'],
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_delete( $self, [ '_cluster', 'decommission', 'awareness' ] );
}


1;
