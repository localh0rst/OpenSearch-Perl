
  package OpenSearch::Parameters::Body::scroll_id;
  use Moose::Role;

  has "scroll_id" => (
    is            => "rw",
    isa           => "Str",
    documentation => {
      encode_func => undef,
      required    => undef,
    }
  );

  around "scroll_id" => sub {
    my $orig = shift;
    my $self = shift;

    if (@_) {
      $self->$orig(@_);
      return ($self);
    }
    return ( $self->$orig );
  };

  1;
