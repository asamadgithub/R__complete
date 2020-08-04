# co-ordinate layer
# Limits, zoom in, zoom out, .. co

library(ggplot2)
?geom_smooth
df <- read.csv("https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Movie-Ratings.csv")
colnames(df) <- c("Film","Genre","Critic_Rating","Audience_Rating","Budget_Million","Release_Yr")
head(df, n = 3)

# ====================================================
# ====================================================
s <- ggplot(data = df, aes(x = Critic_Rating, y = Audience_Rating, color = Genre))

s + geom_point(aes(size = Budget_Million)) + 
  facet_grid(Genre~Release_Yr, scales = "free") +
  geom_smooth()

# -------------------- controlling coordiate
# limits and zoom

s + geom_point()
s + geom_point() + 
 xlim(50,100) + 
 ylim(50,100)
  # good but dont work well always.., keep in mind, its removing the values..
  # let's have alook..


n <- ggplot(data = df, aes(x = Budget_Million))
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") 


n + 
  geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  ylim(0,50)
  # basically it just truncate the data, didn't zoom in..
  
n + 
  geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  coord_cartesian(ylim = c(0,50))
  # the different is clear, save the two plot in pdf and then see... its even more obvious
  
  
# ====================================================
# ====================================================

# ------------- coordiate example with 

w <- ggplot(data = df, aes(x = Critic_Rating, y =Audience_Rating, color = Genre ))

w + geom_point(aes(size = Budget_Million)) + 
  facet_grid(Genre~Release_Yr, scales = "free") + 
  geom_smooth() + coord_cartesian(ylim = c(0,100))









  
  
  
  
