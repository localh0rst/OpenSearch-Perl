package OpenSearch::Response;
use strict;
use warnings;
use Moose;
use feature qw(signatures);

has '_response' => ( is => 'rw', required => 1 );
has 'success'   => ( is => 'rw', isa      => 'Bool', required => 0 );
has 'code'      => ( is => 'rw', isa      => 'Int',  required => 0 );
has 'data'      => ( is => 'rw', required => 0 );

sub BUILD( $self, @rest ) {
  $self->success( $self->_response->code >= 200 && $self->_response->code < 300 );

  $self->code( $self->_response->code );
  $self->data( $self->_response->json );
}

1;
