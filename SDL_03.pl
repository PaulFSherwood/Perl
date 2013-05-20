#!/usr/bin/perl

use strict;
use warnings;

use SDL;
use SDL::Event;
use SDLx::App;
use SDLx::Text;

my $app = SDLx::App->
    new
    (
        width  => 400,
        height => 400,
        depth  => 32,
        title  => 'Hello World'
    );
my $message = SDLx::Text->
    new
    (
        font    => 'font/tristram.ttf',
        color   => [255, 255, 255],
        size    => 20,
        x       => 0,
        y       => 0,
        h_align => 'center',
    );
#  A         B      C  ,   D
#  (A: surface writing from) (B: what we are doing)
#  (C: surface that you are going to write too) (D: String to write)
$message->write_to($app, 'Hello World');
#             line start  ,line end   , color rgb and alpha
$app->draw_line([100, 100], [500, 100], [255, 255, 0, 255]);
#                       start point, size, color rgb and alpha
$app->draw_circle_filled([200, 200], 50, [0, 0, 255, 255]);

my $rectangle_x      = 200;
my $rectangle_y      = 150;
my $rectangle_width  = 200;
my $rectangle_height = 100;
my $rectangle        = [$rectangle_x, $rectangle_y, $rectangle_width, $rectangle_height];
my $rectangle_color = [255, 0, 0, 255];

$app->draw_rect($rectangle, $rectangle_color);

$app->draw_circle_filled([400, 200], 50, 0x0000EE80);

$app->add_event_handler(\&quit_handler);

$app->run();

sub quit_handler
{
    my $event      = shift;
    my $controller = shift;

    my $key_name = '';
    if ($event->type == SDL_KEYDOWN)
    {
        # Convert the key symbol (integer to a key name.
        $key_name = SDL::Events::get_key_name($event->key_sym);
    }

    if ($event->type == SDL_QUIT or $key_name =~ /^q$/)
    {
        $controller->stop;
    }
}


$app->update;

sleep(5);
