        # MAKE SURE WE ARE TESTING SIMILAR FILES BY SIZE
        if ($#file_compOne != $#file_compTwo)
        {
            print "Compare Skip: File size $file_comp1:$#file_compOne to $file_comp2:$#file_compTwo\n";
            $canCompare = 0;
        } else {
            $canCompare = 1;
        }
        
        # MAKE SURE WE ARE TESTING SIMILAR FILES BY NAME
        if ($file_comp2 !~ m/^$testOne/g)
        {
            print "Compare Skip: File name $file_comp1 to $file_comp2\n";
            $canCompare = 0;
        } else {
            $canCompare = 1;
        }
