?matplot

FieldGoals


players = rownames(FieldGoals)
players

players[1]

FieldGoals[players[1],"2005"]
FieldGoals[players[1],]


for(i in players[1]){
  print(i)
  print(FieldGoals[players[1],])
}

# we are doing this, buz we need row by row.. but why not tranpose

FieldGoals
t(FieldGoals)


matplot(t(FieldGoals/Games), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01,legend = players, col = c(1:4,6), pch = 15:18, horiz = F)

par("mar")
par(mar=c(1,1,1,1))



matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01,legend = players, col = c(1:4,6), pch = 15:18, horiz = F)

