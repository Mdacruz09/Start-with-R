#### Some examples with operators ------------------------------------

x <- -1:12     # Create vector
x              # See vector
x + 1          # sum 1
x + 4
2 * x + 3      # same that (2*x)+3
2*x
x%%2           #-- is periodic
x%%5           #-- is periodic
x %/% 5
x/5


### Logical AND ("&&") has higher precedence than OR ("||"): 

TRUE || TRUE && FALSE      # is the same as
TRUE || (TRUE && FALSE)    # and different from
(TRUE || TRUE) && FALSE


### Special operators have higher precedence than "!" (logical NOT).
### You can use this for %in% :

1:10 %in% c(2,3,5,7)       #%in% : Indicates matches
!1:10 %in% c(2,3,5,7)      # same as !(1:10 %in% c(2, 3, 5, 7))
!(1:10 %in% c(2, 3, 5, 7))

#### Commands that return a number --------------------------------------

sum(x)            # sum of the elements of x
prod(x)           # product of the elements of x
max(x)            # maximum of the elements of x
min(x)            # minimum of the elements of x
which.max(x)      # index of the maximum of the elements of x
which.min(x)      # index of the minimum of the elements of x
which(x == 2)     # index of the first element that fits
length(x)         # number of elements in x
mean(x)           # mean of the elements in x
median(x)         # median of the elements in x
var(x)            # variance of the elements in x
sd(x)             # standard deviation of the elements in x

### Sometimes is useful to round the result, for example:

round(sd(x), 2)   # round(x, n) rounds the elements of x to n decimals

#### Commands to modify vectors -----------------------------------

log(x, 2)          # logarithm in base 2 ; log(x, base)
sqrt(x)            # Square root of x. (NaN: Not a Number)

###  match (x, y) returns a vector with the elements of x which are in y

match(x, 2)      

###  na.omit(x) # supresses the observations with missing data 

na.omit(log(x, 2))       # (NA: Not Available)


#### Standard error formula ------------------------------------

sd(x) / sqrt( length(x) )     # Standard error of x

#     or even

round( sd(x) / sqrt( length(x) ), 2)   # Two decimals rounded SE


