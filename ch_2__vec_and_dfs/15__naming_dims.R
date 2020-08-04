# naming dimension
charlie <- 1:5      # Here a 1D-vector(say row) charlie is created with said entries
charlie             # for this 1-D vector, there is no specfic name of columns.. as you can see by
names(charlie)

#==================================
# how to check the names.,

names(charlie)   # at this moment its null
names(charlie) <- c("name-a","name-b","name-c","name-d","name-e")
names(charlie)
charlie
charlie["name-d"]

# how to clear the names
names(charlie) <- NULL

# ==================================
# Naming matix D-1
tmp.vec <- rep(c("a","B","zZ"),each = 3)
tmp.vec
  # "." is not a function here, just a convection to write variable name in R

bravo <- matrix(data = tmp.vec,nrow = 3,ncol = 3)
bravo

rownames(bravo)
rownames(bravo) <- c("how","are","you")
rownames(bravo)


colnames(bravo)
colnames(bravo) <- c("x","y","z")
colnames(bravo)

bravo
bravo[2,2]
bravo["are","y"]
bravo["are","y"] <- 0
bravo




