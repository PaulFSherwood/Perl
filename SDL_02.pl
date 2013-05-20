#!/usr/bin/perl

use strict;
use warnings;

use SDL;
use SDLx::App;

my $app = SDLx::App->
    new
    (
        width  => 400,
        height => 400,
        title  => 'Hello World'
    );
$app->update;

sleep(5);
