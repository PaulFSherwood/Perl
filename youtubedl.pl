#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

# Globals
my $filename = "";
my $url = "";
my $content = "";
# get a url from user
if ($ARGV[0])
{
    my $url = $ARGV[0];
} else {
    print "I need a url\n";
    $url = <>;
    chomp($url);
    $url =~ s/https/http/ig;
    print "Using ($url) thank you\n";
}
# try to assign our url to content
$content = get($url) || die "Couldn't get $url";
# find our title
if($content =~ m/\"title\" content=\"([0-9a-zA-Z:,-_\s]+)/i) {
    # $1 is read only, copy to temp variable and modify
    my $filename = $1;
    my $extension = ".mp4";
    # replace spaces with underscores
    $filename =~ s/\s/_/ig;
    $filename =~ s/://ig;
    $filename =~ s/\?//ig;
    $filename = $filename.$extension;
    print "$filename\n";

    `youtube-dl -o $filename $url`;
}
