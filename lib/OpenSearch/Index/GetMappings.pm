package OpenSearch::Index::GetMappings;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Index::GetMappings';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 0,
  lazy     => 1,
  default  => sub { OpenSearch::Base->instance; }
);

sub execute($self) {
  my $res =
    $self->_base->_get( $self, [ $self->index, '_mapping', ( $self->field ? ( 'field', $self->field ) : () ) ] );
}

__PACKAGE__->meta->make_immutable;
1;
