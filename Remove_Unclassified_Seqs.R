##Remove unclassified seqs in MED fasta file. Need node number of unclassified seqs
##So I made a list of node numbers in excel and saved it as tab delimited txt file. One thing is I
##had to add zeros infront of the numbers because the MED fasta file header
##has 9 digits with zeros infront --- this didn't work, so will have to adjust in the script

library("Biostrings")

#read in each file
seqs=readDNAStringSet("NODE_REPRESENTATIVES.fasta")
Nlist=read.csv("List_of_Nodes_to_get.csv", header=F)

#get headers in fasta file using names()
h1 = names(seqs)
#get node number which is part up to "|"
h2<- sub('\\|.*', '', h1, perl=T)
#add zeros infront of numbers in tax to make 9 digits - found formatC in a google search
h3=formatC(as.numeric(Nlist[,1]), flag=0, width=9) 

#get indices for where h2 and h3 match
x=match(h3, h2)

#Now make new fasta file using these index values
writeXStringSet(seqs[x], "Unclassified_seqs.fasta")
