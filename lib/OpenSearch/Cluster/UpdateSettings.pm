package OpenSearch::Cluster::UpdateSettings;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Cluster::UpdateSettings';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_put( $self, [ '_cluster', 'settings' ] );
}

__PACKAGE__->meta->make_immutable;
1;
