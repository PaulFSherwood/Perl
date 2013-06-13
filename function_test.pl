#!/usr/bin/perl

sub printGlobals
{

    my(@original) = @{$_[0]};
    my $size = @{$_[0]};

    # print "$size\n\n";
    foreach my $temp (@original)
    {
        if ($temp =~ /([0-9]).rpt/ig)
        {
            push(@{$_[1]}, $temp);
        } else {
            push(@{$_[2]}, $temp);
        }
        # @{$_[0]}[0] = "hey";
        print "\@{\$_[0]}[1]:@{$_[0]}[1]\n";
        # shift @{$_[0]};

    }
}

my(@globals) = <doc/*.rpt>;
my(@origComp) = ();
my(@backComp) = ();

printGlobals(\@globals, \@origComp, \@backComp);

print "@globals\n";
print "#########################\n";
print "@backComp\n";
print "@origComp\n";
