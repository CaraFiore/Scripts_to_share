#R script to replace header in fasta file with header from taxonomy file from qiime

#First import taxonomy file and fasta file
tax=read.table("FILENAME.txt", header=F, quote="", sep="\t", stringsAsFactors=F)

library("Biostrings")
seqs=readDNAStringSet("FILENAME.fasta") #enter name of your fasta file

newH1 = names(seqs)
header2<- sub('\\ .*', '', newH1, perl=T) #need to remove space that was at end of header previously was _
newH2 = tax[match(header2, tax[,1]), 2]
names(seqs) = paste(header2, newH2, sep="|")

writeXStringSet(seqs, "Seqs_for_input_MED.fasta")

#newH2 = tax[match(newH1, tax[,1]), 2]