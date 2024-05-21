package OpenSearch::Parameters::Body::index_routing;
use Moose::Role;

has "index_routing" => (
  is            => "rw",
  isa           => "Str",
  documentation => {
    encode_func => undef,
    required    => undef,
  }
);

around "index_routing" => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
