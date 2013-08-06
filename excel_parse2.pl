# my excel sheet
$excelFile = "c:\users\awesomeness\test.xlsx";

# loop throught each spreadsheet
foreach my $sheet(@{$excel -> {Worksheet}})
{
  # set max length
  $sheet -> {MaxRow} ||= $sheet -> {MinRow};
  
  # loop through the spreadsheet
  foreach my $row ($sheet -> {MinRow} .. $sheet -> {MaxRow})
  {
    # get what you get from the row your on
    #                        current row |colum -1 for array
    my $fname = ($sheet -> {Cells} [$row] ["0"]) -> {Val};
    my $mname = ($sheet -> {Cells} [$row] ["1"]) -> {Val};
    my $lname = ($sheet -> {Cells} [$row] ["2"]) -> {Val};
    
    # do what you want with the information
    #
    #
    # stop looking at this row
  }
  # close loop on file
}
