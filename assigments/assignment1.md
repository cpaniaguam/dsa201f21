## DSA-201 Assignment 1

a.  Define the following vectors, which represent the weight and height of people on a particular team (in inches and pounds):

```r
height <- c(59,60,61,58,67,72,70)

weight <- c(150,140,180,220,160,140,130)
```

b.  Define a variable:

```r
a <- 150
```

### Step 1: Calculating means in R

1.  Compute the average height (called `mean` in R).
2.  Compute the average weight.
3.  Calculate the length of the vector "height" and "weight."
4.  Calculate the sum of the heights.
5.  Compute the average of both height and weight, by dividing the sum (of the height or the width, as appropriate), by the length of the vector. How does this compare to the "mean" function?
6.  Beyond comparing the value of two expressions visualy, we can have R check the values of two expressions are the same with the `==` operator. Verify part 5's comparison using this operator.
7.  The R function [`stopifnot`](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/stopifnot) can be used to test conditions in our programs. Put the condition in part 6 within the parenthesis after `stopifnot`, like this
```r
stopifnot(my_condition)
```
Report what happened.
8. Use `stopifnot` to check whether the means of `weight` and `height` are equal.

### Step 2: Using max/min functions

9.  Compute the max height, store the result in `maxH`.

10.  Compute the min weight, store the results in `minW`.

### Step 3: Vector math

11.  Create a new vector, which is the weight + 5 (every person gained 5 pounds).

12.  Compute the weight/height for each person, using the new weight just created.

### Step 4: Using conditional if statements

13. Write the R code to test if max height is greater than 60 (output "yes" or "no").

14. Write the R code to test if min weight is greater than the variable "a" (output "yes" or "no").

Hint: In R, one can do:

```r
if (100 < 150) "100 is less than 150" else "100 is greater than 150"
```
