package OpenSearch::Index::UpdateSettings;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
no warnings qw(experimental::signatures);

with 'OpenSearch::Parameters::Index::UpdateSettings';

has '_base' => (
  is       => 'rw',
  isa      => 'OpenSearch::Base',
  required => 1,
);

sub execute($self) {
  my $res = $self->_base->_put( $self, [ $self->index, '_settings' ] );
}

__PACKAGE__->meta->make_immutable;
1;
