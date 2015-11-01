#Make group file from list of sample names_sequence#

#read in list of sample names plus sequence number
comb <- read.table("test.txt", header=F)
list1=comb[,1]
keep=NULL
name=NULL
name.final=NULL
i=1

for(i in 1:length(list1)) {
  name.combo=NULL
  keep=as.character(list1[i])
  name=unlist(strsplit(as.character(list1[i]), "_"))
  name.combo=c(keep, as.character(name[1]))
  name.final=rbind(name.final, name.combo)
  i=i+1
  print(paste("percent complete =", round((i/length(list1))*100,1), "%",sep=" "))
}
write.table(name.final, file="GroupFile.txt", quote=FALSE, sep="\t", col.names=FALSE, row.names=FALSE)