

# ---------------- Statistical Transformations
library(ggplot2)
?geom_smooth

df <- read.csv("https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Movie-Ratings.csv")
colnames(df) <- c("Film","Genre","Critic_Rating","Audience_Rating","Budget_Million","Release_Yr")
head(df, n = 3)


u <- ggplot(data = df, aes(x = Critic_Rating, y = Audience_Rating, color = Genre))
u
u + geom_point() + geom_smooth(fill = NA)


     #  Box plots , 1st way
v <- ggplot(data = df, aes(x = Genre, y = Audience_Rating, color = Genre))
v
v + geom_boxplot(size = 1.2) + geom_point()

v + geom_boxplot(size = 1.2) + geom_jitter()  # nice tip
    # jitter is a very nice combination with boxplot..

    #  Box plots , 2nd way
v + geom_jitter() + geom_boxplot(size = 1.5, alpha = 0.50)

