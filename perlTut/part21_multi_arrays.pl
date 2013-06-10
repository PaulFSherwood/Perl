@compass = (
            ['NW', 'N', 'NE'],
            ['W', 'center', 'E'],
            ['SW', 'S', 'SE']
        );
my $total = @compass;
print "<$total>\n";
print "$compass[0][1]\n";
print "$compass[0]->[1]\n";
for (my $i = 0; $i<$total; $i++)
{
    for (my $j = 0; $j<$total; $j++)
    {
        # print "\$compass[$i][$j]=$compass[$i][$j]\n";
        print "\$compass[$i][$j]=$compass[$i]->[$j]\n";
    }
}
