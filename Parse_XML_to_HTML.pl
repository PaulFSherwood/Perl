#!/usr/bin/perl

# Global Variables
my @XML_File = ();

# Open file
open(FILE1, 'OrigFile.txt') or die "Can not open first file quiting\n";

# stuff file into array
@XML_File = <FILE1>;

# Check if file exists
my $html_parse_file = '/home/grrwood/Documents/src/html/blarg.html';
if (-e $html_parse_file)
{
    # Del or backup old html file
    open(FILE2, '>HtmlFile.html') or die "Can not open output file\n";
}

# get total number of lines in the file
my $xmlFileSize = $#XML_File; # not sure if this should be +1 for @ is 0 start

# write html head to file
print FILE2 "<!DOCTYPE html>";
print FILE2 "<html>";
print FILE2 "<head>";
print FILE2 "	<meta charset='UTF-8'>";
print FILE2 "	<title>Pure CSS Tabbed Areas</title>";
print FILE2 "	<link rel='stylesheet' href='css/style.css'>";
print FILE2 "    <style>";
print FILE2 "\n";
print FILE2 "    .tabs {";
print FILE2 "      position: relative;";
print FILE2 "      min-height: 200px; /* This part sucks */";
print FILE2 "      clear: both;";
print FILE2 "      margin: 25px 0;";
print FILE2 "    }";
print FILE2 "    .tab {";
print FILE2 "      float: left;";
print FILE2 "    }";
print FILE2 "    .tab label {";
print FILE2 "      background: #eee;"; 
print FILE2 "      padding: 10px;";
print FILE2 "      border: 1px solid #ccc;";
print FILE2 "      margin-left: -1px;";
print FILE2 "      position: relative;";
print FILE2 "      left: 1px;";
print FILE2 "    }";
print FILE2 "    .tab [type=radio] {";
print FILE2 "      display: none;";
print FILE2 "    }";
print FILE2 "    .content {";
print FILE2 "      position: absolute;";
print FILE2 "      top: 28px;";
print FILE2 "      left: 0;";
print FILE2 "      background: white;";
print FILE2 "      right: 0;";
print FILE2 "      bottom: 0;";
print FILE2 "      padding: 20px;";
print FILE2 "      border: 1px solid #ccc;"; 
print FILE2 "    }";
print FILE2 "    [type=radio]:checked ~ label {";
print FILE2 "      background: white;";
print FILE2 "      border-bottom: 1px solid white;";
print FILE2 "      z-index: 2;";
print FILE2 "    }";
print FILE2 "    [type=radio]:checked ~ label ~ .content {";
print FILE2 "      z-index: 1;";
print FILE2 "    }";
print FILE2 "	</style>";
print FILE2 "</head>";
print FILE2 "\n";
print FILE2 "<body>";
print FILE2 "	<div id=\"page-wrap\">";

# Start flipping through your file
foreach my $xmlFile (@XML_File)
{
    # get start tag for tab name - till end of file
    if ($xmlFile =~ /^<[a-z]+>/ig)
    ## add variables for $1 $2 $3 in the xmlFile =~ 

# Write div tab for start tag name

# Write open content div

# Start loop til you find the end name

# If you find end tag name, write close div

# Find tag name

# Write <p> "Tag name - tag info" </p> to file
