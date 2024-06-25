package OpenSearch::Search::Count;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Search::Count';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_get( $self, [ ( $self->index // () ),, '_count' ] );
}

__PACKAGE__->meta->make_immutable;
1;
