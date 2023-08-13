/*
	Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

	Input Format
	
	The STUDENTS table is described as follows:
	
	Table: STUDENTS
	Column			Type
	Id				Integer
	Name			String
	Marks 			Integer
	
	The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

	Sample Input
	Ashley
	Julia
	Belvet
	
	Explanation

	Only Ashley, Julia, and Belvet have Marks > . If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.
*/

	select name from students where marks > 75 order by right(name,3), id asc;


/*
OUTPUT:
	Stuart
	Kristeen
	Christene
	Amina
	Aamina
	Priya
	Heraldo
	Scarlet
	Julia
	Salma
	Britney
	Priyanka
	Samantha
	Vivek
	Belvet
	Devil
	Evil
*/