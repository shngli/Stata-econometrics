clear all
capture log close
set mem 50m
set more off
#delimit;

use "\Desktop\assignment2.dta", clear;
log using "\Desktop\section7.log", replace;

regress ed incomehi, r;
outreg2 using "\Desktop\table_section7.xls", replace adjr2;
regress ed income dadcoll, r;
outreg2 using "\Desktop\table_section7.xls", append adjr2;
regress ed income dadcoll momcoll, r;
outreg2 using "\Desktop\table_section7.xls", append adjr2;
regress ed income dadcoll momcoll female, r;
outreg2 using "\Desktop\table_section7.xls", append adjr2;
regress ed income dadcoll momcoll female dist, r;
outreg2 using "\Desktop\table_section7.xls", append adjr2;

test momcoll dadcoll;
