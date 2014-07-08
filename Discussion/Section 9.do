clear all
set mem 50m
set more off
capture log close
#delimit;

use "M:\Private\GSI W11\Section 9\teacher_ratings.dta", clear;
log using "M:\Private\GSI W11\Section 9\section9.log", replace;

*Part 1;
gen beauty_2=beauty*beauty;
reg course_eval beauty, r;
estimates store m1, title(Basic model);
reg course_eval beauty age, r;
estimates store m2, title(Basic model + age);
reg course_eval beauty beauty_2, r;
estimates store m3, title(Quadratic model);
reg course_eval beauty beauty_2 age, r;
estimates store m4, title(Quadratic model + age);

estimates table m1 m2 m3 m4, stats(N r2_a) star ;

*test of the significance of the relationship between beauty and course eval using m4;
estimates replay m4;
test beauty beauty_2;

*Categorical variable;
sum beauty, d;
gen beauty_category=1 if beauty<r(p25);
replace beauty_category=2 if beauty<r(p50) & beauty>=r(p25);
replace beauty_category=3 if beauty<r(p75) & beauty>=r(p50);
replace beauty_category=4 if beauty>=r(p75);

*Regression on beauty_category;
reg course_eval beauty_category, r;

* Category dummies;
gen low=(beauty_category==1);
gen medium_low=(beauty_category==2);
gen medium_high=(beauty_category==3);
gen high=(beauty_category==4);

* Saturated model;
reg course_eval medium_low medium_high high, r;

* Saturated model including female;
*Interaction variables;
gen mediumlow_female=medium_low*female;
gen mediumhigh_female=medium_high*female;
gen high_female=high*female;
*Regression;
reg course_eval medium_low medium_high high female mediumlow_female mediumhigh_female high_female, r;

