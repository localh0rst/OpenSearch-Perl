package OpenSearch::Index::SetAliases;
use strict;
use warnings;
use feature qw(signatures);
use Moose;

with 'OpenSearch::Parameters::Index::SetAliases';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 0,
  lazy     => 1,
  default  => sub { OpenSearch::Base->instance; }
);

sub execute($self) {
  my $res = $self->_base->_post( $self, ['_aliases'] );
}

1;
