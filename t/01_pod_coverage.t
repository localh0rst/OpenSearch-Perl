use strict;
use Test::More 0.98;
use Test::Pod::Coverage;

pod_coverage_ok( 'OpenSearch', { also_private => [qr/^[A-Z_]+$/], }, 'OpenSearch is okay' );

done_testing;

