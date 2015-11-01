#!/usr/bin/env python

# 'r' read only, 'w' write, 'r+' both 

import sys

print enter the file name

infile = sys.stdin  #file name form standard in

infile.rstrip('\n') #remove new line char

open (infile, 'r') #open file as read only
open (outfile, 'w')

fileline = new infile.readline()  #variable with line form file

for line in fileline:
   filelist = fileline.split(",")
   oufile.write(filelist[0]\nfilelist[1])
   
close (infile)
close (outfile)   
