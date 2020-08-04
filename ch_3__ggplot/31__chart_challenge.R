df <- read.csv("Section6_HWD.csv")
colnames(df)
df["Gross...US"]
df["Genre"]
df["Studio"]
df["Budget...mill."]

# filtering the data
mask1 <- df["Genre"] == "action" | df["Genre"] == "adventure" | df["Genre"] == "animation" | df["Genre"] == "comedy" |  df["Genre"] == "drama"  
#mask2 <-df["Studio"] == "Buena Vista Studios" | df["Studio"] == "Fox"  |  df["Studio"] == "Paramount Pictures"  |  df["Studio"] == "Sony"  |  df["Studio"] == "Universal"|  df["Studio"] == "WB"   
mask2 <- df$Studio  %in% c("Buena Vista Studios","Studio","Fox","Studio","Paramount Pictures","Sony","Universal","WB")

# new dataframe df2
df2 <- df[mask1 & mask2,]
df2

# excusively check the x,y axis ahead
df2["Genre"]
df2["Gross...US"]

# have a look on data briefly., 
str(df2)
summary(df2)

# import the library
library(ggplot2)

# just getting the data.. nothing more
fig <- ggplot(data = df2, aes(x = Genre, y = Gross...US))

# setting jitter with size and color; and boxplot with opacity
fig +   geom_jitter(aes(size =  Budget...mill., color = Studio)) + geom_boxplot(alpha = 0.70)


fig +  
  geom_jitter(aes(size =  Budget...mill., color = Studio)) +
  geom_boxplot(alpha = 0.70, outlier.color = NA) + 
  ggtitle("Domentic Gross % by Genre") + 
  ylab("Gross % US") +
  theme(
    axis.title.x = element_text(size = 12, color = "blue", family = "Courier"),
    axis.title.y = element_text(size = 12, color = "blue", family = "Courier"),
    plot.title = element_text(size = 15, color = "Darkblue", family = "Courier")
  )

