###CLASS

### Using square brackets

iris [1]    #I get a list of the values of the second variable. 
iris[[1]]   #I get a list of the values of the second variable without the variables name.

iris[iris$Species =="setosa",2] #I get the list of the values of the second variable that have setosa as the species variable.  

mean(iris[iris$Species =="setosa",2])     #I get the mean

as.numeric(iris$Species)  #the factor species has 3 levels, which transalate into numbers 1, 2, 3
as.character(iris$Species)   #I get the levels as characters

### For loop  
#Should have used this for exercise 5, exam 2.

Sp<- Spe <- character()            #Tengo que hacer un vector vacio para que no me de error.
va <-character()                   #Hay que tomar en cuenta si es character o numeric.
Me <- Se <- numeric()

for(i in levels(iris$Species)){   #i es un valor cualquiera que se designa a la columna Species.
  for(j in names(iris)[-5]){      #j es un valor cualquiera que se designa a las demas variables, en este caso menos la quinta variable, que es Species.
    Sp<- c(Sp,paste("iris",i))
Spe <-c(Spe,i)
va <- c(va,j)
x <- iris[iris$Species ==i,j]  #I get the values of petal width for the species Virginica.
Me <- c(Me, mean(x))

}}                             #Es importante siempre cerrar corchetes.

d <-data.frame (Species = Sp, variables=va, mean=Me)

iris<-iris

