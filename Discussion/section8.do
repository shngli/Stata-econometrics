clear all
set mem 50m
set more off
capture log close
#delimit;

set obs 50;

gen id = _n;

gen x1 = rnormal(12);
sort x1;
replace x1 = . in 1/3;

gen x2 = runiform();
sort x2;
replace x2 = . in 1/3;

gen x3 = rbinomial(10, .2);
sort x3;
replace x3 = . in 1/3;

gen y = rchi2(3);
sort y;
replace y = . in 1/3;

sort id;
list;










