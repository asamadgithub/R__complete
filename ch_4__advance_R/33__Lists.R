# --------------------------------------Import the data and formating date_Time stamps via POSIXct

utl <- read.csv("https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P3-Machine-Utilization.csv")
utl$Utilization <- 1 - utl$Percent.Idle
#?POSIX,?POSIXct,...   
utl$POSIX_time <- as.POSIXct(utl$Timestamp, format = "%d/%m/%Y %H:%M")
utl <- utl[,c(5,2,3,4)]

head(utl, n = 6)
colnames(utl)

# --------------------------------------What is a list?
# vector = only data element of same type ( e.g if one is character, it will convert all other to character as well)

# Here I need a list <- name of machine, stats(min,median,max), logical(if efficiny <90%)

head(utl)
tail(utl)

m1 = utl$Machine == "RL1"  # subsetting according to machine name
RL1 <- utl[m1,]   
tail(RL1) 


#max,min,median
is.na(RL1$Utilization)
RL1[!complete.cases(RL1$Utilization),]  # means there are some "NA" entries...

minimum_RL1 = min(RL1$Utilization, na.rm = T)
maximum_RL1 = max(RL1$Utilization, na.rm = T)
median_RL1 = median(RL1$Utilization, na.rm = T)

# logical RL1
logical_RL1 <- length(which(RL1$Utilization < 0.90)) > 0


# combine in a list
list_RL1 <- list(RL1,c(minimum_RL1,median_RL1,maximum_RL1),logical_RL1)

list_RL1

# --------------------------------------Naming different components of list
# method-1
list_RL1
names(list_RL1)  # its NULL at this time
names(list_RL1) <- c("Machine","Stats","Low_Threshold")
list_RL1
length(list_RL1)

# method-2 ; righ at the begining..
rm(list_RL1)
list_RL1 <- list(Machine = RL1,Stats = c(minimum_RL1,median_RL1,maximum_RL1),Low_Threshold = logical_RL1)
list_RL1


# --------------------------------------Extract components of a list
# method-1: [ ]  --> always return a list
names(list_RL1)
list_RL1["Machine"]
list_RL1[1]
list_RL1[2]
typeof(list_RL1[2])


# method-2: [[]] --> return the actual object
list_RL1[[1]]
list_RL1[[2]]
typeof(list_RL1[[2]])

# method-3: $- same as [[]] but prettier
list_RL1$Machine
list_RL1$Stats
typeof(list_RL1$Stats)


# quiz... access the 3rd element of vector of list_RL1$Stats
# method-1
list_RL1[2]       # this will not work ofcourse.. buc it return list..
list_RL1[[2]][3]

# method-2
list_RL1$Stats
length(list_RL1$Stats)
list_RL1$Stats[3]


# --------------------------------------Adding/subtracting from list
#rm(list_RL1)
#list_RL1 <- list(Machine = "RL1",Stats = c(minimum_RL1,median_RL1,maximum_RL1),Low_Threshold = logical_RL1)
#list_RL1

# case-1 within in one sub-list
# ----------------------------
# adding/insering
list_RL1

list_RL1$Machine[2] <- "222"
list_RL1$Machine[3] <- "333"
list_RL1$Machine[4] <- "444"

# deleting
list_RL1$Machine
list_RL1$Machine <- list_RL1$Machine[-which(list_RL1$Machine == "222")]


# case-2 in th main list
# ----------------------
# adding/insering

# method-1
# with predefined index number
list_RL1
list_RL1[4] <- "Addition at index 4 in the main list"

# method-2
# assume column is already there and assign the data/values
# add hours of null vallues in current list
list_RL1
head(RL1)
RL1[is.na(RL1$Utilization),"POSIX_time"]

list_RL1$Unknown_Data_Hrs <- RL1[is.na(RL1$Utilization),"POSIX_time"]
list_RL1$Data <-    RL1


# method-3 removing main element(vector) in the list
list_RL1   # lets say remove number 4th position
list_RL1[4] <- NULL
list_RL1   # indexing also shifted little bit above...


# --------------------------------------Subsetting a list


# task-1: access 1st or 2nd element of "Unknown_Data_Hrs"
list_RL1$Unknown_Data_Hrs
list_RL1$Unknown_Data_Hrs[1]

#or
list_RL1[[4]][1]



names(list_RL1)

list_RL1[1]
list_RL1[1:2]
list_RL1[c(1,4)]  # we also use names in "name-1", "name-2" inside c()

subset_1 <- list_RL1[c(1,4)]
subset_1  # names carry over 

##
##  double [[]] are desingned only to access the component not for subsetting
##  [[1:3]] , i.e. its wrong

# --------------------------------------Plotting
library(ggplot2)
head(utl, n = 3)
#plot_data <- utl[complete.cases(utl),]
#head(plot_data)

obj <- ggplot(data = plot_data)


obj + geom_line(na.rm = T, aes(x = POSIX_time, y = Utilization, color = Machine ), size = 1.2) + 
      facet_grid(Machine~.) + 
  geom_hline(yintercept = 0.90, color = "Blue", linetype = 3)

# --------------------------------------add plot to the list
