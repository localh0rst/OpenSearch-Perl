package OpenSearch::Remote;
use strict;
use warnings;
use Moose;
use Data::Dumper;
use OpenSearch::Remote::Info;
use feature qw(signatures);
no warnings qw(experimental::signatures);

sub info( $self, @params ) {
  return ( OpenSearch::Remote::Info->new(@params)->execute );
}

__PACKAGE__->meta->make_immutable;
1;
