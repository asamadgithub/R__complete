# In this chapter, the focus is to learn ggplot2

# ggplot2 (lesson-1)

# ---------------------------------change the names of Columns..
df <- read.csv("https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Movie-Ratings.csv")
colnames(df) <- c("Film","Genre","Critic_Rating","Audience_Rating","Budget_Million","Release_Yr")
head(df, n= 3)
tail(df)

str(df)
summary(df)

# ===================================================
# ===================================================


# -------(1: setting the dats)-------------------------------- converting int to factor:

# buz, text --> R categorize as factors, and for numbers
# R think as numeric always.. thats one obvious in summary(df)
# so Release_Yr, we need as a factor so that we can use it as color or geom...
# set the priorities... which data we need in which format..

factor(df$Release_Yr)
df$Release_Yr <-  factor(df$Release_Yr)  # after this, Release_Yr is factorized and hence we get the distribution..



# --------------------------------------- 2a:aesthetics:
ggplot(data = df, aes(x = Critic_Rating, y = Audience_Rating))



# --------------------------------------- 3:geometry:
ggplot(data = df, aes(x = Critic_Rating, y = Audience_Rating)) + 
  geom_point()



# --------------------------------------- 2b:aesthetics:  "color"
ggplot(data = df, aes(x = Critic_Rating, y = Audience_Rating, color = Genre)) + 
  geom_point()


# --------------------------------------- 2c:aesthetics:  "size"
ggplot(data = df, 
          aes(x = Critic_Rating, y = Audience_Rating, color = Genre,
          size = Budget_Million )
       ) + geom_point()
# >>> this is number-1 stuff,

# From now on we would work with the object...
fig <- ggplot(data = df, 
       aes(x = Critic_Rating, y = Audience_Rating, color = Genre,size = Budget_Million ))


# scatter plots
fig + geom_point()

# line plot
fig + geom_line()

# line + scatter plot
fig + geom_line() + geom_point() 


# --------------------------------------- 2d:aesthetics:  overriding
fig <- ggplot(data = df, 
              aes(x = Critic_Rating, y = Audience_Rating, color = Genre,size = Budget_Million ))

fig

fig + geom_point()    #  "geom" is assuming "aes" from "fig" object , but we can set
fig + geom_point(aes(size = Critic_Rating ))
fig + geom_point(aes(color = Budget_Million ))

# even we can overside the x,y 
fig + geom_point(aes(x = Budget_Million)) + # xaxis title is still the same, but easy to fix
      xlab("Budget in Millions")

# ===================================================
# ===================================================

# ------------------- mapping Vs settings

obj <- ggplot(data = df, 
              aes(x = Critic_Rating, y = Audience_Rating))
obj + geom_point()

# There are two ways we can add colors


#1. mapping (tough):
obj + geom_point(aes(color = Genre))
#2. setting (tough):
obj + geom_point(color = "DarkGreen")
# Error way:
obj + geom_point(aes(color = "DarkGreen")) # there is a legends, 
# Note: actually we are mapping , to the already existing "color"..
# aes() func is used for maping only..; and the value is variable ... this variable is passed via aes() func 
# on the other hand, "hardcoded" name is just setting, no need for aes() func

# easy to remeber... aes(color = Genre) means mapping and its variable, which must be a "factor"  variable in R enviroment
# geom_point( color = "blue"), it just setting..
# dont use hard code color with aes()...

# ------------ more exapmples
    # mapping:
head(df)
obj + geom_point(aes(size = Budget_Million))
   # setting
obj + geom_point(size = 10)

   # ERRor
obj + geom_point(aes(size = 10))
  
  