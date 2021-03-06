#!/usr/bin/perl -w

use strict;
use warnings;
use Spreadsheet::ParseExcel;

# global arrays
my @living_room = "";
my @dining_room = "";
my @kitchen = "";
my @bathroom = "";
# setup to grab the xls sheet
my $parser   = Spreadsheet::ParseExcel->new();
my $workbook = $parser->Parse('test.xls') || die ("failed to load text.xls $!\n");
# main loop
for my $worksheet ( $workbook->worksheets() ) {

    # my ( $row_min, $row_max ) = $worksheet->row_range();
    # my ( $col_min, $col_max ) = $worksheet->col_range();

    # for my $row ( $row_min .. $row_max ) {
    #     for my $col ( $col_min .. $col_max ) {

    #         my $cell = $worksheet->get_cell( $row, $col );
    #         next unless $cell;

    #         print "Row, Col    = ($row, $col)\n";
    #         print "Value       = ", $cell->value(),       "\n";
    #         print "Unformatted = ", $cell->unformatted(), "\n";
    #         print "\n";
    #     }
    # }

    # get whats in the cell
    # my $temp = $worksheet->get_cell(1,0);
    my $temp = "";
    # if its empty keep on trucking
    # next unless $temp;
    # convert the value to readable assign to temp2
    # my $temp2 = $temp->value();
    my $temp2 = "";
    # print "$temp2\n";

    for (my $i = 1; $i<6; $i++)
    {
        for (my $j = 1; $j<6; $j++)
        {
            # there is probably a better way to set this up
            # this is to get the information out of the desired
		    # cell and test it
            $temp  = $worksheet->get_cell($j, $i);
            next unless $temp;
            $temp2 = $temp->value();

            if ($temp2 =~ /./)
            {
				# pull out first row information so we can 
                # push it to the desired array
                $temp = $worksheet->get_cell($j, 0);
                next unless $temp;
                $temp2 = $temp->value();
                # check for any values that show up for section one
                if ($i == 1)
                {
                    push(@living_room, $temp2);
                }
                # check for any values that show up for section two
                if ($i == 2)
                {
                    push(@dining_room, $temp2);
                }
                # check for any values that show up for section three
                if ($i == 3)
                {
                    push(@kitchen, $temp2);
                }
                # check for any values that show up for section four
                if ($i == 4)
                {
                    push(@bathroom, $temp2);
                }
            }
        }
    }
    # checking to see if the information came out correct.
    print "@living_room\n";
    print "@dining_room\n";
    print "@kitchen\n";
    print "@bathroom\n";
}
