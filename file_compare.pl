#!/usr/bin/perl

use warnings;
use strict;

my $file_comp1 = "file_comp1.txt";
my $file_comp2 = "file_comp2.txt";

# line counter for tracking of file 2 using file 1
my $line_number = 1;
my $line_number2 = 1;

# open any files we are going to compare
open (FILE1, $file_comp1) or die "cant open\n";
open (FILE2, $file_comp2) or die "cant open $file_comp2\n";

my @file_comp1 = <FILE1>;
my @file_comp2 = <FILE2>;

# clean up
close(FILE1);
close(FILE2);

# MARCH THROUGH FILE 1
foreach my $line(@file_comp1)
{
    # REMOVE \n
    chomp($line);

    # YOU SHOULD HAVE THE FIRST LINE RIGHT HERE.
    # SO GET TO THE SECOND FILES LINE
    foreach my $line2(@file_comp2)
    {
        # REMOVE \n
        chomp($line2);

        # print "$line_number||$line_number2|[$line][$line2]\n";
        # WHEN THE TWO FILES HAVE THE SAME LINE NUMBER DO A CHECK
        if (($line_number eq $line_number2) && ($line eq $line2))
        {
            print "$line_number-$line\n";
            
        }
        $line_number2++;
    }
    $line_number2 = 1;
    $line_number++;
}
