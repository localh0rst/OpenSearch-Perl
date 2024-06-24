package OpenSearch::Search;
use strict;
use warnings;
use Moose;
use Data::Dumper;
use OpenSearch::Search::Search;
use OpenSearch::Search::Count;
use feature qw(signatures);
no warnings qw(experimental::signatures);

sub search( $self, @params ) {
  return ( OpenSearch::Search::Search->new(@params)->execute );
}

sub count( $self, @params ) {
  return ( OpenSearch::Search::Count->new(@params)->execute );
}

1;
