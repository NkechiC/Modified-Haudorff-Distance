#Script to cancel repeated rows in an array by pairs

source("VLTC.R")
CancelPairs<-function(E){
F<-E #Copy E
i<-1
	while(i<(dim(F)[1])){
		for(j in (i+1):dim(F)[1]){
		#Look for a duplicate of row i
		#print(c(i,j))
		if(identical(F[i,,1],F[j,,1])==TRUE && identical(F[i,,2],F[j,,2])==TRUE){
			F<-F[-c(i,j),,]
			print("cancelled")
			i<-i-1 #Do  not increment i
			break
			}
	
		}
		i<-i+1	}
return(F)
}