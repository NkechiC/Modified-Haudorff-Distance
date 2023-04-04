#Script to make cycle representatives into complexes

#source("VLTC.R")
source("Nonredundant.R")
source("CancelPairs.R")
#source("AddCycles.R")

#Initial input is a H_1 cycle representative, a p*2*d array D
coordinates<-nonredundant(D)#a nonredundant list of vertices in D, matrix
N<-nrow(coordinates)


cmplx<-list()
vert<-as.list(seq(1,N,1))#list the vertices by row index in 'coordinates'

#Find which rows of "coordinates" form edges and higher-order simplices:

for(j in 1:p){
for(i in 1:nrow(coordinates)){
  if(coordinates[i,]=D[j,1,]){A<-i}
  #D is a p*2*d array, a cycle rep as output from R TDA routine  
  else{return(-1)}
}

#B<-vector("numeric", length=2*N-1) #initialize an empty vector
for(i in 1:nrow(coordinates)){
  if(D[j,2,]=coordinates[i,]){B<-i}
  #D is a p*2*d array, a cycle rep as output from R TDA routine  
  else{return(-1)}
}
}

if(N=0){return(cmplx)#return the empty list. (This is the 0-cycle)
}else{
#others<-list(sort(c(A,B)))#other 1- and higher dimensional simplices
cmplx<-append(vert,sort(c(A,B)))#combine both lists together
}
