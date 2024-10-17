#Vertex List to Cycle Function

VLTC<-function(V) {
k<-nrow(V)
m<-ncol(V)

A<-array(dim=c(m,k,2))
for (i in 1:m-1){
A[i,1,]<-V[,i]
A[i,2,]<-V[,i+1]
}
A[m,1,]<-V[,m]
A[m,2,]<-V[,1]

return(A)
}

#FUNCTION "nonredundant" TO RETURN NON-REDUNDANT LIST OF VERTICES
#Input argument is a 3D array, called "D"
 
#source("VLTC.R")
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

#Script to cancel repeated rows in an array by pairs

#source("VLTC.R")
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

#Script to add two cycles together and cancel repeated edges

#source("CancelPairs.R")

AddCycles<-function(C,D){
#Check that the two cycles are compatible/have same size:
if(!dim(C)[2]==dim(D)[2]||!dim(C)[3]==dim(D)[3]){
print("Cannot add arrays of different sizes!")
return(-1)
}

#Otherwise, if they are compatible,
else{
d1<-dim(C)[1]+dim(D)[1]
d2<-dim(C)[2]
d3<-dim(C)[3]

#Create an empty d1*d2*d3 array which will be the concatenation of C and D
E<-array(dim=c(d1,d2,d3))

#Fill in the entries of array E with the rows of C and D
for(j in 1:d2){
	for(k in 1:d3){
		for(i in 1:dim(C)[1]){
			E[i,j,k]<-C[i,j,k]
					    }
		for(i in 1:dim(D)[1]){
			E[i+dim(C)[1],j,k]<-D[i,j,k] 
					    }
			}
	}

return(CancelPairs(E))}
}



#Script to make cycle representatives into complexes

#source("VLTC.R")
#source("Nonredundant.R")
#source("CancelPairs.R")
#source("AddCycles.R")

reps_to_complex<-function(D){
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

return(list(cmplx, coordinates))
}
