**************************************************************************
*	Purpose:	Model the data
*	Author:		Mark Hanly	
*	Date:		20th Nov 2016
*	Input:		LinkedData/Data/pizza.dta
* 	Output:		LinkedData/Output/Models1-4.xls
**************************************************************************

* Open the dataset
use "${dir}/LinkedData/Data/pizza.dta",clear

* Baseline model
regress pizza i.female
est sto mod1

* Add in log of income
regress pizza i.female c.lnincome
est sto mod2

* Test interaction effect
regress pizza i.female##c.lnincome
est sto mod3

* Add in controls
regress pizza i.female##c.lnincome i.agegroup grad
est sto mod4

estout mod1 mod2 mod3 mod4 using "${dir}/LinkedData/Output/${datestr}_Models1-4.xls" ///
, style(tab) cells(b(star fmt(2)) se(par fmt(3))) replace
