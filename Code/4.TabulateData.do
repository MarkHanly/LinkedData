**************************************************************************
*	Purpose:	Tabulate the data
*	Author:		Mark Hanly	
*	Date:		20th Nov 2016
*	Input:		LinkedData/Data/pizza.dta
* 	Output:		LinkedData/Output/Table1.csv
**************************************************************************

* Open the dataset
use "${dir}/LinkedData/Data/pizza.dta",clear

* Tabulate data by sex
tabout hs college grad agegroup ///
female using "${dir}/LinkedData/Output/${datestr}_Table1.csv" ///
,replace cells(freq col) style(csv)
