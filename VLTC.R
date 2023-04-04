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
