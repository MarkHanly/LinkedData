**************************************************************************
*	Purpose:	Set up project subdirectories and read in data
*	Author:		Mark Hanly	
*	Date:		20th Nov 2016
*	Input:		Online pizza dataset from 
*				http://www.principlesofeconometrics.com/stata/pizza.dta
*	Output:		LinkedData/Data/pizza.dta
**************************************************************************


** Create project subdirectories, if neccessary 

foreach folder in $subdir {
capture confirm file "${dir}/LinkedData/`folder'/nul"
	if _rc !=0 {
	mkdir "${dir}/LinkedData/`folder'"
	}
else di "`folder' already exists"	
}



** Read in the raw data
use "http://www.principlesofeconometrics.com/stata/pizza.dta",clear


** Create new variables
gen lnincome = ln(income)
recode age (18/25=1) (26/35=2) (36/80=3), gen(agegroup)

** Label the new variables
label variable lnincome "Log of income"
label variable agegroup "Age group"

** Save the data
save "${dir}/LinkedData/Data/pizza.dta",replace
