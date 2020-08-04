# conditional statement

counter = 0
for(i in 1:10){
x = rnorm(n = 1,mean = 0,sd = 1)
  if(x <0.30 & x > -0.30){
    message("First: ",x)
    counter <- counter + 1
  }
  else if(x <1.00 & x > 0.30){
    message("for iteration number:", i, " the second interval")
  }
  else{
    message("out of interest")
  }

}
cat("A the the end, counter is", counter)

