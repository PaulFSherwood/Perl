################################################
# Include SDL functions and datatypes
use SDL;
use SDL ':init';
use SDLx::App;
use SDL::Events;
################################################
# Set up screen
my $app = SDLx::App->new( 
        w            => 450,
        h            => 511,
        exit_on_quit => 1,
        dt           => 0.2,
        title => 'SDLx Test' 
);

# Temp variables
my $ship_x = "209";
my $ship_y = "134";

# Load image
my $background = SDL::Image::load ('maps/mission-511_450-1.png');
my $image = SDL::Image::load( 'ri0ev.png' ); 
################################################
# Logic
sub move_piece {
    my $direction = shift;
    
    if($direction eq 'left') {
        $ship_x = $ship_x -  2;
    }
    elsif($direction eq 'right') {
        $ship_x = $ship_x +  2;
    }
    elsif($direction eq 'up') {
        $ship_y = $ship_y - 2;
    }
    elsif($direction eq 'down') {
        $ship_y = $ship_y +  2;
    }
}
################################################
# Events handling
sub trigger_move_event_handler {
    my ( $event, $app ) = @_;

    #print "@_\n";
    if( $event->type == SDL_KEYDOWN ) {
        my $key = $event->key_sym;
        if( $event->key_sym & (SDLK_LEFT|SDLK_RIGHT|SDLK_UP|SDLK_DOWN) ) {
            if($key == SDLK_LEFT ) {
                move_piece('left');
            }
            elsif($key == SDLK_RIGHT ) {
                move_piece('right');
            }
            elsif($key == SDLK_UP ) {
                move_piece('up')
            }
            elsif($key == SDLK_DOWN ) {
                move_piece('down')
            }
        }
    }
}

# this will allow access to the event_handler function
$app->add_event_handler( \&trigger_move_event_handler );

################################################
# Apply image to screen
# render the game objects on the screen
$app->add_show_handler(
    sub {
        # clear the screen
        $app->update();

        # update the background
        $app->blit_by( $background, [0, 0, 511, 450],);

        # draw the ship
        # draw to ( from [cut from, , w, h], [place it at]);
        $app->blit_by( $image, [40, 13, 19, 19],[$ship_x, $ship_y]); 

        # update the screen
        $app->update;
    }
);
# run the app
$app->run(); 
