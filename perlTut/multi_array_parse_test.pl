my @words = (
    ['OISNAV10.4.2', 'ONE'],
    ['OISNAV11.40.2', 'ONE'],
    ['OISNAV10.5.1.4', 'ONE'],
    ['OISNAV10.5.1', 'ONE'],
    ['OISNAV103.0.1', 'TWO'],
    ['OISNAV103.0.2', 'TWO']
);

my @tempArrayOne = "";
my @tempArrayTwo = "";
my $isRunning = 1;
#print "$words[0][0]\n";
my $i = 0;
my $j = 0;

while ($isRunning)
{

    # get new array section
    @tempArrayOne = split(/\./, $words[$i][$j]);
    @tempArrayTwo = split(/\./, $words[$i+1][$j]);
    my $total = @tempArrayOne;
    # slot 0
    if ($tempArrayOne[0] ge $tempArrayTwo[0])
    { 
        print "\$tempArrayOne[0] ge\n";
        push @words = join (/\./, @tempArrayOne); 
        push @words = join (/\./, @tempArrayTwo);
    }
    if ($tempArrayOne[0] lt $tempArrayTwo[0])
    { 
        print "\$tempArrayOne[0] lt\n";
        push @words = join (/\./, $tempArrayOne[0]); 
        push @words = join (/\./, $tempArrayTwo[0]);
    }
    # slot 1
    if ($tempArrayOne[1] gt $tempArrayTwo[1])
    { 
        print "\$tempArrayOne[1] same\n";
        push @words = join (/\./, $tempArrayOne[0]); 
        push @words = join (/\./, $tempArrayOne[0]);
    }
    if ($tempArrayOne[1] lt $tempArrayTwo[1])
    { 
        print "\$tempArrayOne[1] different\n";
        push @words = join (/\./, $tempArrayOne[0]); 
        push @words = join (/\./, $tempArrayOne[0]);
    }
    # slot 2
    if ($tempArrayOne[2] gt $tempArrayTwo[2])
    { 
        print "\$tempArrayOne[2] same\n";
        push @words = join (/\./, $tempArrayOne[0]); 
        push @words = join (/\./, $tempArrayOne[0]);
    }
    if ($tempArrayOne[2] lt $tempArrayTwo[2])
    { 
        print "\$tempArrayOne[2] different\n";
        push @words = join (/\./, $tempArrayOne[0]); 
        push @words = join (/\./, $tempArrayOne[0]);
    }

    
    for (my $y = 0; $y < 2; $y++)
    {
        for (my $x = 0; $x < 5; $x++)
        {
            print "\$words[$y][$x]=$words[$y][$x]\n";
        }
    }
    $isRunning = 0;
}
