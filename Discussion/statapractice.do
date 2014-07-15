clear all
set mem 50m
capture log close
set more off
#delimit;

use "\Desktop\unions.dta", clear;
log using "\Desktop\statapractice.log", replace;

*Question 1; 
summarize;
describe;
tab manager;
*Question 2;
tab union if manager==1;

sum hrwage, d;
gen high_wage=(hrwage>14.423);

ci union if(empsize>=700);
ttest union, by (high_wage) unequal level(99);
