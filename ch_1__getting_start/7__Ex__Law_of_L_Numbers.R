# The Law of Large numbers....

start <- 1
end <- 100000
c <- 0
for(i in start:end){
  X = rnorm(n = 1,mean = 0,sd = 1)
  if(X > -1 & X <1){
    message(i," ",X)
    c <- c + 1
  }
}
c/end
