* EXERCISE TO CALCULATE THE R2 OF A REGRESSION

clear all
set mem 50m
set more off
capture log close
#delimit;

use "\Desktop\earnings.dta", clear;
log using "\Desktop\r2exercise.log", replace; 

* EXERCISE 1;
*YOU CAN GET R2 BY USING THE regress COMMAND;
reg hrlyearn educ, r;

 *TO CALCULATE THE R2 "BY HAND", YOU NEED TO CREATE CONTAINING THE PREDICT ED OUTCOME AND THE RESIDUAL;
 predict y_hat;
 predict u_hat, residual;
 
 * see calculations on the Excel document;
