#!/usr/bin/perl
use strict;
use warnings;

# Subroutine prototypes
sub do_exit();
sub query_account_status();
sub process_direct_deposits();

# Define the actions to take
my %action_to_take = (
'1' => \&process_direct_deposits,
'2' => \&query_account_status,
'3' => \&do_exit,
);

# Print the menu selection
print <<"EOT";
Select one of:
1. Process Direct Deposits
2. Query account status
3. Exit
EOT

# Get the user's input
my $menu_item = <>;
chomp($menu_item);

# Take action based on the user's choice
if (defined $action_to_take{$menu_item}) {
$action_to_take{$menu_item}->();
} else {
print "I didn't understand the command.\n";
do_exit();
}

exit 0;

#-------------------------------------------------------------
sub process_direct_deposits() {
print "Processing direct deposits\n";
return;
}

sub query_account_status() {
print "Querying account status\n";
return;
}

sub do_exit() {
print "Exiting...\n";
return;
}
