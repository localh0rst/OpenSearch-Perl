package OpenSearch::Index::GetSettings;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Index::GetSettings';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 0,
  lazy     => 1,
  default  => sub { OpenSearch::Base->instance; }
);

sub execute($self) {
  my $res = $self->_base->_get( $self, [ ( $self->index // () ), '_settings', ( $self->setting // () ) ] );
}

__PACKAGE__->meta->make_immutable;
1;
