# This is Lab 2a

To be completed 10/06/2021 in class. Refer to chapter 10 as needed.

## Submission info
Submit via GitHub classroom at https://classroom.github.com/a/HMjJCCxy either an .R or .Rmd file.

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

- The big idea is to compare the single sample statistic you have, like the sample mean, to a theoretical (or empirical -- later look up *boostraping*) distribution of the same statistic. This distribution is called *sampling distribution* of that statistic. For example, if you take a bunch of samples from a population and from each you compute the mean, that set of means is called a sampling distribution (of the mean). In reality you have one sample and one single statistic to work with.
- Your one sample statistic can be either *typical* or *extreme* (very large or very small) with respect to the distribution of all the sample statistics that can be drawn from the population.
- If your sample statistic *looks* extreme, you might think it came from another population. But how large/small should it be to be tagged extreme?
- If your sample statistic looks typical, you might think it came from your original target population.

## Case study
The code below creates a samples 10000 observations from a normally distributed population with mean 50000 and standard deviation 10000. Run that on your system.

```r
set.seed(123)
oak_sample = rnorm(10000,mean=50000,sd=10000)
sample_mean <- mean(sample(oak_sample,100))
print(sample_mean)
```
This is a fairly large sample. It's natural to expect the sample mean to be quite close to the population mean, 50000. Verify this.

## Tasks
1. Take 10,000 samples (with replacement) and their corresponding means from `oak_sample`.
2. Choose a data structure to store all the means you got and save it in a variable called `oak_sampled_means`.
3. Report the following summary statistics from `oak_sampled_means`: mean, standard deviation, maximun, minimum. Create sensible and meaningful variable names to store this metadata.
4. What are the mean and standard deviation of `oak_sample`? Again report these values and store them in variables with sensible, meaningful names.
5. Visualize the distributions of `oak_sampled_means` and `oak_sample`. What can you say about these distributions? 

    Hints: Consider these questions:

    -   How do their centers compare?

    -   Are the distributions symmetric?

    -   Do their shapes differ? If so, how?

    -   Which of the two distributions has more spread? How do they compare?
```r
# Your code for steps 1-5 goes here
```

6. Compute how many standard deviations the maximun and minimum values in `oak_sampled_means` are from the mean.
7. Do the same for all values in `oak_sampled_means`. Call this new vector `s_sampled_means`.
8. Identify the values in `oak_sampled_means` and in `s_sampled_means` in the 0.5%, 2.5%, 5%, 50%, 95%, 97.5%, 99.5% percentiles.

```r
# Your code for parts 6-8 goes here
```

## Discussion
9. If someone presented you a sample of size 10000 whose mean is slightly greater than the mimimun mean you observed in `oak_sampled_means`; she claims the sample is from `oak_sample`. Would you be skeptical or confident of the claim?
10. Suppose another person presented you another sample of the same size as before but with mean one stadandard deviation greater than the mean in `oak_sampled_means`. She claims the sample came from `oak_sample`.

    -  What is the mean of this sample
    -  Would you believe her claim about the sample? Explain why or why not

11. A third person presents you a similar third sample. They also claim it came from `oak_sample`. You don't readily take their word for it, so you note the sample mean of this sample is 3 standard deviations above the mean of `oak_sampled_means`. How confident can you be about this person's claim?

```r
# Your code for partes 9-11 goes here.
```
