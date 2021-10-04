# This is Lab 2

To be completed 10/04/2021 in class. Refer to chapter 10 as needed.

## Submission info
Submit via GitHub classroom at https://classroom.github.com/a/iB6FbQWq either an .R or .Rmd file.

## Background and context (just read this and make sure you understand it)

- Researchers often want to understand some property of a population.
- In real life it is often impractical to observe or measure every member of the population.
- Either there are too many members to observe/measure, or it is too costly to do this. 
- The best that can be done is to observe/measure a *good* and manageable subset (called sample) to analyse, and attach (with some degree of certainty) the conclusions drawn from the sample to the population.
- The tricky part is that there is variability in the process of taking samples.
- Even when taking a subset of cases from a population, the sample may look like it came from a different population.
- A measure of uncertainty needs to be attached to the inferences made from samples.

## The Goal of the lab

In this lab you will explore making inferences about populations based on a sample. 

- The big idea is to compare the single sample statistic you have, like the sample mean, to a theoretical (or empirical -- later look up *boostraping*) distribution of the same statistic. This distribution is called *sampling distribution* of that statistic. For example, if you take a bunch of samples from a population and from each you compute the mean, that set of means is called a sampling distribution (of the mean). In reality you have one one sample and one single statistic to work with.
- Your one sample statistic can be either *typical* or *extreme* (very large or very small) with respect to the distribution of all the sample statistics that can be drawn from the population.
- If your sample statistic *looks* extreme, you might think it came from another population. But how large/small should it be to be tagged extreme?
- If your sample statistic looks typical, you might think it came from your original target population.
## Case study
Say that you have the annual income of 100 people that live in a specific county, either Oak County or Kao County. You know from a previous study that the annual income in Oak County is normally distributed with mean of $50,000 and standard deviation of $10,000. You also know that the annual income in Kao County is $45,000 with standard deviation of $15,000.

```r
set.seed(123)
oak_sample = rnorm(100,mean=50000,sd=10000)
kao_sample = rnorm(100,mean=45000,sd=15000)
ifelse(sample(c(T, F), 1), 
       sample_mean <- mean(oak_sample),
       sample_mean <- mean(maple_sample))
print(sample_mean)
```
After running this code chunk, the `sample_mean` variable contains the mean annual income of a sample from either Oak or Kao County, but you don't know which. What you do know is that sample mean has a value of 50904.06.

### Question: Is this sample from Oak County?

## Tasks
1. Provide line-by-line comments to annotate the code in the chunk above. For full credit you must show clear understanding of what the seven lines of code are doing.  You might have to consult the documentation or the internet.

```r
# Your annotated code for step one goes here
```

2. One way to answer the question would be to generate a (empirical) sampling distribution of means from both populations of annual incomes from Oak and Kao Counties and see where  `sample_mean` *ranks* in each using functions like `quantile` (see p. 104 in the textbook). But you already know the distribution of annual incomes in Oak and Kao Counties, so you could accomplish the same using one of the built-in functions `dnorm`, `qnorm`, or `pnorm` (read their documentation to determine which one you need here). Choose one of these approaches and proceed to the next step below.
3. Here is a standard way to classify an observation as extreme or typical. If the observation is in the middle 95% of all observations, we say the observation is typical (not extreme or rare), otherwise the observation is labeled extreme.
4. Use the reasoning in step 3 and your chosen method from step 3 to determine whether you have a good reason to believe that `sample_mean` is extreme in the distribution from Oak County. Via a print statement report whether `sample_mean` is extreme or not.

```r
# Your code goes here
```

6. Do you have evidence to believe that the sample came from Kao County? Do analogous computations as in steps 3 and 4.

```r
# Your code goes here
```
