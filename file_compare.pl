#!/usr/bin/perl

use warnings;
use strict;

# DEBUG
my @debug = (0, 0, 0, 0);

# SEND LIST OF FILES TO AN ARRAY
my $dir = "doc";
my @dirArray = <doc/*.rpt>;
my @origArray = ();
my @backArray = ();
my $file_comp1 = "";
my $file_comp2 = "";
my $canCompare = 1;
# LINE COUNTER FOR TRACKING OF FILE 2 USING FILE 1
my $line_number = 1;
my $line_number2 = 1;

foreach my $tF (@dirArray)
{
    if ($tF =~ /([0-9]+).rpt/g)
    {
        $tF =~ s/^(doc\/)//g;
        push (@backArray, $tF);
    } else {
        $tF =~ s/^(doc\/)//g;
        push (@origArray, $tF);
    }
}

if ($debug[0] == 1)
{
    print "#######dirArray#########\n";
    print "@dirArray\n";
    print "#######backArray#########\n";
    print "@backArray\n";
    print "#######origArray#########\n";
    print "@origArray\n";
}

# Get the current files to open
foreach $file_comp1(@origArray)
{
    foreach $file_comp2(@backArray)
    {
        if ($debug[1] == 1)
        {
            print "#######file_comp1#########\n";
            print "$file_comp1\n";
            print "#######file_comp2#########\n";
            print "$file_comp2\n";
        }
        # OPEN FILES WE ARE GOING TO COMPARE
        open (FILE1, 'doc/' . $file_comp1) or die "cant open 1:$file_comp1\n";
        open (FILE2, 'doc/' . $file_comp2) or die "cant open 2:$file_comp2\n";

        # MAKE SURE WE DONT COMPARE FILES WE SHOULDN'T
        my $testOne = $file_comp1;
        $testOne =~ s/.rpt//g;
        if ($debug[2] == 1)
        {
            print "#########testOne#########\n";
            print "$testOne\n";
            print "########file_comp1#######\n";
            print "$file_comp1\n";
            print "########file_comp2#######\n";
            print "$file_comp2\n";
        }
        if ($file_comp2 !~ m/^$testOne/g)
        {
            print "Skipping $file_comp1 to $file_comp2\n";
            $canCompare = 0;
        } else {
            $canCompare = 1;
        }
        my @file_comp1 = <FILE1>;
        my @file_comp2 = <FILE2>;

        # CLEAN UP
        close(FILE1);
        close(FILE2);

        if ($canCompare)
        {
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

                    if($debug[3] == 1)
                    {
                       print "$line_number||$line_number2|[$line][$line2]\n";
                    }
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
            $line_number = 1;
        }
    }
}
