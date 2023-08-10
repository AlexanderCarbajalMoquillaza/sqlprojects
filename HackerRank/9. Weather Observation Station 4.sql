/*
	Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

	The STATION table is described as follows:
	
	Table: STATION
	Field			Type
	Id				Number
	City			Varchar2(21)
	State 			Varchar2(2)
	Lat_n			Number
	Long_w			Number
*/

	select count(city) - count(distinct(city)) from station;


/*
OUTPUT:
	13
*/