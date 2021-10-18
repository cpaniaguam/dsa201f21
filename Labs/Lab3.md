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

- Maryland Statewide Vehicle Crashes (716K rows, 56 columns). We will refer to this data set as crashes_df.

- Maryland Statewide Vehicle Crashes - Person Details (Anonymized) (1.6M rows, 48 columns). We will refer to this data set as person_df.

As you can see these data sets are relatively large to load into a normal computer. For the purposes of this lab, we are going to use the first 100,000 cases from Person Details and the acc_date and report_no from Vehicle Crashes.

Upon reading the Socrata Open Data API documentation on paging through data, we load the first 100,000 rows of the Person Details dataset with the following chunk. This will take about a minute to finish (~49 seconds on my computer).

{r read data}

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

Tasks

We are going to be interested in the following variables:

report_no, sex_code, date_of_birth, eject_desc, person_type, condition_desc, airbag_deployed, and inj_sever_desc.

Use a SQL query to do this and bind this data to the name df.

{r select columns}

person_df <- sqldf("
      
      SELECT report_no, sex_code, date_of_birth, eject_desc,                person_type, condition_desc, airbag_deployed,
             inj_sever_desc
      FROM person_details_df
      
      ")
#**** Your slq query goes here


We would like to match each person in df with the date of the incident. This data is available in crashes_df. Take a look at this dataframe and anticipate potential issues.

Before we can work with crashes_df we will need to convert the date data to actual date types. Use the lubridate package to do this.

{r get good dates}

# Hint: see the cheat sheet for this package at https://github.com/rstudio/cheatsheets/blob/master/lubridate.pdf

crashes_df$Gdates = ymd(crashes_df$date)
crashes_df$day_of_week = wday(crashes_df$Gdates)

sqldf("
      
      select day_of_week, 
      (count(day_of_week) / (select count(*) from crashes_df ) as proportion
      from crashes_df
      group by day_of_week 
      
      
      
      ")
# Your code goes here


Use SQL to understand the data

Use SQL to obtain a report of the proportion of accidents that happened on Sunday.

{r Sunday accidents}
# Finish the query below
sqldf("
      
     
      
      ")

Again, use SQL to obtain a report of the proportion of accidents that happened on Saturday

{r Saturday accidents}

# your code goes here

sqldf("
      
     
      
      ")


Based on your results from this sample, when are drivers in Maryland more likely to have a car crash?

How many events had injuries?

{r}
# Your code goes here



Produce a report of injuries by day using SQL.

{r}
# Your code goes here



