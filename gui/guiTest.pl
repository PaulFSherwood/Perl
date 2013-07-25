#!/usr/bin/perl
use strict;
use warnings;
use Wx;

package MyApp;
use base 'Wx::App';

sub OnInit {
    my($self) = @_;
    # create a new frame (a frame is top level window)
    my $frame = Wx::Frame->new(
        undef,
        -1,
        'hello',
        [-1,-1],
        [250,150],
    );
    $frame->Show(1);
    return 1;
}
