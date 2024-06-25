package OpenSearch::Search::Search;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Search::Search';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_get( $self, [ ( $self->index // () ),, '_search' ] );
}

__PACKAGE__->meta->make_immutable;
1;
