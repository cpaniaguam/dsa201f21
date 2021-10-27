# This is Lab 4

To be completed 10/27/2021 in class. Refer to chapter 12 as needed.

## Submission info

Submit via GitHub classroom at https://classroom.github.com/a/oYVwTLA2 either an R or R markdown file.

## Background and context

> "The simple graph has brought more information to the data analyst's mind than any other device." --- John Tukey

> "The greatest value of a picture is when it forces us to notice what we never expected to see." --- John Tukey

> "Data graphics provide one of the most accessible, compelling, and expressive modes to investigate and depict patterns in data." --- From the book [MDSR](https://mdsr-book.github.io/mdsr2e/ch-vizI.html).

## Goal of the lab

Construct some basic visualizations from a real data set using the ggplot2 package. Your work must be fully reproducible (get and and load the data, and produce the required visualiztions).

### Task 1

1.  Go to fueleconomy.gov and read about why this website exists.
2.  Read about how the data provided is generated.

Hint: You might want to look at the [FAQ](https://www.fueleconomy.gov/feg/info.shtml#what-is-fegov) page.

3.  Load the [vehicle data set](https://www.fueleconomy.gov/feg/epadata/vehicles.csv) into R by creating a dataframe called `vehicles`.

### Task 2
For each of the tasks below you must produce fully annotated visualizations.

4.  Look at the variable descriptions and identify the most useful one for MPG. Generate a histogram of this variable.
5.  Now generate a violin plot (see the ggplot2 [cheat sheet](https://github.com/rstudio/cheatsheets/raw/master/data-visualization.pdf)) for this MPG variable. Compare and contrast the histogram and the violin plot.
6.  Identify the variable that contains data about the number of cylinders of each vehicle. Produce a pareto chart of this data and identify the three most common.
7.  Construct a boxplot of MPG by number of cylinders. Use the top 3 categories you identified in part 6.
8.  Identify the variable that contains data about the transmission type of each vehicle. Construct an overlaid density plot (`geom_density`)for MPG by transmission type.
9.  Repeat part 8 using side-by-side boxplots.


