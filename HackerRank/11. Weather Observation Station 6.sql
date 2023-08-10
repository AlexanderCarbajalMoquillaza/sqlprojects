/*
	Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
	
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

	select city from station where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%';


/*
OUTPUT:
	Arlington
	Albany
	Upperco
	Aguanga
	Odin
	East China
	Algonac
	Onaway
	Irvington
	Arrowsmith
	Udall
	Oakfield
	Elkton
	East Irvine
	Amo
	Alanson
	Eleele
	Auburn
	Oconee
	Amazonia
	Aliso Viejo
	Andersonville
	Eros
	Arkadelphia
	Eriline
	Edgewater
	East Haddam
	Eastlake
	Addison
	Everton
	Eustis
	Arispe
	Union Star
	Ottertail
	Ermine
	Albion
	Athens
	Eufaula
	Osage City
	Andover
	Osborne
	Elm Grove
	Atlantic Mine
	Oshtemo
	Archie
	Olmitz
	Allerton
	Equality
	Alpine
	Ojai
	Orange Park
	Urbana
	Ukiah
	Alba
	Esmond
	Eureka Springs
	Eskridge
	Ozona
	Orange City
	Effingham
	Alton
	Agency
	Anthony
	Emmett
	Acme
	BlogScoringEnvironmentFAQAbout UsSupportCareersTerms Of ServicePrivacy Policy
*/