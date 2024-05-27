package OpenSearch::Index;
use strict;
use warnings;
use feature qw(signatures);
use Moose;
use Data::Dumper;
use OpenSearch::Index::SetAliases;
use OpenSearch::Index::GetAliases;

use OpenSearch::Index::ClearCache;

use OpenSearch::Index::Clone;

use OpenSearch::Index::Close;

use OpenSearch::Index::Create;

use OpenSearch::Index::SetMappings;
use OpenSearch::Index::GetMappings;

use OpenSearch::Index::GetDangling;
use OpenSearch::Index::ImportDangling;
use OpenSearch::Index::DeleteDangling;

use OpenSearch::Index::Delete;

use OpenSearch::Index::Get;

#use OpenSearch::Index::GetSettings;
#use OpenSearch::Index::ForceMerge;
use OpenSearch::Index::Exists;

#use OpenSearch::Index::Open;
#use OpenSearch::Index::Refresh;
#use OpenSearch::Index::Shrink;
#use OpenSearch::Index::Split;
#use OpenSearch::Index::Stats;
#use OpenSearch::Index::UpdateSettings;

sub create( $self, @params ) {
  return ( OpenSearch::Index::Create->new(@params)->execute );
}

sub delete( $self, @params ) {
  return ( OpenSearch::Index::Delete->new(@params)->execute );
}

sub aliases( $self, @params ) {
  return ( OpenSearch::Index::SetAliases->new(@params)->execute );
}

sub get_aliases( $self, @params ) {
  return ( OpenSearch::Index::GetAliases->new(@params)->execute );
}

sub clear_cache( $self, @params ) {
  return ( OpenSearch::Index::ClearCache->new(@params)->execute );
}

sub clone( $self, @params ) {
  return ( OpenSearch::Index::Clone->new(@params)->execute );
}

sub close( $self, @params ) {
  return ( OpenSearch::Index::Close->new(@params)->execute );
}

sub set_mappings( $self, @params ) {
  return ( OpenSearch::Index::SetMappings->new(@params)->execute );
}

sub get_mappings( $self, @params ) {
  return ( OpenSearch::Index::GetMappings->new(@params)->execute );
}

sub get_dangling( $self, @params ) {
  return ( OpenSearch::Index::GetDangling->new(@params)->execute );
}

sub import_dangling( $self, @params ) {
  return ( OpenSearch::Index::ImportDangling->new(@params)->execute );
}

sub delete_dangling( $self, @params ) {
  return ( OpenSearch::Index::DeleteDangling->new(@params)->execute );
}

sub get( $self, @params ) {
  return ( OpenSearch::Index::Get->new(@params)->execute );
}

sub exists( $self, @params ) {
  return ( OpenSearch::Index::Exists->new(@params)->execute );
}

1;
