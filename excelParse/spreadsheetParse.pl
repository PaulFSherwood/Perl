use Spreadsheet::XLSX;

# SET YOUR SPREADSHEET
my $excel = Spreadsheet::XLSX -> new ('example.xlsx'); # , $converter);

# LOOP THORUGH EACH SPREADSHEET (IN OUR CASE ONE)
foreach my $sheet (@{$excel -> {Worksheet}})
{
    # VARIABLE SET UP
    my $testFileName = "";
    my $testFunctionName = "";
    my $functionCounter = 0;
    my $rowTester = 0;
    $sheet -> {MaxRow} ||= $sheet -> {MinRow};
    # LOOP THROUGH THE ROWS OF THE SPREADSHEET
    foreach my $row ($sheet -> {MinRow} .. $sheet -> {MaxRow})
    {
        # $sheet -> {MaxCol} ||= $sheet -> {MinCol};
        # foreach my $col ($sheet -> {MinCol} ..  $sheet -> {MaxCol})
        # {
        # my $cell = $sheet -> {Cells} [$row] [$col];
        #
        # VARIABLE SETUP REFRESHES EVERY ROW GRAB 
        my $fileName     = ($sheet -> {Cells} [$row] ["0"]) -> {Val};
        my $functionName = ($sheet -> {Cells} [$row] ["1"]) -> {Val};
        my $percentage   = ($sheet -> {Cells} [$row] ["2"]) -> {Val};
        # RESET THE FUNCTION COUNTER WHEN YOU FLIP TO A NEW FILE
        if ($testFileName ne $fileName)
        {
            # set my test variable to match the filename
            $testFileName = $fileName;
            # we have changed file so reset the function counter
            $functionCounter = 0;
        }
        # if the row tester is less then the row number the we are on a new line change the function number
        # if($rowTester < $row)
        # {
        #     # we should be in the same file and on a different line number
        #     $functionCounter++;
        # }
        # QUICK PRINT TO SEE WHATS GOING ON
        print "row:$row||funcCount:$functionCounter||fileName:$fileName||functionName:$functionName||percentage:$percentage\n";
        # INCREMENT THE FUNCTION COUNTER
        $functionCounter++;
        
        #my $temp = $fileName -> {Val};

        # if ($cell)
        # {
        #     printf("( %s , %s ) => %s\n", $row, $col, $cell -> {Val});
        #     # print "$fileName\n";
        # }
        # }

        # AT THIS POINT YOU SHOULD HAVE FILENAME/FUNCTIONNAME/FUNCTIONNUMBER
        # OPEN THE FILE. FIND THE START AND STOP OF THE FUNCTION VERIFY WITH FUNCTIONNUBMER
    }
}
