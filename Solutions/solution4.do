#delimit ;
clear all;
set mem 1g;
set more off;
capture log close;
log using "\Desktop\solution4.log", text replace;

* Load dataset;
use "\Desktop\wvs_micro.dta";
desc;

* =================================================;
* Chisheng Li Solution 4
* =================================================;
* =================================================;
* Part I - regressions with micro data
* =================================================;
reg envir tvhours, robust;
outreg2 using "\Desktop\solution4a.xls", adjr2 replace;
outreg2 using "\Desktop\solution4c.xls", adjr2 replace;

reg envir tvhours educ_hs educ_coll, robust;
outreg2 using "\Desktop\solution4a.xls", adjr2 append;

reg envir tvhours educ_hs educ_coll age, robust;
outreg2 using "\Desktop\solution4a.xls", adjr2 append;

reg envir tvhours educ_hs educ_coll age male, robust;
outreg2 using "\Desktop\solution4a.xls", adjr2 append;

reg envir tvhours educ_hs educ_coll age male townsize, robust;
outreg2 using "\Desktop\solution4a.xls", adjr2 append;

reg womenwork tvhours, robust;
outreg2 using "\Desktop\solution4b.xls", adjr2 replace;
outreg2 using "\Desktop\solution4c.xls", adjr2 append;

reg womenwork tvhours educ_hs educ_coll, robust;
outreg2 using "\Desktop\solution4b.xls", adjr2 append;

reg womenwork tvhours educ_hs educ_coll age, robust;
outreg2 using "\Desktop\solution4b.xls", adjr2 append;

reg womenwork tvhours educ_hs educ_coll age male, robust;
outreg2 using "\Desktop\solution4b.xls", adjr2 append;

reg womenwork tvhours educ_hs educ_coll age male townsize, robust;
outreg2 using "\Desktop\solution4b.xls", adjr2 append;

* =================================================;
* Part II - regressions with collapsed data
* =================================================;
collapse (count) count=country (mean) envir women, by(tvhours);

reg envir tvhours [aweight=count], robust;
outreg2 using "\Desktop\solution4c.xls", adjr2 append;

reg womenwork tvhours [aweight=count], robust;
outreg2 using "\Desktop\solution4c.xls", adjr2 append;

twoway scatter envir tvhours || lfit envir tvhours [aw = count] ||
scatter womenwork tvhours || lfit womenwork tvhours [aw = count] ||,
legend( lab(1 "mean(envir)") lab(2 "fit(envir)") lab(3 "mean(womenwork)") lab(4
"fit(womenwork)"));
*graph export graph4_1.wmf, replace;

log close;
