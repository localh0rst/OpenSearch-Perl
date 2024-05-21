package OpenSearch::Parameters::Body::must_exist;
use Moose::Role;

has "must_exist" => (
  is            => "rw",
  isa           => "Bool",
  documentation => {
    encode_func => "encode_bool",
    required    => undef,
  }
);

around "must_exist" => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
