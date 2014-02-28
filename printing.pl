# number tells perl how many characters to set asside for spaceing
# so %20 would be 20 space so john doe would look like
$fname = John;
$lname = Doe;
#                John                Doe
printf("[%20][%20]\n", $fname, $lname);
# this can be more usefull then tabs as you may not know where your \t
# will place your charaters.
