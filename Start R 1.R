#Creating simple objects and vectors---------------------------------------------

#Simple objects

Num <- 7
Tex <- "Seven"

#Vectors

NV <-c(1,3,4,Num)                      #Numeric vectors
TV <-c("One", "two", "four", Tex)      #Text vectors

###   We created four objects: Num, Tex, NV and TV.
###   We used the first two objects as part of the vectors.

### If we mix character and numeric objects into a vector, 
### it will became a character vector:

CN <-c(NV,TV)

### Convert numeric vector to character and vice versa

VNC <-as.character(NV)

### Extract part of a vector

TV[1:2]       # Extracts fist two positions of TV
TV[c(1,3)]    # Extracts positions 1 and 3 of TV

### Replace parts of a vector

TV                                      # See initial TV
TV[2:4] <-c("six", "seven", "eight")    # Replace
TV                                      # See the result

### Logical Vectors
NV                     # This is a numeric vector
NV <= 3                # This is a logical vector (TRUE or FALSE)
NV[NV <= 3]            # Crop the values minor or equal 3

### Use of ls() and rm()

ls()                    # See the actual objects list
rm(Tex)                 # Remove the object Tex
ls()                    # Check Tex disappeared

###  Factors  ---------------------------------------------

Vec <- c("Red","Blue","Red","Blue","Red")        # This is a character vector
str(Vec)                                         # Notice its structure
Fac <- as.factor (Vec)                           # Create factor
as.vector(Fac)                                   # Vector
str(Fac)                                         # Notice structure of a factor with levels and numbers
Fac[3]                                           # Position 3
levels(Fac)                                      # To see the levels. 
                                                 # Notice that levels are in alphabetical order
levels(Fac)[2]                                   # The second level of the factor

###  Reorder Factors

levels(Fac)[c(2,1)]                                # The levels ordered as wanted
FacR <- factor(Fac, levels = levels(Fac)[c(2,1)])  # Redo the factor
str(FacR)                                          # Factor ordered

### Other way to reorder factors

FacR2 <-factor(Vec,levels = c("Red","Blue"))       
str(FacR2)                                       # Same result

### Data frames ---------------------------------------

#### Creating different vectors or variables 

V1 <- c (1:5)
V2 <- seq(1,10,2)                                 # Sequence from 1 to 10 by 2
V3 <- c ("one", "two", "three", "four","five")    # Replicate the vector to length 5
V4 <- rep(c("odd","even"),length = 5)

#### Creating the data frame with four variables 

D15 <- data.frame(V1,V2,V3,V4)
D15

str(D15)              # two numeric vectors and two factors
dim(D15)              # same dimensions than matrices


#### Different ways of accessing one variable from the data frame 

D15$V1                # Fist variable
str(D15$V1)           # Vector
str(D15$V3)           # Factor
D15[3]                # Still a data frame but with only one variable
D15[[3]]              # Same factor than D15$V3
D15$V3

#### Accessing data into a data frame (several ways to do the same) 

D15$V3[4]                # Rows 4 of third variable (Still factor)
D15[[3]][4]              #Same than before
D15[4,3]                 #Same than matrices
as.character(D15$V3[4])  # Same, but as character

#### Variable names

names(D15)                                      # Show variable names
PrevNames <- names(D15)                         # Save variable names to use them latter
NewNames <-c("Num","OddNum","Text","OddEven")   # Save new names for the same variables

### Change variable names using paste

names(D15) <-paste(PrevNames, NewNames, sep = "_")  #Save variable names as PrevNames_Newnames
names(D15)[1] <- "V1_Num15"                         # Change only one variable name
names(D15)

#### Row names 

row.names(D15) <- D15$V3_Text          #Make the row names the same as the values in variable 3
D15

#### Subset a data frame

D15[D15$V4_OddEven == "odd", ]         # Subset of  all rows with Var4="odd"

### Subset of  all rows with Var4="odd" in variables 1 to 2.
D15[D15$V4_OddEven == "odd", 1:2]

#### Lists --------------------------------------------

#### Create a list with existing objects
ls()                              # List all objects already active in R

### Create list with some of the previous objects of this chapter

L1 <- list(D15, Fac, NV)          # A list with different objects

str(L1)                           # look into its structure

#### Create a list with names

L1 <- list (name.for.dataframe = D15, 
            name.for.factor = Fac,
            name.for.numeric = NV,
            name.for.character = CN)

names(L1)                         # See names


#### Change names into a list 

names(L1) <- c("D15","Fac","NV","CN")
L1
str (L1)

##### Point to objects into a list.

L1[[1]]                          # The first object
L1$D15                           # Same than previous, using the name

#### Point to data into objects into a list

L1[[1]]$V1_Num15                 # First variable of the data frame
L1$D15$V1_Num15                  # Same than previous using the name
L1[[1]][[1]]                     # Same than previous using only numbers.
                                 # This notation is very useful when using iterations.