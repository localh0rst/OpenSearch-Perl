[![Actions Status](https://github.com/localh0rst/OpenSearch-Perl/actions/workflows/test.yml/badge.svg)](https://github.com/localh0rst/OpenSearch-Perl/actions)
# NAME

`OpenSearch` - A Perl client for OpenSearch (https://opensearch.org/)

# SYNOPSIS

    use strict;
    use warnings;
    use OpenSearch;

    my $opensearch = OpenSearch->new(
      user => 'admin',
      pass => 'admin',
      hosts => ['http://localhost:9200'],
      secure => 0,
      allow_insecure => 1,
    );

# DESCRIPTION

This module is a Perl client for OpenSearch (https://opensearch.org/).
It currently only supports a small subset of the OpenSearch API.

# IMPORTANT

This module is still in development and should not be used in production
unless you know what you are doing. The API is subject to change.

Keeep in mind that all attributes are cached in the class instance and will
be reused for the next request. If you want to clear all attributes after
a request you can set the clear\_attrs attribute to 1. Another possibility
is to create a new instance of the class for each request.

The preferred way is to create a new class instance for each request:

    my $s = OpenSearch->new(...)->search;

    foreach (...) {
      my $response = $s
        ->search(query => {...})
        ->get;
    }

    my $opensearch = OpenSearch->new(...);
    my $search_api = $opensearch->search;
    my $s = $search_api->search;

    foreach ... (@...) {
      my $response = $search
        ->query(...)
        ->get;
    }

The latter is only safe to use if you know that all other attributes are
the same for every request. It is okay for situations like if you want to 
use \`search\_after\` or \`scroll\`.

# ATTRIBUTES

## user

The username to use for authentication

## pass

The password to use for authentication

## hosts

An arrayref of hosts to connect to

## secure

Boolean to indicate if the connection should be secure (https)

## allow\_insecure

Boolean to indicate if insecure connections are allowed

## pool\_count

The number of connections to pool

## clear\_attrs

Boolean to indicate if attributes should be cleared after a request.
By default this is set to false. Usualy all attributes are cached in
the class instance and will be reused for the next request. Switch
this to 1 if you want to clear all attributes after a request. Another
possibility is to create a new instance of the class for each request.

## ca\_cert

Path to a CA certificate file \[UNTESTED\]

## client\_cert

Path to a client certificate file \[UNTESTED\]

## client\_key

Path to a client key file \[UNTESTED\]

# METHODS

## cluster

returns a new OpenSearch::Cluster object

    my $cluster = $opensearch->cluster;

## remote

returns a new OpenSearch::Remote object

    my $remote = $opensearch->remote;

## search

returns a new OpenSearch::Search object

    my $search = $opensearch->search;

## index

returns a new OpenSearch::Index object

    my $search = $opensearch->index;
  =head1 LICENSE

Copyright (C) localh0rst.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

localh0rst <git@fail.ninja>
