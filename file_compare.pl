#!/usr/bin/perl

use warnings;
use strict;

# DEBUG INFORMATION
my @debug = (0, 0, 0, 0, 0);

# SEND LIST OF FILES TO AN ARRAY
my $dir = "doc";
my $file_comp1 = "";
my $file_comp2 = "";
my $canCompare = 1;
# LINE COUNTER FOR TRACKING OF FILE 2 USING FILE 1
# my $line_number = 1;
# my $line_number2 = 1;

my @dirArray = <doc/*.cpp>;
my @origArray = ();
my @backArray = ();
my @outputArray = ();
my @file_compOne = ();
my @file_compTwo = ();

# POPULATE OUR ARRAY FOR USE
foreach my $tF (@dirArray)
{
    # GET SECONDARY REPORTS
    if ($tF =~ /([0-9]+).cpp/g)
    {
        $tF =~ s/^(doc\/)//g;
        push (@backArray, $tF);
    # REMOVE OUR OUTPUT FILES
    } elsif ($tF =~ m/(_output.rpt)/g)
    { 
        # DO NOTHING
    # GET PRIMARY REPORTS
    } else {
        $tF =~ s/^(doc\/)//g;
        push (@origArray, $tF);
    }
}

# DEBUG INFORMATION
if ($debug[0] == 1)
{
    print "#######dirArray#########\n";
    print "@dirArray\n";
    print "#######backArray#########\n";
    print "@backArray\n";
    print "#######origArray#########\n";
    print "@origArray\n";
}

# SET INITIAL FILE
$file_comp1 = $origArray[0];

# GET THE CURRENT FILES TO OPEN
foreach $file_comp1 (@origArray)
{
    foreach $file_comp2(@backArray)
    {
        # DEBUG INFORMATION
        if ($debug[1] == 1)
        {
            print "#######file_comp1#########\n";
            print "$file_comp1\n";
            print "#######file_comp2#########\n";
            print "$file_comp2\n";
        }
        
        # OPEN SECONDARY FILES FOR COMPARING 
        open (FILE1, 'doc/' . $file_comp1) or die "cant open 1:$file_comp1\n";
        open (FILE2, 'doc/' . $file_comp2) or die "cant open 2:$file_comp2\n";
       
        # FILE ARRAY FOR COMPARE 
        @file_compOne = <FILE1>;
        @file_compTwo = <FILE2>;

        # CLEAN UP
        close(FILE1);
        close(FILE2);

        ######################################################################
        # BEGIN TESTING FILES TO SEE IF WE SHOULD COMPARE THEM
        ######################################################################

        # MAKE SURE WE DONT COMPARE FILES WE SHOULDN'T
        my $testOne = $file_comp1;
        $testOne =~ s/(_output)?.cpp//g;

        # MAKE SURE WE ARE TESTING SIMILAR FILES BY SIZE
        if ($#file_compOne != $#file_compTwo)
        {
            print "Compare Skip: File size $file_comp1:$#file_compOne to $file_comp2:$#file_compTwo\n";
            $canCompare = 0;
        } else {
            $canCompare = 1;
        }
        
        # MAKE SURE WE ARE TESTING SIMILAR FILES BY NAME
        if ($file_comp2 !~ m/^$testOne/g)
        {
            print "Compare Skip: File name $file_comp1 to $file_comp2\n";
            $canCompare = 0;
        } else {
            $canCompare = 1;
        }

        ######################################################################
        # END TESTING FILES TO SEE IF WE SHOULD COMPARE THEM
        ######################################################################

        # DEBUG INFORMATION
        if ($debug[2] == 1)
        {
            print "#########testOne#########\n";
            print "$testOne\n";
            print "########file_comp1#######\n";
            print "$file_comp1\n";
            print "########file_comp2#######\n";
            print "$file_comp2\n";
        }

        # STARTING LINE BY LINE COMPARE OF CURRENT FILE
        if ($canCompare)
        {
            my $comp1Counter = $#file_compOne+1;

            # MARCH THROUGH FILE 1
            for (my $i = 0; $i < $comp1Counter; $i++)  # FILE ONE START
            {
                my $line  = $file_compOne[0];
                my $line2 = $file_compTwo[0];

                # THE FOLLOWING ARE IN ORDER OF IMPORTANCE
                # 
                # DEBUG INFORMATION
                if($debug[3] == 1)
                {
                    print "[$line][$line2]\n";
                }

                # IF THE FIRST FILE HAS TRUE PUSH THAT ONE
                if ($line =~ m/toInt\(\sT\s\)/g)
                {
                    # DEBUG INFORMATION
                    if ($debug[4] == 1)
                    {
                        print " line: ";
                        print "$line";
                    }
                    push (@outputArray, $line);
                    shift (@file_compOne);
                    shift (@file_compTwo);
                }

                # IF THE SECOND FILE HAS TRUE PUSH THAT ONE
                elsif ($line2 =~ m/toInt\(\sT\s\)/g)
                {
                    # DEBUG INFORMATION
                    if ($debug[4] == 1)
                    {
                        print "line2: ";
                        print "$line2";
                    }
                    push (@outputArray, $line2);
                    shift (@file_compOne);
                    shift (@file_compTwo);
                }

                # IF NEITHER HAS A TRUE JUST PUSH THE FIRST
                else
                {
                    # DEBUG INFORMATION
                    if ($debug[4] == 1)
                    {
                        print " line: ";
                        print "$line";
                    }
                    push (@outputArray, $line);
                    shift (@file_compOne);
                    shift (@file_compTwo);
                }
            }
            # FINISHED COMPARING THE TWO FILES
            # PUSH RESULTS TO AN OUTPUT FILE
            my $tempFile = $file_comp1;
            $tempFile =~ s/(_output)?.cpp//g;
            open (FILE1, ">doc/$tempFile\_output.cpp") or die "cant open 1:$tempFile\_output.cpp\n";

            # OUTPUT ARRAY TO A NEW FILE
            for (my $x = 0; $x < $comp1Counter; $x++)
            {
                my $tempLine = $outputArray[0];
                print FILE1 "$tempLine";
                shift(@outputArray);
            }
            $file_comp1 = "$tempFile\_output.cpp";
        }
    }
}
