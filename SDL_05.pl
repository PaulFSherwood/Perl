#!/usr/bin/perl

use strict;
use warnings;

use SDL;
use SDL::Event;
use SDLx::App;

my $app = SDLx::App->
    new
    (
        width  => 800,
        height => 600,
        title  => 'Pew Pew',
    );

my $laser    =  0;
my $velocity = 20;

$app->add_event_handler(\&quit_handler);

# Tell app to handle the appropriate time to call both rendering and physics
# calculation
$app->add_move_handler(\&calculate_laser);
$app->add_show_handler(\&render_laser);

$app->run;

sub quit_handler
{
    my $event      = shift;
    my $controller = shift;
    my $key_name   = '';

    if($event->type == SDL_KEYDOWN)
    {
        # Convert the key symbol (integer) to a key name.
        $key_name = SDL::Events::get_key_name($event->key_sym);
    }
    if($event->type == SDL_QUIT or $key_name =~ /^q$/)
    {
        $controller->stop;
    }
}

# From the SDL Manual:
#
# Consider a siple physics model for the laser has a consistent horizontal
# velocity in pixels per time step at the window's mid-poiint:
#
# X = Velocity * time step,
# Y = 100
#
# Assuming a velocity of 10, the laser will pass through the coordinatees:
# 0, 100
# 10, 100
# 20, 100
# 30, 100
# ...
# 200, 100
#
# Note that the speed of the processing the game loop no longer matters. The
# position of the laser dependdds instead on the passage of real time.

sub calculate_laser
{
    # The step is the difference in the time calculated for the next jump
    my $step = shift;
    my $app  = shift;
    my $t    = shift;

    $laser += $velocity * $step;
    if ($laser > $app->w)
    {
        exit;
    }
    # $laser = 0 if $laser > $app->w;
    $velocity = $velocity + 5;
}

sub render_laser
{
    # the delta can be used to render blurred frames
    my $delta = shift;
    my $app   = shift;

    # Draw the background first
    $app->draw_rect([0, 0, $app->w, $app->h], 0);

    # draw the laser
    $app->draw_rect([$laser, $app->h / 2, 10, 2], [255, 0, 0, 255]);
    $app->update;
}
