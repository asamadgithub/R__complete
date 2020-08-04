
# short-cuts of running loops in R
getwd()
setwd("/Users/asamad/Documents/programming_Coding/learing_R/ch_4__advance_R/Weather Data")


##------------------------------------------------------Data Preparation

chicago <- read.csv("Chicago-C.csv", row.names = 1)
houstin <- read.csv("Houston-C.csv", row.names = 1)
new_york <- read.csv("NewYork-C.csv",row.names = 1)
san_Francicso <- read.csv("SanFrancisco-C.csv",row.names = 1)

# a data frame is a list of equal-length vectors. 
# This makes it a 2-dimensional structure, 
# so it shares properties of both the matrix and the list.

typeof(chicago)
is.data.frame(chicago) 

# convert to matrix, (ie of integer type for vec. operations)
chicago <- as.matrix(chicago)
houstin <- as.matrix(houstin)
new_york <- as.matrix(new_york)
san_Francicso <- as.matrix(san_Francicso)

# make a combine list
weather <- list(chicago = chicago,houstin = houstin, new_york=new_york,san_Francicso = san_Francicso)
weather
typeof(weather$chicago)

##------------------------------------------------------What is apply family
# 0. apply() **
# 1. tapply()     : use on a vector to extract subgroups amd apply a function to them
# 2. by           :     on dF, same as of groupby in SQL/Pandas..
# 3. eapply()     :     on environment E
# 4. lapply() **  :     on an element of a list
# 5. sapply() **  :   a version of lapply(), 
# 6. vapply()     : get a pre-specified type of return value
# 7. replicate    : run a function several times
# 8. mapply()     : 
# 9. rapply()     : 



##------------------------------------------------------What is apply family
?apply
# mean(chicago["AvgHigh_C",])
apply(X = chicago,MARGIN = 1,FUN = mean)
apply(X = chicago, MARGIN = 1, FUN = max)

# just for practise...
apply(X= chicago, MARGIN = 2,FUN = max)
apply(X = chicago, MARGIN = 2,FUN = min)

# comapre: AvgHigh_C,AvgLow_C,AvgPrecip_mm,DaysWithPrecip,HoursOfSunshine
# i.e. avg of avgs
apply(X = chicago,MARGIN = 1,FUN = mean)
apply(X = houstin,MARGIN = 1,FUN = mean)
apply(X = new_york,MARGIN = 1,FUN = mean)
apply(X = san_Francicso,MARGIN = 1,FUN = mean)


##------------------------------------------------------create apply function via loop
# method-1, via loop
chicago

chicago_avg <- NULL
chicago_avg

for(nam_ in rownames(chicago)){
  chicago_avg <- c(chicago_avg,mean(chicago[nam_,]))
}
names(chicago_avg) <- rownames(chicago)

chicago_avg


# method-2
apply(chicago,1,mean)


##------------------------------------------------------lapply()
# example-1
t(chicago)

?lapply

typeof(weather)
# weather is a list with main index as cities, and so apply the FUN = t
weather_trans <- lapply(X = weather, FUN = t)  # t(chicago), t(city2), t(city3), t(city4)
weather_trans

# example-2: add 1:12 as a vector to each city 
chicago
rbind(chicago, new_row = 1:12)      # here "new_row" is the :label: of new vector
lapply(weather, rbind,add_row = 11:22)
weather

# example-3: rowmean to all of cities
# use rowmean
rowMeans(chicago)

lapply(weather,rowMeans)   # getting better...

# so basically: supply data and one function.. (in case of Python, we can even define lambda function here...)

#others:
#rowMeans
#colMeans

##------------------------------------------------------combining, lapply() and []
# get the first element of AvgHigh_C of all cities..
weather$chicago[1,1]
#or
weather[[1]][1] # weather[[1]][1], weather[[2]][1], weather[[3]][1], weather[[4]][1]

lapply(weather,"[",1,1)  # waow......
lapply(weather,"[",1,)  # waow......
lapply(weather,"[",1,c(1,2))  # waow......
lapply(weather,"[",c(1:5),1)
lapply(weather,"[",,1)

##------------------------------------------------------adding own function, as of lamba in Python
lapply(weather, rowMeans)
# so we can replace rowMeans by our function...

function(x){}

lapply(weather, function(x) x[5,] )

# subtract avgHigh from avgLow
weather
lapply(weather, function(x) x[1,]-x[2,]   )

lapply(weather, function(x) round((x[1,]-x[2,])/x[2,],2))


##------------------------------------------------------sapply()
?sapply
weather

lapply(X = weather,FUN =  "[",1,7)
# do the same with sapply
sapply(X = weather,FUN =  "[",1,7:9)  # just to simply, it return a vector..


# HoursOfSunshine for last 4 month, every year
lapply(X = weather, FUN = "[",5,10:12)  # list type , as of input data type retained..
sapply(X = weather, FUN = "[",5,10:12)  # easy to see, its a matrix


# rowMeans example
lapply(X = weather,FUN = rowMeans)
sapply(X = weather,FUN = rowMeans) # try simplyfy = FALSE , its equal to lapply() then..



##------------------------------------------------------nest apply function
weather
?rowMeans
lapply(weather, rowMeans)



# have a look at chicago
chicago
# how to get the row maximum here
max(chicago[1,])

# in a loop
for(n in 1:5){
  print(max(chicago[n,]))
}

# as function
apply(chicago,1,max)
apply(houstin,1,max)
apply(new_york,1,max)
apply(san_Francicso,1,max)

apply(weather,1,max)  # because apply only takes matrix so here is lapply
lapply(weather, apply,1,max) 
sapply(weather, apply,1,max) 

# for me the more sense is like
lapply(weather, function(x) xxxxxx ) # xxx <- area for the function
lapply(weather, function(x) apply(x,1,max) )






