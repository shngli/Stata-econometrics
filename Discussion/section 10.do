clear all
set mem 50m
set more off
capture log close
#delimit;

use "M:\Private\Section 10\teacher_ratings.dta", clear;
log using "M:\Private\Section 10\section 10.log", replace;

/*generate log_beauty=ln(beauty);
regress course_eval log_beauty, r;

generate log_courseval=ln(course_eval);
regress log_courseval beauty, r;
estimates store m2;
regress log_courseval log_beauty, r;
estimates table m1 m2;
*/ 

generate beauty_2=beauty*beauty;
generate log_age=ln(age);
generate log_courseeval=ln(course_eval);

regress course_eval beauty beauty_2 female;
estimates store m1;
regress course_eval beauty beauty_2 log_age female;
estimates store m2;
regress log_courseeval beauty  log_age female;
estimates store m3;

estimates table m1 m2 m3, star stats(N r2_a);
