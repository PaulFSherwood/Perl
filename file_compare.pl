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
my $line_number = 1;
my $line_number2 = 1;

my @dirArray = <doc/*.rpt>;
my @origArray = ();
my @backArray = ();
my @outputArray = ();
my @file_comp1 = ();
my @file_comp2 = ();

# POPULATE OUR ARRAY FOR USE
foreach my $tF (@dirArray)
{
    # GET SECONDARY REPORTS
    if ($tF =~ /([0-9]+).rpt/g)
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

# GET THE CURRENT FILES TO OPEN
foreach $file_comp1(@origArray)
{
    foreach $file_comp2(@backArray)
    {
        print "$file_comp2##################################################\n";
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
        
        @file_comp1 = <FILE1>;
        @file_comp2 = <FILE2>;
        # CLEAN UP
        close(FILE1);
        close(FILE2);

        ######################################################################
        # BEGIN TESTING FILES TO SEE IF WE SHOULD COMPARE THEM
        ######################################################################

        # MAKE SURE WE DONT COMPARE FILES WE SHOULDN'T
        my $testOne = $file_comp1;
        $testOne =~ s/.rpt//g;
        print "TestONE: $testOne\n"; 
        # MAKE SURE WE ARE TESTING SIMILAR FILES BY SIZE
        if ($#file_comp1 != $#file_comp2)
        {
            # print "Skipping: File size $file_comp1 to $file_comp2\n";
            $canCompare = 0;
        } else {
            $canCompare = 1;
        }
        
        # MAKE SURE WE ARE TESTING SIMILAR FILES BY NAME
        if ($file_comp2 !~ m/^$testOne/g)
        {
            # print "Skipping: File name $file_comp1 to $file_comp2\n";
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

        # foreach my $tempLin(@file_comp1){ chomp($tempLin); print  "$tempLin\n";}
        # print "##############################################################################\n";
        # STARTING LINE BY LINE COMPARE OF CURRENT FILE
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

                    # DEBUG INFORMATION
                    if($debug[3] == 1)
                    {
                       print "$line_number||$line_number2|[$line][$line2]\n";
                    }
                    # WHEN THE TWO FILES HAVE THE SAME LINE NUMBER DO A CHECK
                    if (($line_number eq $line_number2))# && ($line eq $line2))
                    {
                        # IF THE FIRST LINE HAS A TRUE PUSH
                        if ($line =~ m/toInt\(\sT\s\)/g)
                        {
                            # DEBUG INFORMATION
                            if ($debug[4] == 1)
                            {
                                print "line_number||line\n";
                                print "$line_number||$line\n";
                            }
                            push (@outputArray, $line);
                        }
                        # ELSE IF THE SECOND LINE HAS A TRUE PUSH
                        elsif ($line2 =~ m/toInt\(\sT\s\)/g) 
                        {
                            # DEBUG INFORMATION
                            if ($debug[4] == 1)
                            {
                                print "line_number2||line2\n";
                                print "$line_number2||$line2\n";
                            }
                            push (@outputArray, $line2);
                        }
                        # IF NEITHER HAS A TRUE JUST PUSH THE FIRST
                        else {
                            push (@outputArray, $line);
                        }
                    }
                    $line_number2++;
                }
                # FINISHED COMPARING THE TWO FILES
                # PUSH RESULTS TO AN OUTPUT FILE
                my $tempFile = $file_comp1;
                $tempFile =~ s/(_output)?.rpt//g;
                open (FILE1, ">doc/$tempFile\_output.rpt") or die "cant open 1:$tempFile\_output.rpt\n";
                # OUTPUT ARRAY TO A NEW FILE
                foreach my $tempLine (@outputArray)
                {
                    print FILE1 "$tempLine\n";
                }
                print "#####$tempFile#######$file_comp2\n";
                $file_comp1 = "$tempFile\_output.rpt";

                $line_number2 = 1;
                $line_number++;
            }
            $line_number = 1;
        }
    }
}
