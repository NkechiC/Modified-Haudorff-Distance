#Hausdorff distance script

#1. Compute square of Euclidean distance 
#between two points in R^d

sqdist<-function(x,y){
  #Check that x and y both have d coordinates: 
  if(!length(x)==length(y)){print("x and y have different dimensions!");
    return(-1)}
  
  else{p<-sum((x-y)^2); return(p) }  
  
}

#2.Compute Euclidean squared distance from a vertex in X 
#(first simplicial complex) to a simplex in Y (second complex)

#The function sqd_vertex_simplex takes input (X,m,Y,n)
#spits out distance from mth vertex of X to nth simplex of Y

#initialize first vertex in X:
#v0<-X$coordinates[1]
sqd_vertex_simplex<-function(X,m,Y,n){
  #Set minimum at infinity and keep reducing it:
  min1<- Inf
  for(i in Y$cmplx[[n]]){
    p <- sqdist(X$coordinates[m,], Y$coordinates[i,])
    if(p<min1){min1<-p}
  }
  return(min1)
}


#3. Compute Euclidean squared distance from a simplex in X 
#(first simplicial complex) to a simplex in Y (second complex)

#The function sqd_simplex_simplex takes input (X,m,Y,n)
#spits out distance from mth simplex of X to nth simplex of Y


max1<-0

sqd_simplex_simplex<-function(X,m,Y,n){
  for(j in X$cmplx[[m]]){
    p<-sqd_vertex_simplex(X,j,Y,n)
    if (p>max1){max1<-p}
  }
  return(max1)
}

#4. Compute Euclidean squared distance from a simplex in X 
#(first simplicial complex) to the complex Y (second complex)

#The function sqd_simplex_complex takes input (X,m,Y)
#spits out distance from mth simplex of X to Y


sqd_simplex_complex<-function(X,m,Y){
  min2<- Inf
  
  for(k in 1:length(Y$cmplx)){
    p<-sqd_simplex_simplex(X,m,Y,k) 
    if(p<min2){min2<-p}
  }
  return(min2)
}

#5. Compute Euclidean squared distance from a complex X to another Y

#The function sqd_complex_complex takes input (X,Y)
#spits out distance from X to Y

sqd_complex_complex<-function(X,Y){
  max2<-0.0
  
  for(l in 1:length(X$cmplx)){
    p<-sqd_simplex_complex(X,l,Y)
    if(max2<p){ max2<-p}
  }
  return(max2)
}