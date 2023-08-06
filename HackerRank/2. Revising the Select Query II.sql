/*
	Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
	The CITY table is described as follows:
	
	
		Table: CITY
	Field			Type
	Id				Number
	Name			Varchar2(17)
	CountryCode 	Varchar2(3)
	District		Varchar2(20)
	Population		Number
	
*/

select name from city where CountryCode like "USA" and population >120000;


/*
OUTPUT:
	Scottsdale
	Corona
	Concord
	Cedar Rapids
*/