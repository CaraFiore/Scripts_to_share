#Subsample a fasta file using headers that have sample ID followed by underscore
#Edit this by adding the name of the fasta file you wish to use, and the number you want to subsample at (in the loop for subsampling)
#This will also print to the screen the number of reads in each sample
#The last "block" can be modified to remove one or more samples from the fasta file using the sampleID. This uses the first part of the header up to the underscore
#to determine sampleID
#Cara Fiore 10-22-15

library("Biostrings")
seqs=readDNAStringSet("FILENAME.fasta")  #Enter fasta file name here
header<- names(seqs) #get headers
header2<- sub('\\_.*', '', header, perl=T) #grab sample ID up to the underscore
SampleID=unique(header2) #get list of unique headers for looping through

#####First get number of reads for each sample
i=1
for(i in 1:length(SampleID)){
  Index =grep(SampleID[i], header)
  tempfasta= seqs[Index]
  print(paste(SampleID[i], ":", length(tempfasta), "reads"))
  i=i+1  
}

####Now subsample
#for loop go through sampleID, make fasta file for each ID, generate random 
#numbers and use these to pull sequences from the "file", save these
#and make new file
i=1
for(i in 1:length(SampleID)){
  Index =grep(SampleID[i], header)
  tempfasta= seqs[Index]   
  subfasta=sample(tempfasta, 24000, replace=F)  #Enter that you want to subsample at
  writeXStringSet(subfasta, "FILENAME.fasta", append=T) #entier name of your output file
  i=i+1  
}


####Remove one with too low read number
ID="IO2.1.1182133"
x=which(header2!=ID)
newfasta= seqs[x]
writeXStringSet(newfasta, "FILENAME.fasta")