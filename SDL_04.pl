#!/usr/bin/perl

use strict;
use warnings;

use SDL;
use SDL::Event;
use SDLx::App;
use SDLx::Sprite;

my $app = SDLx::App->
    new
    (
        width => 500,
        height => 500,
        depth => 32,
        title => 'Pretty Flowers',
    );

$app->add_event_handler(\&quit_handler);

# Adding blue skies
$app->draw_rect([0, 0, 500, 500], [20, 50, 170, 255]);

# draw a green field
$app->draw_rect([0, 400, 500, 100], [50, 170, 20, 100]);

# give the sprite a with and height
my $flower = SDLx::Sprite->new(width => 50, height => 100);

# Make the background transparent
$flower->surface->draw_rect([0, 0, 50, 100], [0, 0, 0, 0]);

# Now for a pretty green stem
$flower->surface->draw_rect([23, 30, 4, 100], [0, 255, 0, 255]);

# Add the siple flower bud
$flower->surface->draw_circle_filled([25, 25], 10, [150, 0, 0, 255]);
$flower->surface->draw_circle([25, 25], 10, [255, 0, 0, 255]);

for(0 .. 500)
{
    my $x = rand(500) - 20;
    my $y = 425 - rand(50);
    
    # stamp the sprite all over the screen
    $flower->draw_xy($app, $x, $y);
}

$app->update;
$app->run;

sub quit_handler
{
    my $event      = shift;
    my $controller = shift;

    my $key_name = '';
    if($event->type == SDL_KEYDOWN)
    {
        # Convert the key symbol (interger) to a key name.
        $key_name = SDL::Events::get_key_name($event->key_sym);
    }
    if($event->type == SDL_QUIT or $key_name =~ /^q$/)
    {
        $controller->stop;
    }
}

