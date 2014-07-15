# delimit;
clear all; 
set mem 100m;
capture log close;

log using "\Desktop\solution1.log", text replace;
* =================================================
* Chisheng Li Solution 1
* =================================================

* Q1: Write down two important causal questions that one could potentially use this data to explore?

* Answer1: 
* What is the effect of school district spending on students' test scores?
* What is the effect of computer access on students' test scores?
* What is the effect of district size on students' test scores?
* Would greater family income increase school district spending?

* Q2: Write down two important non-causal questions that one could potentially use this data to explore?

* Answer2:
* Do poorer districts have fewer school resources (spending, computers)?
* What is the relationship between the student-teacher ratio and test scores?
* Do larger districts tend to be more urban? 
* How highly correlated are different types of school resources (spending, computers per student, student-teacher ratio) across districts?
* How does this relationship differ in urban vs. rural districts?

* Q3: Pick one of your causal questions from above. What is an ideal experiment that you could use to answer it?

* Answer3: 
* What is the effect of school district spending on students’ test scores?
* To answer this, the Federal government could randomly select some districts (the treatment group) to receive large grants that would enable them to increase spending.
* The spending in other districts (the control group) would be held fixed at its level prior to the experiment.
* Students’ test scores in each district would be assessed prior to randomization and also several times afterwards.
* The effect of district spending on test scores can be estimated by comparing the test score difference between the two groups sometime after the grants were made.
* If the randomization was good, there should be no difference in test scores (or any other variable) between the treatment and control groups before the experiment.
* This set-up would provide an estimate of the effect of district spending in general.
* To determine whether it is teacher salaries, classroom size, computers, infrastructure, etc that is behind the relationship, one would need to specify that the grants be used for that specific purpose, rather than spent however districts wanted to.

* ---------------------------;

* First, load the dataset;
use "\Desktop\assignment1.dta", clear;

* Q6a) How many total districts are in the dataset?
* To answer Q6a, describe the dataset. This will tell you how many observations
* are in the dataset. Each observation corresponds to a district;
describe;

* Q6b) How many districts span K-6th grade and how many span K-8th grade?
* To answer Q6b, we want to tabulate the variable gr_span;
tab gr_span, missing;

* Q6c) Construct a 95% confidence interval for the mean of district income. Show all work.

* Q6d) Test the null hypothesis that the mean of district income in the population of all districts is
* equal to $16,000, using an alpha level of .05. Specify null and alternative hypotheses, test
* statistic used, and interpret your result.

* To answer Q6c and Q6d, you should print summary statistics for the variable avginc ;
sum avginc;

* 6e) Test the null hypothesis that the mean of district income is the same in high and low
* computer use districts, where high is defined as having computers per student above the
* sample median. To do this, you will need to construct a measure of high/low computer use
* districts as was used in question 5. State your null hypothesis, your alternative hypothesis,
* your test statistic, and your conclusion.

* To answer Q6e you need to calculate summary statistics for avginc separately by
* computer use group. This computer use group is actually already constructed for you;
bysort comp_group: sum avginc;

* Stata also has a built-in function that performs this test automatically. Try this: ;
ttest avginc, by(comp_group);

log close;
