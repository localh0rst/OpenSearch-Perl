package OpenSearch::Parameters::Path::alias;
use Moose::Role;

has "alias" => (
  is            => "rw",
  isa           => "Str",
  documentation => {
    encode_func => undef,
    required    => undef,
  }
);

around "alias" => sub {
  my $orig = shift;
  my $self = shift;
  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
