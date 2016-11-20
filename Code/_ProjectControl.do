**************************************************************************
*	Purpose:	Set up project macros and run the ordered project files
*	Author:		Mark Hanly	
*	Date:		20th Nov 2016
**************************************************************************

***************************
** Set up project macros **
***************************

* Root directory for project
* Change this location to the root folder where you have cloned the proect
global dir "H:/Teaching/Managing Big Data/2016"

* List of project subdirectories
global subdir Data Output Roughwork Documentation

* Save date in string format
global date: display %tdCYND date(c(current_date), "DMY")
global datestr = subinstr("$date"," ", "-",.)



****************************
** Install extra packages **
****************************
ssc install tabout
ssc install estout


**************************
** Run the project code **
**************************

	foreach prog in ///
	1.ReadData 2.CreateDocumentation 3.PlotFigure1 	4.TabulateData 5.RunModels {
			noi {
			di "Running `prog'.do"
			}
	run "${dir}/LinkedData/Code/`prog'.do"
	}



