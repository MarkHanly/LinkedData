**************************************************************************
*	Purpose:	Plot the data
*	Author:		Mark Hanly	
*	Date:		20th Nov 2016
*	Input:		LinkedData/Data/pizza.dta
* 	Output:		LinkedData/Output/Figure1.pdf
**************************************************************************

* Open the dataset
use "${dir}/LinkedData/Data/pizza.dta",clear


* Plot the data
gr tw ///
	(scatter pizza lnincome if female==1, col(purple) ms(circle) ) ///
	(lfit pizza lnincome if female==1, col(purple) lw(thick)) ///
	(scatter pizza lnincome if female==0, col(lavender) ms(triangle)) ///
	(lfit pizza lnincome if female==0, col(lavender) lw(thick)) ///
	, legend(order(1 "Female" 3 "Male") ) ///
	xtitle(Log annual income ($)) ytitle("Annual pizza expenditure ($)") ///
	graphregion(color(white)) bgcolor(white)

	
* Save the pdf file
graph export "${dir}/LinkedData/Output/${datestr}_Figure1.pdf",replace
