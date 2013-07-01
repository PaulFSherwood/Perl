open(FILE, "list_of_files.txt") or die "cannot open < $file $!";
my @files = <FILE>;

foreach my $file (@files)
{
    chomp ($file);
    
    $file =~ s/.txt/.cpp/;
    
    `copy "source\\$file" "$file"`;
    
    print $file . "\n";
}
