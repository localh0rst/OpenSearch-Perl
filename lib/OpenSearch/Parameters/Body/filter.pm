package OpenSearch::Parameters::Body::filter;
use Moose::Role;

has "filter" => (
  is            => "rw",
  isa           => "HashRef",
  documentation => {
    encode_func => undef,
    required    => undef,
  }
);

around "filter" => sub {
  my $orig = shift;
  my $self = shift;

  die('FILTER NOT YET KNOWN TO ME. SORRY!');

  if (@_) {
    $self->$orig(@_);
    return ($self);
  }
  return ( $self->$orig );
};

1;
