/*
	Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
	
	Input Format
	
	The STATION table is described as follows:
	
	Table: STATION
	Field			Type
	Id				Number
	City			Varchar2(21)
	State 			Varchar2(2)
	Lat_n			Number
	Long_w			Number
	
	where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

	GO
	create view prueba as SELECT DISTINCT city FROM station WHERE city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%';
	GO
	SELECT DISTINCT city FROM prueba where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u';


/*
OUTPUT:
	Acme
	Aguanga
	Alba
	Aliso Viejo
	Alpine
	Amazonia
	Amo
	Andersonville
	Archie
	Arispe
	Arkadelphia
	Atlantic Mine
	East China
	East Irvine
	Eastlake
	Eleele
	Elm Grove
	Eriline
	Ermine
	Eskridge
	Eufaula
	Oconee
	Ojai
	Osborne
	Oshtemo
	Ozona
	Upperco
	Urbana
*/