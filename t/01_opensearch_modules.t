use strict;
use Test::More 0.98;
use Data::Dumper;

plan skip_all => 'To test Modules, set OS_HOST, OS_USER, OS_PASS, OS_INDEX in ENV'
  unless $ENV{OS_HOST} && $ENV{OS_USER} && $ENV{OS_PASS} && $ENV{OS_INDEX};

my $host  = $ENV{OS_HOST};
my $user  = $ENV{OS_USER};
my $pass  = $ENV{OS_PASS};
my $index = $ENV{OS_INDEX};

print Dumper \%ENV;

use OpenSearch;

my $os = OpenSearch->new(
  user            => $user,
  pass            => $pass,
  hosts           => [$host],
  secure          => 1,
  allow_insecure  => 1,
  async           => 0,
  pool_count      => 10,
  max_connections => 50,
);

isa_ok $os, 'OpenSearch', 'OpenSearch object created';

done_testing;

