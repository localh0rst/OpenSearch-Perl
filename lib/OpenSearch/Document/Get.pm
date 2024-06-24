package OpenSearch::Document::Get;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Document::Get';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 0,
  lazy     => 1,
  default  => sub { OpenSearch::Base->instance; }
);

sub execute($self) {
  my $res = $self->_base->_get( $self, [ $self->index, '_doc', ( $self->id ? $self->id : () ) ] );
}

__PACKAGE__->meta->make_immutable;
1;
