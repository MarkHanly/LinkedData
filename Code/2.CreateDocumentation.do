**************************************************************************
*	Purpose:	Save data documentation
*	Author:		Mark Hanly	
*	Date:		20th Nov 2016
*	Input:		LinkedData/Data/pizza.dta
* 	Output:		LinkedData/PizzaCodebook.txt
**************************************************************************

use "${dir}/LinkedData/Data/pizza.dta",clear

log using "${dir}/LinkedData/Documentation/${datestr}_PizzaCodebook.log",replace
noi {

**********************************
**		Dataset Description		**
**********************************
desc




**************************
**		Codebook		**
**************************
codebook

ds	
local varlist = r(varlist)
foreach v in `varlist' {

di _skip(2)
di "*********************************"
di "Variable = `v'"
di "*********************************"
di _skip(2)

qui tab `v'
local x = r(r)
	if `x' <=10 {
		tab `v', mis
	}
	else if `x' >10 {
		summ `v'
	}
}
	
} /* Closes noisily */
log close
