#### Using RSQLite with sqldf ####

# Check packages are installed
    
    if (!'RSQLite' %in% installed.packages()){
        install.packages('RSQLite')
    }
    
    if (!'sqldf' %in% installed.packages()){
        install.packages('sqldf')
    }

# Load library    
    
    library(sqldf)
    
# Load a dataframe to treat as database
    
    data("airquality")           # load the airquality dataframe
    air = airquality             # alias to type less
    ?airquality                  # see what this dataframe is about
    View(air)                    # look at the table
    names(air)[2] = 'Solar_rad'
    
# Let us do some SQL data queries. 
# Main verbs are: SELECT, FROM, WHERE
    
# To do a SQL query using SQLite in R wrap the query in sqldf(' query ')
    

# 1. Select all rows and columns from air
        
sqldf("

      select * 
      from air
      
      ")

# Sometimes you find these commands in all caps, but this is optional as SQL is not
# case sensitive

sqldf("
      
       SELECT *
       FROM air
      
      ")
# 2. Select specific columns. Use limit to restrict the number of rows displayed

sqldf("

      select Temp, Month, Day
      from air
      limit 10;
      
      ")
# You can look at unique rows with DISTINCT

sqldf("

      select distinct Ozone, Temp
      from air;
    
      ")

# You can sort the table using ORDER BY (ascending by default [DESC for descending])

sqldf("

      select Ozone, Temp, Month, Day
      from air
      ORDER BY Temp DESC;
      
      ")
# 3. You can compute summary statistics like avg, stdev, max, min, count, sum

sqldf("

      select avg(Temp), stdev(Temp), max(Temp), min(Temp), count(Month)
      from air;
      
      ")
# 4. You can filter rows with WHERE

sqldf("

      SELECT * 
      from air 
      where Ozone > (SELECT avg(Ozone) from air)
      
      ")

# You can do compound clauses with AND, OR, and NOT

sqldf("

      SELECT * 
      from air 
      where Ozone > (SELECT avg(Ozone) + 2*stdev(Ozone) from air) OR
            Ozone < (SELECT avg(Ozone) - 2*stdev(Ozone) from air)
      
      ")


# 5. You can remove missing values with IS NOT NULL

sqldf("

      SELECT * 
      FROM air 
      WHERE (Solar_rad IS NOT NULL) AND
            Ozone is not null 
      
      ")

# 8. You can aggregate rows by groups using GROUP BY
sqldf("

      SELECT Month, avg(Temp), avg(Wind)
      FROM air 
      WHERE (Solar_rad IS NOT NULL) AND
            Ozone is not null
      GROUP BY Month
      
      ")



# 7. You can save SQL queries as R objects

df  = sqldf("

      SELECT Month, avg(Temp), avg(Wind)
      FROM air 
      WHERE Solar_rad IS NOT NULL AND
            Ozone is not null
      GROUP BY Month
      
      ")

