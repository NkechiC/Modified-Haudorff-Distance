#Master script to test modified Hausdorff (squared) distance
library("TDA")

source("Hausdorff distance.R")

#Describe two complexes X() and Y():
cmplx<-list(1,2,c(1,2))
increasing<-TRUE
coordinates<-matrix(c(0.5,1,4,3), nrow=2,byrow=TRUE)
X<-list("cmplx"=cmplx,"coordinates"=coordinates)

cmplx<-list(1,2)
coordinates<-matrix(c(1,2,1.5,1), nrow=2,byrow=TRUE)
Y<-list("cmplx"=cmplx,"coordinates"=coordinates)

ans1<-sqd_complex_complex(X,Y)
ans2<-sqd_complex_complex(Y,X)
print(ans1)
print(ans2)

