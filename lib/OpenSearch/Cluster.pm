package OpenSearch::Cluster;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
use Data::Dumper;

use OpenSearch::Cluster::Settings;
use OpenSearch::Cluster::Health;
use OpenSearch::Cluster::Stats;
use OpenSearch::Cluster::Allocation;

sub get_settings( $self, @params ) {
  return ( OpenSearch::Cluster::Settings->new->get(@params) );
}

sub put_settings( $self, @params ) {
  return ( OpenSearch::Cluster::Settings->new->set(@params) );
}

sub health( $self, @params ) {
  return ( OpenSearch::Cluster::Health->new->get(@params) );
}

sub stats( $self, @params ) {
  return ( OpenSearch::Cluster::Stats->new->get(@params) );
}

sub allocation_explain( $self, @params ) {
  return ( OpenSearch::Cluster::Allocation->new->explain(@params) );
}

1;
