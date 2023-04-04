#FUNCTION "nonredundant" TO RETURN NON-REDUNDANT LIST OF VERTICES
#Input argument is a 3D array, called "D"
 
source("VLTC.R")
nonredundant<-function(D) {
p<-dim(D)[1] #store the number of vertices in D as p
d<-dim(D)[3] #dimension of ambient space is d

#Get non-redundant list of vertices from this cycle rep/array
#Initialize an empty 2p by d matrix, and fill it with entries from D

V1<-matrix(,nrow=2*p, ncol=d)#initialize an empty matrix

for (k in 1:p){
V1[2*k-1,] <- D[k,1,]
V1[2*k,] <- D[k,2,]
 }

V<-unique(V1)#function "unique" is only applicable to matrices
#It eliminates repeated rows

return(V)#non-redundant list of vertices
}