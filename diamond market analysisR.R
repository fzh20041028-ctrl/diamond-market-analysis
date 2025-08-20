# Diamond Market Analysis Project
# Author: Zihao Feng
# Course Project, UCSB

# Step 1: Import and sample data
diamond_sample <- read.csv("Diamonds_sample.csv")

# Step 2: Summary statistics
summary(diamond_sample)

# Step 3: Distribution of diamond prices
hist(diamond_sample$price,
     breaks = 30,
     col = "blue",
     border = "white",
     main = "Distribution of Diamond Prices",
     xlab = "Price (USD)",
     ylab = "Frequency")

# Boxplot of prices
boxplot(diamond_sample$price,
        horizontal = TRUE,
        col = "blue",
        main = "Boxplot of Diamond Prices",
        xlab = "Price (USD)")

# Step 4: Relationship between Price and Carat
plot(price ~ carat,
     data = diamond_sample,
     pch = 20,
     col = "blue",
     main = "Price vs Carat",
     xlab = "Carat",
     ylab = "Price (USD)")

# Relationship between Price and Depth
plot(price ~ depth,
     data = diamond_sample,
     pch = 20,
     col = "red",
     main = "Price vs Depth",
     xlab = "Depth",
     ylab = "Price (USD)")

# Correlations
cat("Correlation between Price and Carat:", cor(diamond_sample$price, diamond_sample$carat), "\n")
cat("Correlation between Price and Depth:", cor(diamond_sample$price, diamond_sample$depth), "\n")
cat("Correlation between Price and Table:", cor(diamond_sample$price, diamond_sample$table), "\n")

# Step 5: Grouping by Carat and Average Price
diamond_sample$carat_group <- cut(diamond_sample$carat,
                                  breaks = seq(0, 5, by = 0.5),
                                  labels = paste0(seq(0, 4.5, by = 0.5), "-", seq(0.5, 5, by = 0.5)))
avg_price <- aggregate(price ~ carat_group, data = diamond_sample, mean)

barplot(avg_price$price,
        names.arg = avg_price$carat_group,
        col = terrain.colors(nrow(avg_price)),
        main = "Average Price by Carat Group",
        xlab = "Carat Weight Range",
        ylab = "Average Price (USD)",
        las = 2)

# Step 6: Normality tests
shapiro.test(diamond_sample$depth)
qqnorm(diamond_sample$depth); qqline(diamond_sample$depth, col="red")

shapiro.test(diamond_sample$table)
qqnorm(diamond_sample$table); qqline(diamond_sample$table, col="red")

# Step 7: Distribution checks
hist(diamond_sample$price, prob=TRUE, breaks=30,
     main="Price Distribution with Exponential Curve")
curve(dexp(x, rate=1/mean(diamond_sample$price)), add=TRUE, col="red")

qqplot(qexp(ppoints(length(diamond_sample$price)), rate=1/mean(diamond_sample$price)),
       diamond_sample$price,
       main="Q-Q Plot: Price vs Exponential",
       xlab="Theoretical Quantiles",
       ylab="Sample Quantiles")
abline(0, 1, col="red")

# Carat distribution
hist(diamond_sample$carat,
     breaks=30,
     col="lightblue",
     main="Distribution of Carat",
     xlab="Carat")

