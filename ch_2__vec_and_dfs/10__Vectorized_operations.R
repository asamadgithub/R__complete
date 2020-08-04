# why previously used is not so much used in R

v1 = seq(1,10,1)
v2 = seq(11,20,1)

# additionof vector-a , vector-b
v3 = v1 + v2

# For numerical concatination
v_num = c(v1,v2)


# boolean operation between vectors
v4 <- v1 > v2

# if vector lengths are not equal, then "R" 
# will perform recycling of smaller vector i.e. repeat it
# if smaller vector is not multiple of greater one, .. recyclling wirh 

v5 <- seq(1,5,1)

v6 <- v1 + v5


# its very natural to send a vector to f() and return from f()