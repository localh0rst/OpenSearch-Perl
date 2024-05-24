package OpenSearch::Index;
use strict;
use warnings;
use feature qw(signatures);
use Moose;
use Data::Dumper;
use OpenSearch::Index::Aliases;
use OpenSearch::Index::GetAliases;
use OpenSearch::Index::ClearCache;
use OpenSearch::Index::Clone;
use OpenSearch::Index::Close;
use OpenSearch::Index::Create;
use OpenSearch::Index::Mappings;
use OpenSearch::Index::GetMappings;

#use OpenSearch::Index::Dangling;
use OpenSearch::Index::Delete;

#use OpenSearch::Index::Get;
#use OpenSearch::Index::GetSettings;
#use OpenSearch::Index::ForceMerge;
#use OpenSearch::Index::Exists;
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
  return ( OpenSearch::Index::Aliases->new(@params)->execute );
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

sub mappings( $self, @params ) {
  return ( OpenSearch::Index::Mappings->new(@params)->execute );
}

sub get_mappings( $self, @params ) {
  return ( OpenSearch::Index::GetMappings->new(@params)->execute );
}

1;
