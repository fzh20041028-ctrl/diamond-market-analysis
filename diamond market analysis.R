# Diamond Market Analysis Project
# Author: Zihao Feng
# Course Project, UCSB

# Step 1: Import and sample data
Diamonds <- read.csv("C:/Users/fzh20/Diamonds.csv")
set.seed(123)
random_rows <- sample(1:nrow(Diamonds), 500) 
diamond_sample <- Diamonds[random_rows, ]   

# Step 2: Summary statistics
summary(diamond_sample)

# Step 3: Distribution and boxplot
hist(diamond_sample$price, breaks=30, col="blue", border="white",
     main="Distribution of Diamond Prices", xlab="Price (USD)", ylab="Frequency")

boxplot(diamond_sample$price, horizontal=TRUE, col="blue",
        main="Boxplot of Diamond Prices", xlab="Price (USD)")

# Step 4: Price vs Carat and Depth
plot(price ~ carat, data=diamond_sample, pch=20, col="blue", main="Price vs Carat")
plot(price ~ depth, data=diamond_sample, pch=20, col="red", main="Price vs Depth")

cor(diamond_sample$price, diamond_sample$carat)
cor(diamond_sample$price, diamond_sample$depth)
cor(diamond_sample$price, diamond_sample$table)

# Step 5: Normality and distribution tests
shapiro.test(diamond_sample$depth)
qqnorm(diamond_sample$depth); qqline(diamond_sample$depth, col="red")

shapiro.test(diamond_sample$table)
qqnorm(diamond_sample$table); qqline(diamond_sample$table, col="red")

hist(diamond_sample$price, prob=TRUE, breaks=30)
curve(dexp(x, rate=1/mean(diamond_sample$price)), add=TRUE, col="red")

qqplot(qexp(ppoints(length(diamond_sample$price)), rate=1/mean(diamond_sample$price)),
       diamond_sample$price,
       main="Q-Q Plot: Price vs Exponential",
       xlab="Theoretical Quantiles", ylab="Sample Quantiles")
abline(0, 1, col="red")

# Extra: Carat distribution
hist(diamond_sample$carat, breaks=30, col="lightblue")

