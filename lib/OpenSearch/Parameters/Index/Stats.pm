package OpenSearch::Parameters::Index::Stats;
use strict;
use warnings;
use feature qw(state);
use Types::Standard qw(Str Bool HashRef Enum);
use Moo::Role;

with 'OpenSearch::Parameters';

my $StatsMetrics = Enum[
  qw(_all completion docs fielddata flush get indexing merge query_cache refresh refresh_cache search segments store translog warmer)
];

has 'index' => (
  is          => 'rw',
  isa         => Str,
);

has 'metric' => (
  is  => 'rw',
  isa => Str,
  # TODO
  #isa         => 'ArrayRef[StatsMetrics]|Str',
  reader => 'get_metrics',
);

has 'expand_wildcards' => (
  is          => 'rw',
  isa         => Str
);

has 'fields' => (
  is          => 'rw',
  isa         => Str,
);

has 'completions_fields' => (
  is          => 'rw',
  isa         => Str,
);

has 'fielddata_fields' => (
  is          => 'rw',
  isa         => Str,
);

has 'forbid_closed_indices' => (
  is          => 'rw',
  isa         => Bool,
);

has 'groups' => (
  is          => 'rw',
  isa         => Str,
);

has 'level' => (
  is          => 'rw',
  isa         => Str,
);

has 'include_segment_file_sizes' => (
  is          => 'rw',
  isa         => Bool,
);

# TODO: Handle ARRAYREF getter for path parameters. i.e.: metrics
around [
  qw/index metric expand_wildcards fields completions_fields fielddata_fields forbid_closed_indices groups level include_segment_file_sizes
  /
] => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

sub api_spec {
  state $s = +{
    index => {
      encode_func => 'as_is',
      type        => 'path',
    },
    metric => {
      encode_func => 'concat_comma',
      type        => 'path',
    },
    expand_wildcards => {
      encode_func => 'as_is',
      type        => 'url',
    },
    fields => {
      encode_func => 'as_is',
      type        => 'url',
    },
    completions_fields => {
      encode_func => 'as_is',
      type        => 'url',
    },
    fielddata_fields => {
      encode_func => 'as_is',
      type        => 'url',
    },
    forbid_closed_indices => {
      encode_func => 'encode_bool',
      type        => 'url',
    },
    groups => {
      encode_func => 'as_is',
      type        => 'url',
    },
    level => {
      encode_func => 'as_is',
      type        => 'url',
    },
    include_segment_file_sizes => {
      encode_func => 'encode_bool',
      type        => 'url',
    }
  };
}

1;
