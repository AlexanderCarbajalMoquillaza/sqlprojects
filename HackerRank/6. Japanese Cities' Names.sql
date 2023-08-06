/*
	Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

	The CITY table is described as follows:
	
	Table: CITY
	Field			Type
	Id				Number
	Name			Varchar2(17)
	CountryCode 	Varchar2(3)
	District		Varchar2(20)
	Population		Number
*/

	select name from city where countrycode like "JPN";


/*
OUTPUT:
	Neyagawa
	Ageo
	Sayama
	Omuta
	Tokuyama
*/