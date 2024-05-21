package OpenSearch::Parameters::Body::indicies;
use Moose::Role;

has "indicies" => (
  is            => "rw",
  isa           => "ArrayRef",
  documentation => {
    encode_func => undef,
    required    => undef,
  }
);

around "indicies" => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
