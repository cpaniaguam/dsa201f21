---
title: "assignment3"
author: "Carlos Paniagua"
date: "10/1/2021"
df_print: paged
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Statistics, Functions, and Data Wrangling

In this assignment you will further practice Statistics, create functions, and perform data cleaning operations on a familiar dataset.

## Step 0

First load the data on your system by running the [code chunk](https://r4ds.had.co.nz/r-markdown.html#code-chunks) below.

```{r get movie budget data from the-numbers.com}
# Movie budgets -----------------------------------------------------------
# https://www.the-numbers.com/movie/budgets/all


required_packages = c('rvest','tidyverse','naniar')

# Check required packages are installed
packages_to_install = required_packages[!(required_packages %in% installed.packages())]

# Any missing packages will be installed
if (length(packages_to_install)>0){
    install.packages(packages_to_install)
}

# Load packages
library(rvest) # for data scraping
library(tidyverse) # for dataframe manipulation
library(httr) # for making an http request (testing)

# Get data with pagination
pages = 61 # As of 2021-10-01
baseurl='https://www.the-numbers.com/movie/budgets/all'


# # to understand the  construct below read about piping in R
table = baseurl %>% 
        read_html() %>% 
        html_nodes("table") %>% 
        html_table()

suffixes = as.character(seq(1,pages)*100+1)
tbls = c()
for (s in suffixes){
    url = paste0(paste0(baseurl,"/",s))
    df = url %>% read_html() %>% html_nodes("table") %>% html_table()
    tbls = c(tbls, df)
   }

df = table %>% as.data.frame() %>% select(c(2:dim(.)[2]))

for (t in tbls){
    df = bind_rows(df, select(as.data.frame(t),c(2:dim(t)[2])))
}

# Test the scrapping was successful
# 1. Check total number of rows is 6181 with 5 columns
# 2. When requesting https://www.the-numbers.com/movie/budgets/all/6102 one
# gets https://www.the-numbers.com/movie/budgets/all/6101, so no more movies

stopifnot(all(nrow(df)==6181,ncol(df)==5))
stopifnot(httr::GET(paste0(baseurl,as.numeric(s)+1))$url == url)

# View the dataframe
View(df)
```

This is the *Movie Budgets* table from [the-numbers.com](https://www.the-numbers.com/movie/budgets/all/).

## Step 1: Create a function to read the table from the-numbers.com into R

1.  Turn the code in the chunk above into a function `read_movies` that reads the movie budgets table from the-numbers.com. Your function should have the following parameters: `url` and `pages`, where `url` is the base url where the first page of table can be found, and `pages` is the number of pages the table has.

```{r your read_movies function}
# create your function here

```

2.  Write a test to check your function produces the correct dataframe by comparing its output with the dataframe `df` from Step 0.

```{r your read_movies test}
# Hint: use stopifnot 

```

## Step 2

3.  Visually inspect the dataframe and note the issues that need fixing. Do the columns have the correct data type? Are the dates usable? For example, can you sensibly sort the dataframe by date? Hint: Look up the package *lubridate* to manipulate data that look like dates or read [chapter 16 of *R for Data Science*](https://r4ds.had.co.nz/dates-and-times.html?q=lubridate#dates-and-times).

```{r your data cleaning tasks, echo=FALSE}
# Your code for part 3 goes here

```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

```{r}
colnames(df)
```

## Step 3: Exploratory Data Analysis

4.  What are the mean and standard deviation for production budget, domestic gross, and worldwide gross for all the movies?

5.  What movie has the highest production budget?

6.  What is the movie with the highest domestic gross?

7.  Name the movie with the highest worlwide gross?

8.  How many standard deviations are these statistics from their respective means?

9.  **Bonus Challenge**: Sort the dataframe by date from most recent to oldest.

10. Write a function that takes two parameters `v` a numeric vector and a number `t` that returns the proportion of elements in the vector that is less than the number `t`.

Example: If `v = seq(1,10)` the whole numbers from 1 to 10, and `t = 6`, the function should return `0.5` because 50% of the values in the vector are less than 6 (the numbers 1, 2, 3, 4, and 5).

10. Write an appropriate test for your function. Hint: If `t` is the [median](https://en.wikipedia.org/wiki/Median) of the vector, your function should return 0.5.

11. Construct histograms for each of the numerical variables in the dataframe. What can you say about their shape. Be sure to annotate them correctly with title and meaningful axis labels.

## Step 4: Write a function `vector_info` that reports standard sample statistics about a numerical vector

12. Your function must report the mean, median, minimum, maximum, standard deviation, quantiles at 0.05 and 0.95, and skewness. Hint: Look up the `moments` library.

13. Write tests for your `vector_info` function. Here is one: If `v <- c(5, 7, 2, 6, 4, 1, 0, 5, 5, 4, 6, 20)` your function should report the following values:

    mean: 5.417, median: 5, min: 0, max: 20, sd: 5.053, quantile (0.05 - 0.95): 0.55 -- 12.85, skewness: 2.071098

```{r summary statistics}
# your vector_info and test go here

```

14. Report summary statistics for the movie budgets dataframe for each of the numerical variables.
