# 1. Open the data frame in iris {datasets}. Use the help to know about this data. In which units are measured the length and width of sepals and petals? How many variables and observations are there in iris?

iris <- iris        #Open the data frame in iris.
help("iris")        #According to "help", iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width.
                    #There are 5 variables and 150 observations. 

Sp<- Spe <- character()            #I need to make empty vectors for each new variable.
va <-character()                   #It is important to check if it is character o numeric.
Me <- Se <- Med <- Min <- Max <- numeric()

for(i in levels(iris$Species)){   #i is a random value given to the Species column.
  for(j in names(iris)[-5]){      #j is a random value given to all the other variables, in this case, minus the fifth variable, which is Species.
    
 # 2. #Sp is the vector with the names of the genus and species (complete name, not just the species as it appears on iris dataframe)    
    
    Sp<- c(Sp,paste("Iris",i))   
    Spe <-c(Spe,i)                #Spe is the vector that allows the command to go through the values related to the species in the data frame iris.
    
# 3. Create a vector with the name of all quantitative variables.
    
    va <- c(va,j)
    
# 4. Make a data frame with the combination of the two previous vectors.
    
    d <-data.frame (Species = Sp, variables=va)
    
# 5. Using dataframe from exercise 4, make a data frame with the following variables:Species, Variable, mean, standard_error, median, minimum and maximum.
    
    x <- iris[iris$Species ==i,j]  
    Me <- c(Me, mean(x))
    Se <- c(Se, sd(x) / sqrt(length(x)))
    Med <- c(Med, median(x))
    Min <- c(Min, min(x))
    Max <- c(Max, max(x))
    
  }}                                  #Closing brackets.

d <-data.frame (Species = Sp, variables=va, mean=Me, standard_error=Se, median=Med, minimum=Min, maximum=Max)

# 6. Install the package writexl and use the command write_xlsx to create a yourname.xlsx file with your data frame.

writexl::write_xlsx(d,"C:/Users/Eduardo/Desktop/MarianaDaCruz.xlsx")
