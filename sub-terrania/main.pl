########################
# Include SDL functions and datatypes
use SDL; 
use SDLx::App;
########################
# Set up screen
my $app = SDLx::App->new( 
        w => 450, 
        h => 511,
        title => 'SDLx Test' 
); 

# Load image
my $background = SDL::Image::load ('maps/mission-511_450-1.png');
my $image = SDL::Image::load( 'ri0ev.png' ); 

# make it black
$app->update();

# Apply image to screen
$app->blit_by( $background, [0, 0, 511, 450],);
$app->blit_by( $image, [40, 13, 19, 19],[209, 134]); 

# Update Screen
$app->flip();

#$app->run(); 

sleep(3);
