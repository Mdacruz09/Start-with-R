# 1. Plot a cheat-sheet with values of color and point type (col = , and pch = ) from 1 to 25, and export it as a jpeg of 15 cm wide, 6 cm high and resolution 100 points per cm.


plot(0, 0, xlim = c(0, 25), ylim = c(0.5, 1.5)                  #Ploting of the cheat-sheet
     , ylab = "", xlab = "", yaxt = "n")
axis(2, 1, labels = c("col/pch"))

for (i in 1:25) {
  points(i, 1, pch = i, col = i, cex = 3)
}


jpeg(filename = "Plot.jpeg",                                    #Exporting the plot as jpeg
     width = 15, height = 6, units = "cm", pointsize = 12,
     quality = 75,
     bg = "white", res = 100, family = "", restoreConsole = TRUE,
     type = c("windows", "cairo"),
     symbolfamily="default")
     
plot(0, 0, xlim = c(0, 25), ylim = c(0.5, 1.5)
     , ylab = "", xlab = "", yaxt = "n")
axis(2, 1, labels = c("col/pch"))

for (i in 1:25) {
  points(i, 1, pch = i, col = i, cex = 3)
}

dev.off()

# 2. Plot into a graph ten Poisson distributions with lambda ranging from 1 to 10. Put legend and title. Export it as a .tiff file with size of 15x15 cm.

x   <- seq(0, 10)                            # Sequence
y   <- dpois(x, lambda = 1 , log = FALSE)    # densities for x
plot(x, y, type = "n", ylim = c(0.1, 0.4))   # Empty plot (type = "n")

### Plot lines over first plot
for (i in 1:10) {                            # Ten lines with SIZES from 1 to 10
  y <- dpois(x, lambda = i, log = FALSE)     # densities for x
  lines(x, y, col = i)                       # Plot the line
}

legend("topright", legend = paste("lamb =", 1:10),lty = 1, col = 1:10, cex = 0.5)
title(main = "Poisson distributions, lambda = 1:10")


tiff(filename = "PoissonDistrib.tiff", width = 15, height = 15, units = "cm", bg = "transparent", res = 100)   #Exporting the plot to tiff.

x   <- seq(0, 10)                           
y   <- dpois(x, lambda = 1 , log = FALSE)    
plot(x, y, type = "n", ylim = c(0.1, 0.4))                       

### Plot lines over first plot
for (i in 1:10) {                            
  y <- dpois(x, lambda = i, log = FALSE)     
  lines(x, y, col = i)                       
}

legend("topright", legend = paste("lamb =", 1:10),lty = 1, col = 1:10, cex = 0.5)
title(main = "Poisson distributions, lambda = 1:10")

dev.off()


# 3. Import data from this article: https://peerj.com/articles/328/

#### Import csv from web 


Webcsv <- "https://dfzljdn9uc3pi.cloudfront.net/2014/328/1/Appendix1.csv"
Data <- read.table(Webcsv, header = T, sep = ",", skip=2)
str(Data) 


###With these data, using for(), plot graphs to represent the effect of all the numerical variables, from "richness" to "mean_quality" on "yield". Choose the type of graph that you think better represents this effect for the different species. Create only one pdf with all the graphs inside.

CropNames <- as.factor(Data$crop)                           #Ploting the graphs.
a <- "Mean yield with respect to"
for(i in names(Data)[6:12]){
  plot(Data$mean_yield ~ Data[[i]], ylab = "Mean yield", xlab= i, col = CropNames)
  legend("topright", legend = levels(as.factor(Data$crop)), pch = T, col = (1:4))
  
  b <- c(a,i)
  title(b)
  
}


pdf(file = "Plots.pdf")                                    # Exporting the plots in a PDF document.


CropNames <- as.factor(Data$crop)
a <- "Mean yield with respect to"
for(i in names(Data)[6:12]){
  plot(Data$mean_yield ~ Data[[i]], ylab = "Mean yield", xlab= i, col = CropNames)
  legend("topright", legend = levels(as.factor(Data$crop)), pch = T, col = (1:4))
  
  b <- c(a,i)
  title(b)
  
}

dev.off()
