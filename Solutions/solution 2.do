clear all
# delimit;
capture log close;
set mem 100m;
set more off;

log using "C:\Users\chisli\Desktop\solution2.log", text replace;
* =================================================;
* Chisheng Li Solution 2
* =================================================;
* =================================================;
* Problem 1 - School Construction and Economic Development
* =================================================;
use "C:\Users\chisli\Desktop\assignment2.dta", clear;

* Q1ai) How does completed schooling vary by family income?;
* Answer: Family income and completed schooling are positively related. Children from
* families with high income have more years of completed schooling.;

tab incomehi, sum(ed);

* Q1aii) How does completed schooling vary by whether a student's mother graduated
* college? What about their father?;
* Answer: Completed schooling is also positively correlated with parental education.
* Children whose mother or father went to college complete more schooling themselves.;

tab momcoll, sum(ed);
tab dadcoll, sum(ed);

* Q1aiii) Describe the variation in distance to college. What is the mean, median, min,
* max, 25th percentile, 75th percentile?;
* Answer: The average child in the sample lives 17.2 miles from a college. The 25th and
* 75th percentiles (also called the interquartile range) are 4 miles and 25 miles,
* respectively. The minimum is 0 miles and the maximum is 160 miles.;

sum dist, detail;

* Q1aiv) The distance data are top-coded. What is the top code value? What is the largest
* fraction of the observations that could be top-coded?;
* Answer: The top code value is 160 miles. This means that any children living more than
* 160 miles from a college were assigned the value of 160. At most, 0.24% of the sample is top-coded.;

gen topcode = 1 if dist==16;
replace topcode = 0 if dist != 16;
tab topcode;

* Q1bi) Graph completed schooling against distance to nearest college using a
* scatterplot. Include the graph in your answers.;

* Q1bii) What do you see? Does there appear to be a relationship between distance to
* college and years of completed education?;
* Answer: From the scatterplot, it appears that years of schooling and distance to
* the nearest college are negatively correlated. That is, students living further
* from a college appear to have less schooling on average.;

twoway scatter ed dist,
xtitle("Distance to Nearest College (10 miles)")
ytitle("Years of Education");
*graph export assign2_1.wmf, replace;

* Q2a) Regress completed schooling on distance to the nearest college;

reg ed dist, robust;

* Q2b) Find and label the following on your Stata output and interpret these statistics.;

* Q2bi) beta_1;
* Answer: beta_1 = -0.07. A ten mile increase in distance from the nearest college is
* associated with a 0.07 year decrease in years of completed schooling.;

* Q2bii) Standard error of beta_1;
* Answer: SE(beta_1) = 0.013. This is the variation in our estimate of
* beta_1 due to sampling variability. If we drew a bunch of random samples and ran
* this regression on each of these samples, we would get a range of values for beta_1.
* This is our estimate of the standard deviation of these values of beta_1.;

* Q2biii) t-test for null hypotheses that beta_1 = 0;
* Answer: The t-statistic for the test of this null hypothesis is -5.46, 
* which is greater (in absolute value) than the critical value of 1.96. 
* Therefore we can reject the null hypotheses.;

* Q2biv) Confidence interval for beta_1;
* Answer: CI = [-0.010 to -0.047]. If we were to run this regression on a 
* hundred different random samples, 95% of the time the estimate would fall 
* in this range. We can be sure, with 95% certainty, that the true (population) 
* value for beta_1 falls in this range.; 

* Q2bv) beta_0;
* Answer: beta_0 = 13.96. This is the predicted years of schooling for someone who lives right
* next to a college (zero miles from one).;

* Q2bvi) Number of observations: N = 3796 ;

* Q2bvii) R^2 = 0.0074. This means that 0.7% of the variation in educational 
* attainment can be accounted for by variation in the distance to nearest college.;

* Q3a)Regress completed schooling on the variable indicating whether the child comes from a
* high income family.;

reg ed incomehi, robust;

* Q3b) Find and label the following on your Stata output and interpret these statistics.;

* Q3bi) beta_1;
* Answer: beta_1 = 0.87. Children from high income families have 0.87 more years of
* completed schooling than children from low income families.;

* Q3bii) Standard error of beta_1;
* Answer: SE(beta_1) = 0.065. This is the variation in our estimate of
* beta_1 due to sampling variability. If we drew a bunch of random samples and ran
* this regression on each of these samples, we would get a range of values for beta_1.
* This is our estimate of the standard deviation of these values of beta_1.;

* Q3biii) t-test for null hypotheses that beta_1 = 0;
* Answer: The t-statistic for the test of this null hypothesis is 13.41, 
* which is greater (in absolute value) than the critical value of 1.96. 
* Therefore we can reject the null hypotheses that children from low and
* high income families have the same years of completed schooling.;

* Q3biv) Confidence interval for beta_1;
* Answer: CI = [0.742 to 0.997]. If we were to run this regression on a hundred 
* different random samples, 95% of the time the estimate would fall in this 
* range. We can be sure, with 95% certainty, that the true (population) value 
* for beta_1 falls in this range. ;

* Q3bv) beta_0;
* Answer: beta_0 = 13.58. This is the average years of schooling for children from low
* income families.;

* Q3bvi) Number of observations: N = 3796 ;

* Q3bvii) R^2 = 0.047. This means that 4.7% of the variation in educational attainment
* can be accounted for by variation in family income category.;

* Q4) Which factor � distance to college or family income � explains more of the variation in
* educational attainment in this data?;
* Answer: Family income explains more of the variation in educational attainment in this data. 
* You can see this by comparing the R-squared from the two regressions.;
log close;
