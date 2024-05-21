package OpenSearch::Parameters::Body::search_routing;
use Moose::Role;

has "search_routing" => (
  is            => "rw",
  isa           => "Str",
  documentation => {
    encode_func => undef,
    required    => undef,
  }
);

around "search_routing" => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
