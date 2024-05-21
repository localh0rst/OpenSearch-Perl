package OpenSearch::Search;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
use Data::Dumper;

use OpenSearch::Search::Search;
use OpenSearch::Search::Scroll;

sub search { shift; return ( OpenSearch::Search::Search->new(@_) ); }
sub scroll { shift; return ( OpenSearch::Search::Scroll->new(@_) ); }

1;
__END__

=encoding utf-8

=head1 NAME

C<OpenSearch::Search> - OpenSearch Search API

=head1 SYNOPSIS

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

    my $search_api = $opensearch->search;

=head1 DESCRIPTION

This is the Module for the OpenSearch Search API. The following Endpoints
are currently supported:

=over 4

=item * Search [L<OpenSearch::Search::Search>] (GET /<target-index>/_search)

=item * Scroll [L<OpenSearch::Search::Scroll>] (GET /_search/scroll=10m)

=back

=head1 METHODS

=head2 search

returns a new OpenSearch::Search::Search object. 

  my $search_api = $opensearch->search;
  my $res = $search_api->search(
    index => 'my_index',
    query => {
      match_all => {}
    }
  )->get;

=head2 health

returns a new OpenSearch::Search::Scroll object

  my $health = $opensearch->search->scroll;

=head1 LICENSE

Copyright (C) localh0rst.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

localh0rst E<lt>git@fail.ninjaE<gt>

=cut

