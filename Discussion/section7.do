clear all
capture log close
set mem 50m
set more off
#delimit;

use "M:\Private\GSI W11\Section 7\assignment2.dta", clear;
log using "M:\Private\GSI W11\Section 7\section7.log", replace;

regress ed incomehi, r;
outreg2 using "M:\Private\GSI W11\Section 7\table_section7.xls", replace adjr2;
regress ed income dadcoll, r;
outreg2 using "M:\Private\GSI W11\Section 7\table_section7.xls", append adjr2;
regress ed income dadcoll momcoll, r;
outreg2 using "M:\Private\GSI W11\Section 7\table_section7.xls", append adjr2;
regress ed income dadcoll momcoll female, r;
outreg2 using "M:\Private\GSI W11\Section 7\table_section7.xls", append adjr2;
regress ed income dadcoll momcoll female dist, r;
outreg2 using "M:\Private\GSI W11\Section 7\table_section7.xls", append adjr2;

test momcoll dadcoll;
