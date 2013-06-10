@creatures = ('dog', 'cat', 'lion', 'elephant');
# add an element to the last element
push (@creatures, 'tiger');
print "@creatures\n";

# remove first element of the array
shift (@creatures);
print "@creatures\n";

# add an element at element 0
unshift (@creatures, 'snake');
print "@creatures\n";

# remove last element
pop (@creatures);
print "@creatures\n";

# put array into scalar with a coma seperation
$zoo = join (', ', @creatures);
print "$zoo\n";
