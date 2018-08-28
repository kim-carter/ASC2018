#!/usr/bin/perl

##
## Kim Carter 2018.   Testin perl hashtable speed.  Step 2 tests insert then search performance
## 


use strict;
use warnings;
use Time::HiRes qw[gettimeofday tv_interval];
my %ht;

open(FILE,"<testdata.tsv") or die "Unable to open file\n";
while(<FILE>)
{

	chomp;
	my @cols = split /\t/;
	$ht{$cols[0]} = $cols[1];
}
close(FILE);


open(FILE,"<testsearch.tsv") or die "Unable to open file\n";

my $count=0;
my $time1=[gettimeofday()];
while(<FILE>)
{

	chomp;
	my @cols = split /\t/;

	if (exists($ht{$cols[1]}))
	{
		my $tmp = $ht{$cols[1]};
	}	
	else
	{
		#something else
	}

	$count++;
	if ($count % 100000 ==0)
	{
		print tv_interval($time1);
		print "\n";
		$time1=[gettimeofday()];
	}
}
close(FILE);


