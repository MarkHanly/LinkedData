use http://www.principlesofeconometrics.com/stata/pizza.dta,clear

global rootdir "C:/Users/user/Documents"


gen lnincome = ln(income)

gr tw ///
	(scatter pizza lnincome if female==1, col(purple) ms(circle) ) ///
	(lfit pizza lnincome if female==1, col(purple) lw(thick)) ///
	(scatter pizza lnincome if female==0, col(lavender) ms(triangle)) ///
	(lfit pizza lnincome if female==0, col(lavender) lw(thick)) ///
	, legend(order(1 "Female" 3 "Male") ) ///
	xtitle(Log annual income ($)) ytitle("Annual pizza expenditure ($)")

	
log using ${rootdir}/example_codebook.log,replace


di _skip(2)
di "*********************************"
di "Dataset Description"
di "*********************************"
di _skip(1)
desc


di _skip(2)
di "*********************************"
di "Codebook"
di "*********************************"
di _skip(1)
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
log close
