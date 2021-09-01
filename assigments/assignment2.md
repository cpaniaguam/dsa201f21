DSA-201 Assignment 2: Dataframes – Doing Some Initial Data Analysis
-------------------------------------------------------------------

### Step 0: Explore the `mtcars` dataset (already included in R)

1.  Copy the `mtcars` dataset into a new variable (call it `myCars`), so that if you mess up, you can start again (by copying `mtcars` into `myCars` again).
2.  In the R console issue the `?mtcars` command to view this dataset’s [codebook](https://www.datafiles.samhsa.gov/get-help/codebooks/what-codebook). Read some about what this dataset is about. Take a look at some of its values by issuing `View(myCars)` or `head(myCars)` or `str(myCars)` in the console. Describe the advantages of each of these functions.

### Step 1: Explore hp (“horse power”)

3.  What is the highest hp?
4.  Which car has the highest hp?
5.  Create a sorted dataframe based on hp.

### Step 2: Explore mpg (mpg stands for “miles per gallon”)

5.  What is the highest mpg?
6.  Which car has the highest mpg?
7.  Create a sorted dataframe based on mpg.

### Step 3: Which car has the “best” combination of mpg and hp?

8.  Design a criterion to decide what the “best” combination is. What logic did you use?
9.  Which car is the “best” per your criterion?

### Step 4: Which car has “best” combination of mpg and hp, where mpg and hp must be given equal weight?

Hint: Consider [normalizing or standardizing](https://en.wikipedia.org/wiki/Feature_scaling#Rescaling_(min-max_normalization)) the variables.