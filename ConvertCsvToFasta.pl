#!/usr/bin/perl -w
# Cara Fiore 9-10-13
# practice script, convert csv file from Bob's R script to FASTA file
# originally wrote script in Java. Now practice in Perl.

use strict;

print "Enter input filename: ";
my $infilename = <STDIN>;

chomp ($infilename);

open(FILE1, $infilename) || die $!;
open(OUTFILE, ">output.fasta");

#$fileline = <FILE1>;
#chomp ($fileline);

while (<FILE1>) {
   chomp;
   #print $_;
   my $fileline = $_;
   my @oneline = split (",", $fileline);
   my $header = $oneline[0];
   my $sequence = $oneline[1];
   print OUTFILE "$header\n$sequence";
   
   
   
}

close (FILE1);
close (OUTFILE);