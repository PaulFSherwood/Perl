@creatures = ('dog', 'cat', 'lion', 'elephant');
push (@creatures, 'tiger');
$numCreatures = @creatures;
print "array total is = $numCreatures\n";
print "\$creatures[0] = $creatures[0]\n";
print "\$creatures[1] = $creatures[1]\n";
print "\$creatures[2] = $creatures[2]\n";
print "\$creatures[3] = $creatures[3]\n";
print "\$creatures[4] = $creatures[4]\n";
# subtract two as the total would be five
# but the numbers used would be 0-4
# so 5 - 2 = 3 so elephant
print "\n5 - 2 = 3 = $creatures[$numCreatures - 2]\n";

for (my $i = 0; $i < $numCreatures; $i++)
{
    print "\$creatures[$i] = $creatures[$i]\n";
}
