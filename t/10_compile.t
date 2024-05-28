use strict;
use Test::More 0.98;

use_ok $_ for qw(
  OpenSearch
  OpenSearch::Index
  OpenSearch::Search
  OpenSearch::Remote
  OpenSearch::Document
  OpenSearch::Cluster
  OpenSearch::Response
);

done_testing;

