#!/usr/bin/env perl
use strict;
use warnings;
use feature qw/say/;
use lib '../lib/';
use OpenSearch;
use OpenSearch::Search::Search;
use OpenSearch::Document::Index;
use Time::HiRes qw/time/;
use Data::Dumper;

# Dont worry, no production secrets here ;)
my $user            = 'admin';
my $pass            = '!§$%!Nn123!?))';
my $host            = 'localhost:9200';
my $benchmark_index = "os-perl-benchmark-index";
my $pool_count      = 10;
my $max_connections = 50;
my $run_for         = 10;                          # Seconds to run this benchmark
my $bulk_doc_count  = 500;

my $start            = time;
my $doc_count_before = '';

my $os = OpenSearch->new(
  user            => $user,
  pass            => $pass,
  hosts           => [$host],
  secure          => 1,
  allow_insecure  => 1,
  async           => 1,
  pool_count      => $pool_count,
  max_connections => $max_connections,
);

my $index_api  = $os->index;
my $search_api = $os->search;
my $doc        = $os->document;

$index_api->delete( index => $benchmark_index )->then( sub {
  $index_api->create(
    index    => $benchmark_index,
    settings => {
      index => {
        number_of_shards   => 1,
        number_of_replicas => 0
      }
    },
  )->then( sub {
    $search_api->count( index => $benchmark_index )->then( sub {
      my $res = shift;
      $doc_count_before = $res->data->{count};
    } );

  } );

} );

my $done = 0;

Mojo::IOLoop->timer(
  $run_for => sub {
    my $timer = shift;
    $done = 1;
    $index_api->refresh( index => $benchmark_index )->then( sub {
      $search_api->count( index => $benchmark_index )->then( sub {
        my $res      = shift;
        my $duration = time - $start;
        $done = 1;
        print "Pool count: $pool_count\n";
        print "Max connections: $max_connections\n";
        print "Bulk doc count: $bulk_doc_count\n";

        print "Count before: $doc_count_before\n";
        print "Count after: " . $res->data->{count} . "\n";
        print "Duration: " . $duration . "\n";
        print "Docs per second: " . ( $res->data->{count} - $doc_count_before ) / $duration . "\n";
        exit(0);
      } );
    } );
  }
);

while ( !$done ) {
  my $docs = [];
  for ( 1 .. $bulk_doc_count ) {
    push(
      @{$docs},
      { create => {} },
      {
        user_agent => {
          name   => "Chrome",
          device => {
            name => "Other"
          },

          os => {
            full    => "Windows 10",
            name    => "Windows",
            version => "10"
          },
          version => "124.0.0.0"
        },
        http => {
          port            => 443,
          virtual_host    => "my-nonexistent-vhost.com",
          src_ip          => "127.0.0.1",
          referrer        => "https://my-nonexistent-vhost.com/nothing-here",
          response_code   => 200,
          http_method     => "GET",
          url             => "/this/was/definetly/no/pr0n",
          http_version    => "1.0",
          body_sent_bytes => 909,
          access_time     => "28/May/2024:13:35:08 +0200"
        },
        src_geo => {
          ip  => "127.0.0.1",
          geo => {
            country_iso_code => "IL",
            region_iso_code  => "IL-JM",
            continent_code   => "AS",
            city_name        => "Jerusalem",
            location         => {
              lat => 31.7808,
              lon => 35.2287
            },
            region_name  => "Jerusalem",
            timezone     => "Asia/Jerusalem",
            country_name => "Israel"
          }
        },
        log => {
          process => { "name" => "apache2" },
          syslog  => {
            priority => 181,
            severity => {
              name => "Notice",
              code => 5
            },
            facility => {
              name => "local6",
              code => 22
            }
          }
        },
        user_name => "-",
        useragent =>
"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
        host => {
          ip       => "127.0.0.1",
          hostname => "my-source-host"
        },
      }
    );
  }

  my $res = $doc->bulk(
    index => $benchmark_index,
    docs  => $docs
  )->then( sub {
    my $res = shift;
  } )->catch( sub { die(shift) } );

}

Mojo::IOLoop->start unless Mojo::IOLoop->is_running;
