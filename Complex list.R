#R Script to create a filtered complex (a 2-face; a triangle) 
#in list format similar to package TDA function "ripsFiltration"
#output and compute its persistent homology

X_0<-cbind(c(0,0,1),c(0,1,0))


#list of simplices in the filtration in order of appearance
#listed by index in the list of points in the original pt cloud:
cmplx<-list(1,2,3,c(1,2),c(1,3), c(2,3),c(1,2,3))

#vector of filtration scale values:
values<-c(0.0,0.0,0.0,1.0,1.0,sqrt(2)+0.0001,1.5)

#boolean variable for increasing scale values:
increasing<-TRUE

#list of coordinates for point cloud:
coordinates<-matrix(c(0,0,0,1,1,0), nrow=3,byrow=TRUE)

#put everything together in one big list 
#to form a RipsFiltration object:
X<-list("cmplx"=cmplx,"values"=values,"increasing"=increasing,"coordinates"=coordinates)

#Compute persistent homology on the filtered cmplx X:
diag<-filtrationDiag(X, maxdimension=2,diagLim=5.0)

#plot persistence diagram:
#(optional) confidence band of width 0.5 to exclude noise
plot(diag$diagram, band=0.5, main="persistence diagram for X")

#plot barcode:
plot(diag$diagram, barcode=TRUE, main="persistence diagram for X")
