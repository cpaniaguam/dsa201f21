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

### Step 2: Using max/min functions

6.  Compute the max height, store the result in `maxH`.

7.  Compute the min weight, store the results in `minW`.

### Step 3: Vector math

8.  Create a new vector, which is the weight + 5 (every person gained 5 pounds).

9.  Compute the weight/height for each person, using the new weight just created.

### Step 4: Using conditional if statements

10. Write the R code to test if max height is greater than 60 (output "yes" or "no").

11. Write the R code to test if min weight is greater than the variable "a" (output "yes" or "no").

Hint: In R, one can do:

```r
if (100 < 150) "100 is less than 150" else "100 is greater than 150"
```
