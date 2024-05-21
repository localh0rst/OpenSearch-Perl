package OpenSearch::Parameters::Body::aliases;
use Moose::Role;

has "aliases" => (
  is            => "rw",
  isa           => "ArrayRef",
  documentation => {
    encode_func => undef,
    required    => undef,
  }
);

around "aliases" => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
