package OpenSearch::Cluster;
use strict;
use warnings;
use Moose;
use Data::Dumper;

use OpenSearch::Cluster::GetSettings;
use OpenSearch::Cluster::UpdateSettings;
use OpenSearch::Cluster::Health;
use OpenSearch::Cluster::Stats;
use OpenSearch::Cluster::AllocationExplain;
use OpenSearch::Cluster::GetDecommissionAwareness;
use OpenSearch::Cluster::SetDecommissionAwareness;
use OpenSearch::Cluster::DelDecommissionAwareness;
use OpenSearch::Cluster::GetRoutingAwareness;
use OpenSearch::Cluster::DelRoutingAwareness;
use OpenSearch::Cluster::SetRoutingAwareness;
use feature qw(signatures);
no warnings qw(experimental::signatures);

has '_base' => (
  is  => 'rw',
  isa => 'OpenSearch::Base',
  required => 1,
);

sub get_settings( $self, @params ) {
  return ( OpenSearch::Cluster::GetSettings->new(@params, _base => $self->_base)->execute );
}

sub update_settings( $self, @params ) {
  return ( OpenSearch::Cluster::UpdateSettings->new(@params, _base => $self->_base)->execute );
}

sub health( $self, @params ) {
  return ( OpenSearch::Cluster::Health->new(@params, _base => $self->_base)->execute );
}

sub stats( $self, @params ) {
  return ( OpenSearch::Cluster::Stats->new(@params, _base => $self->_base)->execute );
}

sub allocation_explain( $self, @params ) {
  return ( OpenSearch::Cluster::AllocationExplain->new(@params, _base => $self->_base)->execute );
}

# TODO: Look more into Decommission Endpoints...
sub get_decommission_awareness( $self, @params ) {
  return ( OpenSearch::Cluster::GetDecommissionAwareness->new(@params, _base => $self->_base)->execute );
}

sub set_decommission_awareness( $self, @params ) {
  return ( OpenSearch::Cluster::SetDecommissionAwareness->new(@params, _base => $self->_base)->execute );
}

sub del_decommission_awareness( $self, @params ) {
  return ( OpenSearch::Cluster::DelDecommissionAwareness->new(@params, _base => $self->_base)->execute );
}

sub get_routing_awareness( $self, @params ) {
  return ( OpenSearch::Cluster::GetRoutingAwareness->new(@params, _base => $self->_base)->execute );
}

sub del_routing_awareness( $self, @params ) {
  return ( OpenSearch::Cluster::DelRoutingAwareness->new(@params, _base => $self->_base)->execute );
}

sub set_routing_awareness( $self, @params ) {
  return ( OpenSearch::Cluster::SetRoutingAwareness->new(@params, _base => $self->_base)->execute );
}

__PACKAGE__->meta->make_immutable;
1;

__END__

=head1 NAME

C<OpenSearch::Cluster> - OpenSearch Cluster API Endpoints

=head1 SYNOPSIS

  use OpenSearch;

  my $os = OpenSearch->new(...);
  my $cluster = $os->cluster;

  $cluster->put_settings(
    persistent => {
      'indices.recovery.max_bytes_per_sec' => '50mb'
    },
    transient => {
      'cluster.routing.allocation.enable' => 'all'
    }
    timeout => '30s'
  );

  my $health = $cluster->health(...);

=head1 DESCRIPTION

This module provides an interface to the OpenSearch Cluster API endpoints.
If i read the documentation correctly, all endpoints are supported. For
a list of avaialable parameters see the official documentation.

  my $os = OpenSearch->new(
    ...
    async => 1
  );

all methods return a L<Mojo::Promise> object.

=head1 METHODS

=head2 get_settings

  $cluster->get_settings;

=head2 put_settings

  $cluster->put_settings(
    persistent => {
      'indices.recovery.max_bytes_per_sec' => '50mb'
    },
    transient => {
      'cluster.routing.allocation.enable' => 'all'
    }
    timeout => '30s'
  );

=head2 health

  $cluster->health(...);

=head2 stats

  $cluster->stats(...);

=head2 allocation_explain

  $cluster->allocation_explain(...);

=head2 get_decommission_awareness [UNTESTED]

  $cluster->get_decommission_awareness(...);

=head2 set_decommission_awareness [UNTESTED]

  $cluster->set_decommission_awareness(...);

=head2 del_decommission_awareness [UNTESTED]

  $cluster->del_decommission_awareness(...);

=head2 get_routing_awareness [UNTESTED]

  $cluster->get_routing_awareness(...);

=head2 del_routing_awareness [UNTESTED]

  $cluster->del_routing_awareness(...);

=head2 set_routing_awareness [UNTESTED]

  $cluster->set_routing_awareness(...);

=head1 AUTHOR

C<OpenSearch> was written by Sebastian Grenz, C<< <git at fail.ninja> >>
