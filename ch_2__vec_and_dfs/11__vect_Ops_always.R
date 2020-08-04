## the power of vectorzied operation

x <- rnorm(5)
x

# iteratin via for loop as before "R/Python type"
# ------------------------------
for(i in x){
  print(i)
}

# using square bracket "convectional"
# -------------------
for(j in 1:length(x)){
  print(x[j])
}


#=======================================
# Vectorize VS   Decvectorize
#=======================================

n <- 100000000
a <- rnorm(n)
b <- rnorm(n)

# vectorized approach:
c <- a*b


# devectorized approach
d <- rep(NA,n)
for(i in 1:n){
  d[i] = a[i] * b[i]
}


# low level programming language worker better...
# for a devectorized approach....


