#Second script to test modified Hausdorff (squared) distance
library("TDA")

source("Hausdorff distance.R")

#Describe two complexes X(a octahedron) and Y(a rhombus with a branch):
cmplx<-list(1,2,3,4,5,6,c(1,3),c(1,4), c(1,5),c(1,6),c(3,4),c(3,5),
            c(5,6),c(4,5),c(4,6),c(2,3),c(2,4),c(2,5),c(2,6),c(1,3,4),
            c(1,4,6),c(1,5,6),c(1,3,5),c(2,3,4),c(2,4,6),c(2,3,5),
            c(2,5,6),c(3,4,5),c(4,5,6),c(1,4,5),c(2,4,5),c(1,3,4,5),
            c(1,4,5,6),c(2,3,4,5),c(2,4,5,6))
#6 vertices, 13 1-simplices, 12 2-faces, 4 tetrahedra
#values<-c(0.0,0.0,0.0,0.0,0.0,0.0,0.0)
increasing<-TRUE
coordinates<-matrix(c(0,0,1,0,0,-1,-1,0,0,0,-1,0,0,1,0,1,0,0), nrow=6,byrow=TRUE)
X<-list("cmplx"=cmplx,"coordinates"=coordinates)


cmplx<-list(1,2,3,4,5,c(2,1),c(1,3), c(2,3),c(2,4),c(3,4),c(5,2),
            c(1,2,3),c(2,3,4))
#5 vertices, 6 edges, 2 2-faces 
#values<-c(0.0,0.0,0.0,0.0,0.0,0.0)
increasing<-TRUE
coordinates<-matrix(c(-2,0,0,0,0,0,2,0,0,1,1,0,1,-1,0), nrow=5,byrow=TRUE)
Y<-list("cmplx"=cmplx,"coordinates"=coordinates)

ans1<-sqd_complex_complex(X,Y)
ans2<-sqd_complex_complex(Y,X)
print(ans1)
print(ans2)
