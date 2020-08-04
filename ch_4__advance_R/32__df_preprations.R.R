# Advance course start now
# Data preparation
# ------------------- ~70% time is used for data preparation 
# Data set has lot of discrepancies



# have a look on data sheet
fin <- read.csv("https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P3-Future-500-The-Dataset.csv", na.strings = "")
head(fin)
tail(fin, n = 10)
str(fin)
summary(fin)
# Inception(Year) --> better as Factor (buz distribution not required), ID --> Factor (not distribution)
# Revenue and expenses , recognized as "Factors", its better to show --> as int

# ---------------------------------------------: converting to -> factor()
fin$ID
fin$Inception
fin$ID <- factor(fin$ID)
fin$Inception <- factor(fin$Inception)




# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++> FVT.. trap
# character to numeric
tmp1 <- c("12","13","14","15","16")
typeof(tmp1)
tmp2 <- as.numeric(tmp1)
typeof(tmp2)


# factor to numeric
tmp3 <- factor(c("12","13","14","15","16"))
tmp3          # levels are shown here., but R also recognize its numbers thats way,  "12" not there..
typeof(tmp3)  # this "integer" is not reffered to vector, but the type of factorization.. which is ofcourse integer

tmp4 <- as.numeric(tmp3)
tmp4
typeof(tmp4)  # here FVT is obvious, see it converts the factors labels themselves not the assosiated data


levels(tmp3)  # here we get the real data which is level
tmp5 <- as.numeric(levels(tmp3))
tmp5

   # but the correct way is via character route
tmp6 <- as.numeric(as.character(tmp3))
tmp6
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>: \\end, FVT.. trap



# ---------------------------------------------: back to data set [dealing with factors and int, numeric etc]
head(fin, n = 3)
str(fin)
summary(fin)
# ~~~ two important functions
?sub
?gsub
# ~~~ replace " Dollars" & "," in Expenses column
fin$Expenses
fin$Expenses <- gsub(" Dollars","",x =fin$Expenses)  # beauty*
fin$Expenses <- gsub(",","",x =fin$Expenses)         # beauty*

# ~~~ replace "$" and "," from Revenue column
fin$Revenue
fin$Revenue <- gsub(",","",fin$Revenue)    # beauty*; 
fin$Revenue <- gsub("\\$","",fin$Revenue)  # plz mind, "$" is a special character in R; # beauty*

# ~~~ replace % sign from the Growth
fin$Growth
fin$Growth <- gsub("%","", fin$Growth) # beauty*
   # beauty* of gsub is its replace the required stuff and make it character at the same time

# ~~~ now apply numeric to Revenue, Expenses, Growth
fin$Revenue <- as.numeric(fin$Revenue)
fin$Expenses <- as.numeric(fin$Expenses)
fin$Growth <- as.numeric(fin$Growth)


# ---------------------------------------------: back to data set [dealing with missing data]
  # 1): predict with 100% accuracy , (if state is missing but city is known)
 # 2) : leave the record the as is , (work if that field is not so important or the computation method will take care of it)
 # 3): Remove the record entirely.. (drawback... analysis become less accurate)
 # 4): replace with mean or median ( quite popular...)
 # 5): fill by coorelation and similarities .. hehe.. (better from median/mean)
 # 6): Introduce dummy variable for missing item.. ( dummy variable is calcuated from coorelation and other statistical techniques)
  
  # ~~~~~~ so first, what is NA, and elegent way to find it..
?NA # its != TRUE,FALSE .. can't be compare with TRUE OR FALSE,, its just missing

head(fin, n = 24)
complete.cases(fin)
fin[!complete.cases(fin),]  # NA --> non-factors and <NA> --> factorized data.. simple, buz otherwise NA can be a factor hehe..




# ---------------------------------------------: Tutorial-1 [How to filter missing data], which operator
head(fin)
fin[fin$Revenue == 9746272,]  # buz NA is special in R, R dont know.. It thinks it might be possible that they are equal e.g.

fin$Revenue[1] == NA
which(fin$Revenue == 9746272)
fin[3,]
fin[which(fin$Revenue == 9746272),]  # first it determine the position neglecting NA , and then we are passing to fin[....]

head(fin)
fin$Employees == 45
fin[fin$Employees == 45,]
which(fin$Employees == 45)  # These are the row indices
fin[which(fin$Employees == 45),]



# ---------------------------------------------: Tutorial-2 [How to filder missing data], is.na() operator
head(fin, n = 24)

is.na(fin$Revenue)
fin[is.na(fin$Revenue),]

# ---------------------------------------------: Start adjusting the data., [company names, no way to get .. just remove]
# 1): first make the backup of the data..
fin_backup <- fin
#fin <- fin_backup
fin[!complete.cases(fin),]          # get all the data 
fin[!is.na(fin$Industry),]          # check where "NA" and opposite

fin <- fin[!is.na(fin$Industry),]  # overide 
fin                                # have a look at that...































   # now the issue is, index is not reset yet.. have a look at 10,11,12,13....
fin
1:nrow(fin)
rownames(fin) <- 1:nrow(fin)

# ---------------------------------------------: fill with 100% surity.. [if possible anywhere..]
  # how to restore the value in state column..
