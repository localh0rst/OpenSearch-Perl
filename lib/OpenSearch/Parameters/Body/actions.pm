package OpenSearch::Parameters::Body::actions;
use Moose::Role;

has "actions" => (
  is            => "rw",
  isa           => "ArrayRef",
  documentation => {
    encode_func => undef,
    required    => undef,
  }
);

around "actions" => sub {
  my $orig = shift;
  my $self = shift;

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
