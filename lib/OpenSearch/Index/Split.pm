package OpenSearch::Index::Split;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Index::Split';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_post( $self, [ $self->index, '_split', $self->target ] );
}

__PACKAGE__->meta->make_immutable;
1;
