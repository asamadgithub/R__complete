# This lesson , facets layer in detail

library(ggplot2)
?geom_smooth
df <- read.csv("https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Movie-Ratings.csv")
colnames(df) <- c("Film","Genre","Critic_Rating","Audience_Rating","Budget_Million","Release_Yr")
head(df, n = 3)


# ============================================
# ============================================

# histogram with facets
h <- ggplot(data = df, aes(x = Budget_Million))
h
    # simple histogram
h + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black" )
    # with facets
h + geom_histogram(binwidth = 10, aes(fill = Genre), 
                   color = "black" ) +
  facet_grid(Genre~., scales = "free")


# ============================================
# ============================================
#  exp-2, scatter plot with facets
head(df)
w <- ggplot(data = df, aes(x = Critic_Rating, y =Audience_Rating, color = Genre ))
w + geom_point() 
     # with facets, 
w + geom_point() + 
  facet_grid(Genre~., scales = "free")

w + geom_point() + 
  facet_grid(.~Release_Yr, scales = "free")

w + geom_point() + 
  facet_grid(Genre~Release_Yr, scales = "free") + 
  geom_smooth()

w + geom_point(aes(size = Budget_Million)) + 
  facet_grid(Genre~Release_Yr, scales = "free") + 
  geom_smooth()
warnings()

