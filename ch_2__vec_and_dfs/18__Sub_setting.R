# This topic is taken as light.. but some technical issue is complex...

x <- c("a","b","c","d","e","f")
x
c(1,5)
x[c(1,5)]   # first and fifth value
x[1]        # for only one value

# This is called subsetting with vector..

#==================================================
# We can also sub-set with Matrices...
Games

Games[1:3,4:10]   # subset of a matrix is also a matrix

Games[c("KobeBryant","DwayneWade"),]  # compare first and last player
Games[c(1,10),]

Games[,3:4]  # analyse 2007,2008 for all players, can also use "name" of cols

# so whenever we are subsetting, return is a matrix... but this is not a case always..

# ================================================

Games
Games[1,]  # see there is no row label

is.matrix(Games[1,])
is.vector(Games[1,])

Games
Games[1,1]
is.vector(Games[1,1])

# ==============================================
# but we can even get matrix behavior with 1 element of 1-D vector evem
Games
Games[1,1,drop=F]
is.matrix(Games[1,1,drop=F])   
is.vector(Games[1,1,drop=F])
# if we set "drop=F", we will always get the type as we have orignally i.e. 
# whatever the type of Games is



