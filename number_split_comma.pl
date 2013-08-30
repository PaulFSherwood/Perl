my $num = 1;
my $num2 = 1;
my $exitCommand = 1;

while ($exitCommand)
{
	$number = $num;
	# update the number string to put in commas
	$number =~ s/(\d)(?=(\d{3})+(\D|$))/$1\,/g;

	print "\t\t$num2|[$number]";

	# to get a good pause
	$exitCommand = <STDIN>;
	chomp($exitCommand);
	if ($exitCommand eq "")
	{
		$exitCommand = 1;
	}
	# update counter
	$num = $num * 2;
	$num2 += 1;
}
