#!/usr/bin/perl

my $masteryHours = 10000;
my $hourYear = 2080;
my $hourMonth = 240;
my $hourWeek = 40;
my $hourDays = 8;
my $temp = 0;

# years to master
$temp = $masteryHours / $hourYear;
print "Years to master   $temp\n";
# months to master
$temp = $masteryHours / $hourMonth;
print "months to master $temp\n";
# weeks to master
$temp = $masteryHours / $hourWeek;
print "weeks to master $temp.00\n";
# days to master
$temp = $masteryHours / $hourDays;
print "days to master $temp.00\n";
