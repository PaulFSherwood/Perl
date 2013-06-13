#!/usr/bin/perl

sub printGlobals
{

    my(@original) = @{$_[0]};
    my $size = @{$_[0]};
    # print "$size\n\n";
    foreach my $temp (@original)
    {
        print "$temp\n";
        @{$_[0]}[0] = "hey";
        # print "@{$_[0]}[0]\n";
        # shift @{$_[0]};

    }
}

my(@globals) = <*.pl>;
my(@out) = ();

printGlobals(\@globals);

print "@globals\n";
