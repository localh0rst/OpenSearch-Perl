package OpenSearch::Security;
use strict;
use warnings;
use Moo;
use Types::Standard qw(InstanceOf);
use Data::Dumper;
use OpenSearch::Security::Whoami;
use feature qw(signatures);
no warnings qw(experimental::signatures);

has '_base' => (
  is       => 'rw',
  isa      => InstanceOf ['OpenSearch::Base'],
  required => 1,
);

sub whoami( $self, @params ) {
  return ( OpenSearch::Security::Whoami->new( @params, _base => $self->_base )->execute );
}

1;
