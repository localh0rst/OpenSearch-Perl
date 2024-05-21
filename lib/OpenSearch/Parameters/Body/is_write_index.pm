package OpenSearch::Parameters::Body::is_write_index;
use Moose::Role;

has "is_write_index" => (
  is            => "rw",
  isa           => "Bool",
  documentation => {
    encode_func => "encode_bool",
    required    => undef,
  }
);

around "is_write_index" => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
