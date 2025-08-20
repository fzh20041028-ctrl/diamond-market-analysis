verview

This project analyzes a sample of 500 diamonds to study the relationship between diamond price and its key characteristics (carat, depth, and table). The dataset is saved as Diamonds_sample.csv, and all analysis is done in R with the script Diamonds_analysis.R.

The goal of this project is to practice basic data analysis techniques and develop a clear understanding of how statistical methods and visualization can reveal insights from raw data.

Files

Diamonds_sample.csv → the dataset used for analysis

Diamonds_analysis.R → R script containing all analysis and plots

Methods

Data Sampling & Summary

Randomly selected 500 rows from the original dataset

Generated descriptive statistics with summary()

Exploratory Data Analysis (EDA)

Visualized price distribution with histograms and boxplots

Grouped carat weight into intervals and calculated average prices

Correlation Analysis

Calculated correlations between price and variables (carat, depth, table)

Visualized price vs carat and price vs depth with scatter plots

Distribution Checks

Tested normality of variables (depth, table) with Shapiro-Wilk test

Used Q-Q plots to visualize distributional assumptions

Key Findings

Price is strongly correlated with carat weight (correlation ≈ 0.9).

Depth and table show weak or almost no correlation with price.

Price distribution is right-skewed, with a few very expensive outliers.

Carat groups reveal that average price rises sharply as carat size increases.

Skills Demonstrated

Data cleaning and sampling in R

Visualization using histograms, boxplots, and scatter plots

Statistical analysis and correlation testing

Writing reproducible analysis and structured reporting
