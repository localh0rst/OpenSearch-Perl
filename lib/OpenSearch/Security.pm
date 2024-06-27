package OpenSearch::Security;
use strict;
use warnings;
use Moo;
use Types::Standard qw(InstanceOf);
use Data::Dumper;
use OpenSearch::Security::Whoami;
use OpenSearch::Security::SSLInfo;
use OpenSearch::Security::PermissionsInfo;
use OpenSearch::Security::AuthInfo;
use OpenSearch::Security::GetCerts;
use OpenSearch::Security::ReloadTransportCerts;
use OpenSearch::Security::ReloadHTTPCerts;
use OpenSearch::Security::GetAccountDetails;
use OpenSearch::Security::ChangePassword;
use OpenSearch::Security::GetUser;
use feature qw(signatures);
no warnings qw(experimental::signatures);

has '_base' => (
  is       => 'rw',
  isa      => InstanceOf ['OpenSearch::Base'],
  required => 1,
);

sub whoami( $self, @params ) {
  return ( OpenSearch::Security::Whoami->new( @params, _base => $self->_base )->execute );
}

sub sslinfo( $self, @params ) {
  return ( OpenSearch::Security::SSLInfo->new( @params, _base => $self->_base )->execute );
}

sub permissions_info( $self, @params ) {
  return ( OpenSearch::Security::PermissionsInfo->new( @params, _base => $self->_base )->execute );
}

sub auth_info( $self, @params ) {
  return ( OpenSearch::Security::AuthInfo->new( @params, _base => $self->_base )->execute );
}

sub get_certs( $self, @params ) {
  return ( OpenSearch::Security::GetCerts->new( @params, _base => $self->_base )->execute );
}

sub reload_transport_certs( $self, @params ) {
  return ( OpenSearch::Security::ReloadTransportCerts->new( @params, _base => $self->_base )->execute );
}

sub reload_http_certs( $self, @params ) {
  return ( OpenSearch::Security::ReloadHTTPCerts->new( @params, _base => $self->_base )->execute );
}

sub get_account_details( $self, @params ) {
  return ( OpenSearch::Security::GetAccountDetails->new( @params, _base => $self->_base )->execute );
}

sub change_password( $self, @params ) {
  return ( OpenSearch::Security::ChangePassword->new( @params, _base => $self->_base )->execute );
}

sub get_user( $self, @params ) {
  return ( OpenSearch::Security::GetUser->new( @params, _base => $self->_base )->execute );
}

1;
