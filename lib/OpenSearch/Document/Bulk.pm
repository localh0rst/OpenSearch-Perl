package OpenSearch::Document::Bulk;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Document::Bulk';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 0,
  lazy     => 1,
  default  => sub { OpenSearch::Base->instance; }
);

sub execute($self) {
  my $res = $self->_base->_post( $self, [ ( $self->index // () ), '_bulk' ] );
}

__PACKAGE__->meta->make_immutable;
1;
