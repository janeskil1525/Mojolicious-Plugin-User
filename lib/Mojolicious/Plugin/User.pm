package Mojolicious::Plugin::User;
use Mojo::Base 'Mojolicious::Plugin';

use Daje::Model::User;

our $VERSION = '0.02';

has 'pg';
has 'user';

sub register {
  my ($self, $app, $conf) = @_;
  
  $self->pg($conf->{pg});
	$self->user(Daje::Model::User->new()->pg($self->pg)->init());
	
	$app->helper(user => sub {$self});

}

sub save_user_p{
	my($self, $user) = @_;
  
  return $self->user->save_user_p($user);
}

sub login{
    my($self, $user, $password) = @_;
    
    return $self->user->login($user, $password);
}

sub authenticate{
    my ($self, $token) = @_;
    
    return $self->user->login($token);
}

sub load_user_p{
    my($self, $users_pkey) = @_;
    
    return $self->user->load_user_p($users_pkey);
}

sub get_company_fkey_from_token_p{
	my ($self, $token) = @_;
  
  return $self->user->get_company_fkey_from_token_p($token);
}

sub isSupport{
    my ($self, $token) = @_;
    
    return $self->user->isSupport($token);
}
1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::User - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('User');

  # Mojolicious::Lite
  plugin 'User';

=head1 DESCRIPTION

L<Mojolicious::Plugin::User> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::User> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicious.org>.

=cut
