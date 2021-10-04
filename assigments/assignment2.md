DSA-201 Assignment 2: Dataframes
-------------------------------------------------------------------

### Step 0: Explore the [Pre-Pandemic `NHANES` dataset from the CDC's website](https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?cycle=2017-2020) 

1.  The CDC loves SAS which is a propietary statistical analysis software people in public health love to use. Luckily you don't have to buy SAS. There is a package that facillitates reading SAS files in R called `foreign`. Issue the following commands to install the `foreign` package and download the Pre-Pandemic Demographic NHANES dataset.

```r
# Get package to read xpt that the CDC people love to have 
if  (!('foreign' %in% installed.packages())) install.packages('foreign')
library(foreign)

# Download NHANES 2017-March 2020 Pre-Pandemic Demographics Data
# tempfile() creates a file in the temporary files folder.
# When R shuts off these files are deleted.

download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/P_DEMO.XPT",
              tf <- tempfile(), 
              mode="wb")

# Create Data Frame From Temporary File
NHANES_demo <- foreign::read.xport(tf)
```
2. Take a look at this dataset's documentation and codebook [here](https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/P_DEMO.htm). Read some about what this dataset is about. Take a look at some of its values by issuing `View(NHANES_demo)` or `head(NHANES_demo)` or `str(NHANES_demo)` in the console. Describe the advantages of each of these functions.
3. Report how many variables and observations there are in `NHANES_demo`. Provide a summary with the types (modes) of its variables.

### Step 1: Explore the age of the participants. You will have to read the codebook to identify the correct columnn from the dataset.

4.  What are the 3 highest recorded ages in the sample?
5.  What are their respective marital status?

### Step 2: Explore the weights of the participants

6.  What is the highest weight in the sample?
7.  Is this person married?
8.  Create a sorted dataframe based on weight.

### Step 3: Explore the weight variable a bit more

9.  Find the average weight in the sample.
10.  Find the mean and standard deviation for weight for cases with gender = 'male'
11.  Find the mean and standard deviation for weight for cases with gender = 'female'
12.  Summarize these findings in a nice table.
