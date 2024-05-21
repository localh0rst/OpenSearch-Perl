package OpenSearch::Parameters::IndexAlias;
use Moose::Role;

with
  "OpenSearch::Parameters::URL::cluster_manager_timeout",
  "OpenSearch::Parameters::URL::timeout",

  "OpenSearch::Parameters::Body::actions",

  # The Documentatiuon is unclear. Even though these are documented,
  # it seem that they are part of the actions-array instead of the body

  #"OpenSearch::Parameters::Body::index",
  #"OpenSearch::Parameters::Body::indicies",
  #"OpenSearch::Parameters::Body::alias",
  #"OpenSearch::Parameters::Body::aliases",
  #"OpenSearch::Parameters::Body::filter",
  #"OpenSearch::Parameters::Body::is_hidden",
  #"OpenSearch::Parameters::Body::must_exist",
  #"OpenSearch::Parameters::Body::is_write_index",
  #"OpenSearch::Parameters::Body::routing",
  #"OpenSearch::Parameters::Body::index_routing",
  #"OpenSearch::Parameters::Body::search_routing";

  # This is valid according to: https://opensearch.org/docs/latest/opensearch/index-alias/
  "OpenSearch::Parameters::Path::index", "OpenSearch::Parameters::Path::alias";

1;
