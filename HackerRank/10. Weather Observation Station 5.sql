/*
	Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

	The STATION table is described as follows:
	
	Table: STATION
	Field			Type
	Id				Number
	City			Varchar2(21)
	State 			Varchar2(2)
	Lat_n			Number
	Long_w			Number
	
	
	
	where LAT_N is the northern latitude and LONG_W is the western longitude.

	Sample Input
	
	For example, CITY has four entries: DEF, ABC, PQRS and WXY.
	
	Sample Output
	
	ABC 3
	PQRS 4
	Explanation
	
	When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.
	
	Note
	You can write two separate queries to get the desired output. It need not be a single query.
*/

	select top 1 city, len(city) from station where len(city)=  (select max(len(city)) as tam from station) order by city;

	select top 1 city, len(city) from station where len(city)=  (select min(len(city)) as tam from station) order by city;


/*
OUTPUT:
	Marine On Saint Croix 21
	Amo 3
*/