package OpenSearch::Index::GetAliases;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

#with 'OpenSearch::Parameters::Index::GetAliases';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_get( $self, ['_aliases'] );
}

__PACKAGE__->meta->make_immutable;
1;
