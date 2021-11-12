## DSA-201 Assignment 5: Linear Modeling

In [Assignment 2](https://github.com/cpaniaguam/dsa201f21/blob/main/assigments/assignment2.md) you worked with some of the [demographics variables](https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/P_DEMO.htm) from the [Pre-Pandemic `NHANES` dataset from the CDC's website](https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?cycle=2017-2020)

This time you will incorporate variables from the [measures table](https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/P_BMX.htm) to build some linear models.

## Tasks

#### 0. Get the data!

1.  Get access to the relevant tables (P_DEMO and P_BMX) and load them into R.

2.  Build a dataframe with the following variables:

    -   From P_DEMO: gender, age (years)
    -   From P_BMX: weight, height, bmi, waist, and hip
    -   Hint: use a SQL query with *left join*

3.  Remove all rows with missing values.

    -   Hint: Issue the following command in the console: `?complete.cases`

4.  Describe the data: number of variables (how many numerical/categorical, data types, summary statistics), outliers. What are the measurement units for each of the variables. Are you familiar with these units? Consider making appropriate (to you!) conversions.

#### The goal

We are going to be interested in understanding how `weight` is related to the other variables in the dataframe.

5.  Explore the relationship of `weight` (this is your response or *dependent* variable) to the other variables by creating bivariate (two-variable) plots.

    -   Which of the predictors seems most informative for predicting weight?

#### Use `lm` to build regression models of increasing complexity

6.  Build an initial model using your chosen predictor from part 5.

    -   Provide an interpretation for the slope coefficient.
    -   In a future course (DSA202) we will address the following question: Is a linear model appropriate to model these variables. For the moment, assess how strong the relationship is between your chosen predictor and `weight`. Is the slope coefficient statistically significant?

7.  Fit a linear model to predict `weight` using all predictors (height, bmi, waist, hip, age, gender)

    -   Write the prediction equation.
    -   Provide an interpretation for each of the coefficients.

#### Backward elimination strategy to find the 'best' model

8.  Is the model in part 7 the *best* model? Typically we want the simplest model that does the best job at predicting the response.

    -   For each of the predictor variables in part 7, eliminate that variable and fit a new model; record the adjusted R-squared.

    -   Compare each of these simpler models' adjusted R-squared to the R-squared for the full model. Are there any improvements?

    -   Continue with this process until no more improvement is obtained. What is the 'best' model you got? Write the equation for the model? Are all estimated coefficients statistically significant?
