1       # MAKE SURE WE ARE TESTING SIMILAR FILES BY SIZE
2       if ($#file_compOne != $#file_compTwo)
3       {
4           print "Compare Skip: File size $file_comp1:$#file_compOne to $file_comp2:$#file_compTwo\n";
5           $canCompare = 0;
6       } else {
7           $canCompare = 1;
8       }
9        
0       # MAKE SURE WE ARE TESTING SIMILAR FILES BY NAME
1       if ($file_comp2 !~ m/^$testOne/g)
2       {
3           print "Compare Skip: File name $file_comp1 to $file_comp2\n";
4           $canCompare = 0;
5       } else {
6           $canCompare = 1;
7       }
