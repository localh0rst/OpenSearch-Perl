package OpenSearch::Index;
use strict;
use warnings;
use Moose;
use feature qw(signatures);
use Data::Dumper;

use OpenSearch::Index::Alias;

sub alias { shift; return ( OpenSearch::Index::Alias->new(@_) ); }

1;
__END__

=encoding utf-8

=head1 NAME

C<OpenSearch::Index> - OpenSearch Index API

=head1 SYNOPSIS

    use strict;
    use warnings;
    use OpenSearch;

    my $opensearch = OpenSearch->new(...);

    my $index_api = $opensearch->index;

=head1 DESCRIPTION

This is the Module for the OpenSearch Index API. The following Endpoints
are currently supported:

=over 4

=item * alias [L<OpenSearch::Index::Alias>]

=back

=head1 METHODS

=head2 alias

returns a new OpenSearch::Index::Alias object. 

  my $index_api = $opensearch->index;
  my $res = $index_api->alias(...)->set;
  my $res = $index_api->alias(...)->get;

=head1 LICENSE

Copyright (C) localh0rst.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

localh0rst E<lt>git@fail.ninjaE<gt>

=cut

