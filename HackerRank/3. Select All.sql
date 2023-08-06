/*
	Query all columns (attributes) for every row in the CITY table.

	The CITY table is described as follows:
	
	Table: CITY
	Field			Type
	Id				Number
	Name			Varchar2(17)
	CountryCode 	Varchar2(3)
	District		Varchar2(20)
	Population		Number
*/

select id,name,countrycode,district,population from city;


/*
OUTPUT:
	6 Rotterdam NLD Zuid-Holland 593321
	3878 Scottsdale USA Arizona 202705
	3965 Corona USA California 124966
	3973 Concord USA California 121780
	3977 Cedar Rapids USA Iowa 120758
	3982 Coral Springs USA Florida 117549
	4054 Fairfield USA California 92256
	4058 Boulder USA Colorado 91238
	4061 Fall River USA Massachusetts 90555
*/