
# 1. For the data InsectSpray, make a table for the number of insects for each spray 
#with the mean, median and standard error.

InsectSprays <- InsectSprays      #Open the data frame

#Make empty vectors for each new variable.

me <- med <- se <- In <- numeric()
sp <- character()

for(i in levels(InsectSprays$spray)){   #i is a random value given to the spray column.
  for(j in names(InsectSprays)[-2]){    #j is a random value given to the count column.
  
    sp <-c(sp,i)                   # vector that allows to go through the values related to the levels of spray.
   
    x <- InsectSprays[InsectSprays$spray ==i,j]   
    me <- c(me, mean(x))
    se <- c(se, sd(x) / sqrt(length(x)))
    med <- c(med, median(x))
    In <- c(In, sum(x))
    
  }}

d <- data.frame(Spray=sp, Insect_number=In, Media=me, Median=med, Standard_error=se)


#2. Print a plot to see the differences of counts between sprays. Include a caption 
#explaining the figure. Which type of plot is the one you choose and why?


plot(count~spray, data = InsectSprays,
     ylab="Insect Number", xlab="Spray", 
     main = "Effect of different sprays on the number of insects")

#Used barplot because I am comparing few variables in the same category.

knitr::kable()


#3.Test for differences between sprays using anova and a posthoc comparison and redo 
#the previous plot including the representation of all posthoc differences.


an <- aov(count ~ spray, data = InsectSprays)
summary.aov(an)

tuk <- TukeyHSD(an)

agri <- agricolae::HSD.test(an, "spray", group = TRUE, console = TRUE)

plot(count~spray, data = InsectSprays,
     ylim= c(0,30),
     ylab="Insect Number", xlab="Spray", 
     main = "Effect of different sprays on the number of insects") 
     text(x=(1:6),y=28 , c("a","a","b","b","b","a"))

#4. Test for differences between sprays using non-parametric Kruskal-Wallis rank sum test. 
# Again, redo the plot with these results.

     Krus <- agricolae::kruskal(InsectSprays$count, InsectSprays$spray)
 
     
     plot(count~spray, data = InsectSprays,
          ylim= c(0,30),
          ylab="Insect Number", xlab="Spray", 
          main = "Effect of different sprays on the number of insects") 
     text(x=(1:6),y=28 , c("a","a","c","b","bc","a"))
     

#5. Transform count data using sqrt(counts) and redo the anova, the Tukey posthoc comparison 
# and the plot.
     
     
     sqrt(InsectSprays$count)
     
     an2 <- aov(sqrt(count) ~ spray, data = InsectSprays)
     summary.aov(an2)
     
     tuk2 <- TukeyHSD(an2)
     
     agri2 <- agricolae::HSD.test(an2, "spray", group = TRUE, console = TRUE)
     
     plot(count~spray, data = InsectSprays,
          ylim= c(0,30),
          ylab="Insect Number", xlab="Spray", 
          main = "Effect of different sprays on the number of insects") 
     text(x=(1:6),y=28 , c("a","a","c","b","bc","a"))
     
#6. Test for normality of residuals for the two performed anova analyses of points 
# 4 and 6 using shapiro.test() and use plot the anova to see the qqplots and compare them.
     
     shap <- shapiro.test(an[["residuals"]])
     shap2 <- shapiro.test(an2[["residuals"]])
     
     qqnorm(an[["residuals"]], main = "QQ plot for Anova 1")
     qqline(an[["residuals"]])
     
     
     qqnorm(an2[["residuals"]], main = "QQ plot for Anova 2")
     qqline(an2[["residuals"]])
     
     
    
#7. Which of the previous analysis is the adequate in this case? Why? 
# Is there any difference in the results between the square root transformed ANOVA 
# and the Kruskal-Wallis analyses? Is there any difference in the results between 
# the direct ANOVA and the square root transformed ANOVA? Which ones?
     
     
     

     



