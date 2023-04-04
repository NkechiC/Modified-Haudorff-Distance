#Master script to test modified Hausdorff (squared) distance
library("TDA")

source("Hausdorff distance.R")

#Describe two complexes X and Y:
cmplx<-list(1,2,3)
#values<-c(0.0)
increasing<-TRUE
coordinates<-matrix(c(-0.5,sqrt(2),5.12,2.1,exp(1),-2),nrow=3, byrow=TRUE)
X<-list("cmplx"=cmplx,"coordinates"=coordinates)

cmplx<-list(1,2,3)
#values<-c(0.0,0.0,0.0,0.0,0.0,0.0)
coordinates<-matrix(c(-1,-1,0,0,1,1), nrow=3, byrow=TRUE)
Y<-list("cmplx"=cmplx,"coordinates"=coordinates)

ans1<-sqd_complex_complex(X,Y)
ans2<-sqd_complex_complex(Y,X)
print(ans1)
print(ans2)