head(fin)
fin[!complete.cases(fin$State),]


fin[!complete.cases(fin$State),"State"]
fin[!complete.cases(fin$State) & fin$City == "New York",]
fin[!complete.cases(fin$State) & fin$City == "New York","State"] <- "NY"


fin[!complete.cases(fin$State),]
fin[!complete.cases(fin$State) & fin$City == "San Francisco",]
fin[!complete.cases(fin$State) & fin$City == "San Francisco","State"] <- "CA"

fin[!complete.cases(fin$State),]
fin[82,]
fin[c(82,265),]


fin[!complete.cases(fin),]      # have a look at overall missing values once again..




# ---------------------------------------------: Median imputation -1, "Employees" column

head(fin, n = 10)                     # have a look at employee, at row # 3; 
fin[!complete.cases(fin),]

     # find the median of an emploee Column... method-1, Python like, just extract one column 
fin$Employees                        # look at *1   
median(fin$Employees, na.rm = TRUE)

    # find the median of an emploee Column... method-1, via df route
fin[,"Employees"]                   # here is *1
median(fin[,"Employees"], na.rm = TRUE)

   # Increase the complexity... with Industry == "Retail"
mask <- fin$Industry == "Retail"
fin[mask,]
fin[mask,"Employees"]
median(fin[mask,"Employees"], na.rm = TRUE)

med_employee_retail <- median(fin[mask,"Employees"], na.rm = TRUE)

  # Increase the complexity... with Industry == "Retail"
fin[!complete.cases(fin),]
med_employee_finance <- median(fin[fin$Industry == "Financial Services","Employees"],na.rm = TRUE)

   # assign, med_employee_retail  & med_employee_finance to the relevant place
fin[!complete.cases(fin),]
fin[3,]
# fin[3,"Employees"] <- xxx   # but there could be multiple rows so better to create a separate filter here as well...

fin[is.na(fin$Employees),]


fin[is.na(fin$Employees) & fin$Industry == "Retail" ,]
fin[is.na(fin$Employees) & fin$Industry == "Financial Services" ,]


fin[is.na(fin$Employees) & fin$Industry == "Retail" ,"Employees"]
fin[is.na(fin$Employees) & fin$Industry == "Financial Services" ,"Employees"]



fin[is.na(fin$Employees) & fin$Industry == "Retail" ,"Employees"] <- med_employee_retail
fin[is.na(fin$Employees) & fin$Industry == "Financial Services" ,"Employees"] <- med_employee_finance


fin[3,]

















fin[!complete.cases(fin),]   %%%%%%%%%%%% untill here

# ---------------------------------------------: Median imputation -1, "Growth" column
fin[!complete.cases(fin),]
fin[fin$Industry == "Construction",]
med_growth_construc <- median(fin[fin$Industry == "Construction","Growth"], na.rm = TRUE)

fin[is.na(fin$Growth) & fin$Industry == "Construction","Growth"]  <- med_growth_construc

fin[!complete.cases(fin),]
















# ---------------------------------------------: Median imputation -2, "Revenue" column
fin[!complete.cases(fin),]    # lucikly both are construction industries...
med_Rev_Constrcution <- median(fin[fin$Industry == "Construction" ,"Revenue"], na.rm = TRUE)
fin[is.na(fin$Revenue)  & fin$Industry == "Construction","Revenue"] <-  med_Rev_Constrcution 






















# ---------------------------------------------: Median imputation -2, "Expenses" column

fin[!complete.cases(fin),]
med_Expns_Construction <- median(fin[fin$Industry == "Construction","Expenses"], na.rm = TRUE)

fin[is.na(fin$Expenses) & fin$Industry == "Construction" & is.na(fin$Profit),]        #  another layer of protection
fin[is.na(fin$Expenses) & fin$Industry == "Construction","Expenses"] <- med_Expns_Construction


















































# ---------------------------------------------: Last three remaining values, 
# Revenue - Expenses = Profit
#fin[8,"Profit"] <- fin[8,"Revenue"] - fin[8,"Expenses"]
fin[!complete.cases(fin),]
fin[is.na(fin$Profit),] 
fin[is.na(fin$Profit),"Profit"] <-  fin[is.na(fin$Profit),"Revenue"]  - fin[is.na(fin$Profit),"Expenses"]

fin[!complete.cases(fin),]
fin[is.na(fin$Expenses),"Expenses"] <-  fin[is.na(fin$Expenses),"Revenue"]  - fin[is.na(fin$Expenses),"Profit"] 

fin[!complete.cases(fin),]    # only one exception is remaining, and we will keep as it is..







# ---------------------------------------------: Visualization...
#install.packages("ggplot2")
library(ggplot2)
obj1 <- ggplot(data = fin)

# Graph-1 , scatter plot
obj1 + geom_point(aes(x=Revenue, y = Expenses, color = Industry, size = Profit)) 


fin[is.na(fin),]


# Graph-2,
obj1 + 
  geom_point(aes(x = Revenue, y = Expenses, color = Industry))+
  geom_smooth(aes(x = Revenue, y = Expenses,color = Industry, size = Profit),fill = NA, size = 1.2)

