[![Actions Status](https://github.com/localh0rst/OpenSearch-Perl/actions/workflows/test.yml/badge.svg)](https://github.com/localh0rst/OpenSearch-Perl/actions)
# NAME

OpenSearch - It's new $module

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

    my $s = $self->search(
      index => 'my_index',
      query => {
        bool => {
          must => [ { range => { '@timestamp' => { gte => 'now-1d' } } } ],
        }
      }
    );

    # Blocking
    my $response = $s->execute; 
    # Non Blocking - Returns a Mojo::Promise;
    my $promise = $s->execute_p->then(...)->catch(...);

    # OR you can do it like this:
    my $response = $s->search
      ->index('my_index')
      ->query({ 
        bool => { 
          must => [ { range => { '@timestamp' => { gte => 'now-1d' } } } ] 
        } 
      }
    )->execute;

# DESCRIPTION

OpenSearch is ...

# LICENSE

Copyright (C) localh0rst.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

localh0rst <git@fail.ninja>
