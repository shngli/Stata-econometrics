clear all
set mem 50m
set more off
capture log close
#delimit;

global JTonline "http://www-personal.umich.edu/~thomasjl/pp639";
use $JTonline/bwght2.dta;

*Model 1;
reg fmaps bwght, r;
estimates store m1, title (basic model);

*Model 2;
reg fmaps bwght cigs, r;
estimates store m2, title (basic model + cigarettes);

*Model 3;
reg fmaps bwght cigs drink, r;
estimates store m3, title (basic model + cigarettes + drinks);

*Model 4;
reg fmaps bwght cigs feduc, r;
estimates store m4, title (basic model + cigarettes+ drinks + father's education);

*Summary table;
estimates table m1 m2 m3 m4, stats(N r2_a) t ;
