# start of a work then anything else
if ($line =~ /^main(.*)/){}
if ($line =~/^main/){}

# replace start of a line
$line =~ s/^main/tame/;

# search for either or string
if ($line =~ /(main|tame)/){}

# ignore case
if ($line =~ /(main|tame)/i){}

# search for variable (doesnt work with special characters i.e. <,>,+,-,/....)
if ($line =~ /$searchTerm/){}
if ($line =~ /main$searchTerm/ig){} # global search can be anywhere in the line

# match anything
if ($line =~ /(.*)/){}

# replace all spaces at the beginning
$line =~ s/^\s+//g;

# replace all spaces at the end
$line =~ s/\s+$//g;

# file extension swap
$fileNameCpp = $fileNameH;
$fileNameH =~ s/.cpp/.h/;

