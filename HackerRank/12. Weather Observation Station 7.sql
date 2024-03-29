/*
	Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
	
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

	select city from station where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u' group by city;


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
	Baileyville
	Bainbridge
	Barrigada
	Baton Rouge
	Bayville
	Bellevue
	Bentonville
	Bertha
	Biggsville
	Bono
	Brownsdale
	Cahone
	Calpine
	Cape Girardeau
	Cascade
	Casco
	Caseville
	Chelsea
	Chilhowee
	Chokio
	Clarkdale
	Clio
	Corriganville
	Crane Lake
	Crouseville
	Cuba
	Curdsville
	Dale
	Daleville
	De Tour Village
	Delano
	Delta
	Dixie
	Dorrance
	Dundee
	Dupo
	East China
	East Irvine
	Eastlake
	Eleele
	Elm Grove
	Eriline
	Ermine
	Eskridge
	Eufaula
	Fort Meade
	Glencoe
	Gowrie
	Grand Terrace
	Grandville
	Grapevine
	Grayslake
	Greenville
	Gretna
	Grosse Pointe
	Gustine
	Hagatna
	Hayesville
	Hayneville
	Hesperia
	Hillside
	Honolulu
	Hope
	Hopkinsville
	Howard Lake
	Jerome
	Kanorado
	Kirksville
	Lakeville
	Lakota
	Leakesville
	Lee
	Lena
	Lismore
	Losantville
	Lottie
	Lydia
	Lynnville
	Madisonville
	Magnolia
	Marysville
	Mascotte
	Mid Florida
	Middleboro
	Milledgeville
	Millville
	Monona
	Monroe
	Montrose
	Morenci
	Mosca
	Netawaka
	Notasulga
	Oconee
	Ojai
	Osborne
	Oshtemo
	Ozona
	Palatka
	Pawnee
	Pelahatchie
	Pheba
	Pico Rivera
	Pleasant Grove
	Pomona
	Ravenna
	Raymondville
	Regina
	Renville
	Rio Oso
	Robertsdale
	Rosie
	Saint Elmo
	Samantha
	Shasta
	Skanee
	South El Monte
	Springerville
	Susanville
	Tarzana
	Tennessee
	Tina
	Upperco
	Urbana
	Verona
	Waipahu
	Waresboro
	Weldona
	West Grove
	Westphalia
	Wickliffe
	Wildie
	Woodsboro
	Yalaha
	Yellow Pine
	Yellville
	Yuma
	Zionsville
*/