use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::User',
  VERSION_FROM => 'lib/Mojolicious/Plugin/User.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {
    'Mojolicious' => '7.72',
    'Daje::Model::User' => 0,
    },
  test         => {TESTS => 't/*.t'}
);
