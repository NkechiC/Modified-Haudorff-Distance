#Script to add two cycles together and cancel repeated edges

source("CancelPairs.R")

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