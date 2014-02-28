#!/usr/bin/perl

# Global Variables
my @Orig_File = ();

# Open file
open(FILE1, 'OrigFile.txt') or die "Can not open first file quiting\n";

# stuff file into array
@Orig_File = <FILE1>;

# Check if file exists
my $html_parse_file = '/home/grrwood/Documents/src/html/blarg.html';
if (-e $html_parse_file)
{
    # Del or backup old html file
    open(FILE2, '>HtmlFile.html') or die "Can not open output file\n";
}

# get total number of lines in the file

# write html head to file

# get start tag for tab name - till end of file

# Write div tab for start tag name

# Write open content div

# Start loop til you find the end name

# If you find end tag name, write close div

# Find tag name

# Write <p> "Tag name - tag info" </p> to file
