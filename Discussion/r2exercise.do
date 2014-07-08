* EXERCISE TO CALCULATE THE R2 OF A REGRESSION

clear all
set mem 50m
set more off
capture log close
#delimit;

use "M:\Private\GSI W11\Section 5\earnings.dta", clear;
log using "M:\Private\GSI W11\Section 5\r2exercise.log", replace; 

* EXERCISE 1;
