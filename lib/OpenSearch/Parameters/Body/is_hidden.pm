package OpenSearch::Parameters::Body::is_hidden;
use Moose::Role;

has "is_hidden" => (
  is            => "rw",
  isa           => "Bool",
  documentation => {
    encode_func => "encode_bool",
    required    => undef,
  }
);

around "is_hidden" => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
