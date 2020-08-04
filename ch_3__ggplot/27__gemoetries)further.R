# ggplot2 (lesson-2)

# Histogram and density plot i.e.
# gemoerty and statistics layer at the same time..

df <- read.csv("https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Movie-Ratings.csv")
head(df)
colnames(df) <- c("Film","Genre","Critic_Rating","Audience_Rating","Budget_Million","Release_Yr")
# ==============================================================
# ==============================================================
# --------------------------------------------- histogram chart
s <- ggplot(data= df, aes(x = Budget_Million))
s
s + geom_histogram(binwidth = 10)
    # color maping
s + geom_histogram(binwidth = 10, aes(color = Genre))
s + geom_histogram(binwidth = 10, aes(fill = Genre))

    # set border
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

# --------------------------------------------- density chart
d <- ggplot(data= df, aes(x = Budget_Million))
d
d + geom_density(aes(fill = Genre))
d + geom_density(aes(fill = Genre), position = "stack")  # secret variable



# ==============================================================
# ==============================================================
# ------------------------------------tip, starting layer

t <- ggplot(data = df, aes(x = Audience_Rating))
t
t + geom_histogram(binwidth = 5, fill = "White", color = "Black")

      # another way,.,  ( when more fliexibilty is required...)
u <- ggplot(data = df)
u
u + geom_histogram(
  aes(x = Audience_Rating), 
  fill = "White", color = "Black")

    # e.g. just change the "x" variable; very flexible.. load once and go on exploting
head(df, n = 2)
u + geom_histogram(
  binwidth = 5,
  aes(x = Critic_Rating), 
  fill = "White", color = "Black")








