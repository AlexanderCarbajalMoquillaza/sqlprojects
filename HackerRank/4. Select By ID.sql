/*
	Query all columns for a city in CITY with the ID 1661.

	The CITY table is described as follows:
	
	Table: CITY
	Field			Type
	Id				Number
	Name			Varchar2(17)
	CountryCode 	Varchar2(3)
	District		Varchar2(20)
	Population		Number
*/

	select * from city where id = 1661;


/*
OUTPUT:
	1661 Sayama JPN Saitama 162472
*/