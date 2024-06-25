package OpenSearch::Remote::Info;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_get( $self, [ '_remote', 'info' ] );
}

__PACKAGE__->meta->make_immutable;
1;
