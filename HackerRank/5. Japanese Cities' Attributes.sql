/*
	Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

	The CITY table is described as follows:
	
	Table: CITY
	Field			Type
	Id				Number
	Name			Varchar2(17)
	CountryCode 	Varchar2(3)
	District		Varchar2(20)
	Population		Number
*/

	select * from city where countrycode like "JPN";


/*
OUTPUT:
	1613 Neyagawa JPN Osaka 257315
	1630 Ageo JPN Saitama 209442
	1661 Sayama JPN Saitama 162472
	1681 Omuta JPN Fukuoka 142889
	1739 Tokuyama JPN Yamaguchi 107078
*/