package OpenSearch::Index::Stats;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Index::Stats';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_get( $self, [ ( $self->index // () ), '_stats', ( $self->metric // () ) ] );
}

__PACKAGE__->meta->make_immutable;
1;
