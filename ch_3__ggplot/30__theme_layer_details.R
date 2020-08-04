## The last ,,.. "theme layer" (non-data ink)

library(ggplot2)
?geom_smooth
df <- read.csv("https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Movie-Ratings.csv")
colnames(df) <- c("Film","Genre","Critic_Rating","Audience_Rating","Budget_Million","Release_Yr")
head(df, n = 3)

# ===============================================
# ===============================================

# --------------------- theme layer only for one chart...

n <- ggplot(data = df, aes(x = Budget_Million))

n + 
  geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") 


  # 1): axes label
n + 
  geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  xlab("Money Axis") + ylab("# of movies")
 
 # 2): Label formating

n + 
  geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  xlab("Money Axis") + ylab("# of movies") + 
  theme(axis.title.x = element_text(color = "red", size = 30),
        axis.title.y = element_text(color = "blue", size = 25))

 # tickmark formatting:
n + 
  geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  xlab("Money Axis") + ylab("# of movies") + 
  theme(axis.title.x = element_text(color = "red", size = 30),
        axis.title.y = element_text(color = "blue", size = 25),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 14),
        )
  # legend formatting
n + 
  geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  xlab("Money Axis") + ylab("# of movies") + 
  theme(axis.title.x = element_text(color = "red", size = 30),
        axis.title.y = element_text(color = "blue", size = 25),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 14),
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 18), 
        legend.position = c(1,1), 
        legend.justification = c(2,2)
        )

  # title of the plot
n + 
  geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  xlab("Money Axis") + ylab("# of movies") + 
  ggtitle("This is my title") +
  theme(axis.title.x = element_text(color = "red", size = 30),
        axis.title.y = element_text(color = "blue", size = 25),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 14),
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 18), 
        legend.position = c(1,1), 
        legend.justification = c(2,1), 
        
    
        plot.title = element_text(size = 40, color = "Darkblue", family = "Courier")
  )



?theme


