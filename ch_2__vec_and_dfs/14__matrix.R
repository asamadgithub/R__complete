# Just like vector, matrix also.. only support the date of same type.....

Salary
Seasons
Players
Salary
Salaries


# rbind() --> row by row binding
# cbind() --> column by column bind


# 1):  matrix
?matrix
mydata <-1:20
A <- matrix(data = mydata,nrow = 4, ncol = 5 )
A
A[2,3]


B <- matrix(data = mydata,nrow = 4, ncol = 5, byrow = T )
B
B[2,5]


# 2):  rbind()

v1 <- 1:5
v2 <- 6:10
v3 <- 11:15
v_rbind <- rbind(v1,v2,v3)
v_rbind


# 3): cbind()
v_cbind <- cbind(v1,v2,v3)
v_cbind








