# This is Lab 3

To be completed 10/18/2021 in class. Refer to chapter 11 as needed.

## Submission info

Submit via GitHub classroom at https://classroom.github.com/a/9-5J_1fT either an .R or .Rmd file.

## Background and context (just read this and make sure you understand it)

- We are going to read data from an API (a program that communicates with another) in JSON format

- Many government agencies with data repositories use services from Socrata. Some examples are the City of Chicago, and the State of Maryland.

- Socrata provides a package to read a JSON data set from their servers using an API: RSOCRATA reads and converts the data queried from Socrata to an R dataframe.

## The Goal of the lab

In this lab you will read JSON data into R, manipulate it using SQL queries, and perform some analysis.

## Step 1: Get the data

We are going to need the sqldf package to make SQL queries in R, and the RSocrata package to read JSON files as dataframes into R.

```r
# Install the RSocrata, sqldf packages if not available
if (!'RSocrata' %in% installed.packages()) install.packages("RSocrata")
if (!'sqldf' %in% installed.packages()) install.packages("sqldf")

# Load relevant packages
library(RSocrata)
library(sqldf)
```

Now let us load the data. We are going to work with two accident datasets from the State of Maryland:

- [Maryland Statewide Vehicle Crashes](https://opendata.maryland.gov/Public-Safety/Maryland-Statewide-Vehicle-Crashes/65du-s3qu) (716K rows, 56 columns). We will refer to this data set as crashes_df.

- [Maryland Statewide Vehicle Crashes - Person Details (Anonymized)](https://opendata.maryland.gov/Public-Safety/Maryland-Statewide-Vehicle-Crashes-Person-Details-/py4c-dicf)(1.6M rows, 48 columns). We will refer to this data set as person_df.

As you can see these data sets are relatively large to load into a normal computer. For the purposes of this lab, we are going to use the first 100,000 cases from Person Details and the `acc_date` and `report_no` columns from Vehicle Crashes.

Upon reading the Socrata Open Data API documentation on paging through data, we load the first 100,000 rows of the Person Details dataset with the following chunk. This will take about a minute to finish (~49 seconds on my computer).

```{r read data}

person_details_df = read.socrata('https://opendata.maryland.gov/resource/py4c-dicf.json?$limit=100000&$offset=0&$order=report_no') 

dates_df = read.socrata('https://opendata.maryland.gov/resource/65du-s3qu.json?$select=acc_date')

report_no_df = read.socrata('https://opendata.maryland.gov/resource/65du-s3qu.json?$select=report_no')

# Merge in a single crashes_df

crashes_df = data.frame(date     =dates_df$acc_date,
                        report_no=report_no_df$report_no)

# You might want to choose better, more meaningful names for the variables in these dataframes


# Test everything worked okay
stopifnot(all(ncol(person_details_df)==48,
              nrow(person_details_df==100000)))

stopifnot(all(nrow(crashes_df) == 715561,
              ncol(crashes_df) == 2))
```
## Tasks

1. We are going to be interested in the following variables:

`report_no, sex_code, date_of_birth, eject_desc, person_type, condition_desc, airbag_deployed,` and `inj_sever_desc`.

Use a SQL query to do this and bind this data to the name df.

```r

# Finish your query below

person_df <- sqldf("
      

      
      ")
 ```

2. We would like to match each person in df with the date of the incident. This data is available in crashes_df. Take a look at this dataframe and anticipate potential issues.

3. Before we can work with `crashes_df` we will need to convert the date data to actual date types. Use the lubridate package to do this.

```r

# Hint: see the cheat sheet for this package at https://github.com/rstudio/cheatsheets/blob/master/lubridate.pdf

crashes_df$Gdates =               # Your code goes here
crashes_df$day_of_week =          # and here


```

## Use SQL to understand the data

4. Use SQL to obtain a report of the proportion of accidents that happened on Sunday.

```r
# Finish the query below
sqldf("
      
     
      
      ")
``` 

5. Again, use SQL to obtain a report of the proportion of accidents that happened on Saturday

```r

# your code goes here

sqldf("
      
     
      
      ")
```

6. Based on your results from this sample, when are drivers in Maryland more likely to have a car crash?

7. How many events had injuries?

```r
# Your code goes here


```
8. Produce a report of injuries by day using SQL.

```r
# Your code goes here


```
