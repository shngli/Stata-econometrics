clear all 
set mem 50m
capture log close
set more off
#delimit;

global pp639 "http://www-personal.umich.edu/~thomasjl/pp639";
use $pp639/unions.dta;

log using "M:/Private/GSI W11/section4.log", replace;

*Question 1 : Run the regression of unionization rate on firm size;
reg union empsize, r;
*ANSWER/ SLOPE A 1,000-employee increase in firm size is associated with a 0.14 percentage point increase in unionization rate./ INTERCEPT : Our model predicts on average firm with no employee would have 7% of its employees covered by unions, but this does not make any sense from a policy perspective;
twoway (scatter union empsize) (lfit union empsize);
* QUESTION 2;
* ANSWER : When testing the null that the population slope is equal to 0 against the alternative that it is not, we obtain a t-statistic of 7.27. Since t is higher that 1.96 in absolute value, we can reject our null at the 95% level of confidence and conclude that the relationship between unionization rate and firm size is statistically significant at the 95% level of confidence.  
* QUESTION 3;
sum union, d;
* ANSWER: The standard deviation of union is 0.379. Then a 1,000-employee increase in firn szie is associated with an increase in unionization rate of 0.36 of a standard deviation. Given the large increase we consider in firm size can be considered, it looks quite small from a policy perspective; 
* QUESTION 4;
reg union manager,r;
*ANSWER: On average, managers are 8 percentage points less likely to be covered by unions tham non-managers.
