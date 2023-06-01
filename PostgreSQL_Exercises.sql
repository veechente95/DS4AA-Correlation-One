--Practice Exercises
--https://pgexercises.com/questions/basic/where2.html


--Control which rows are retrieved
--How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
--Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

select facid, name, membercost, monthlymaintenance
from cd.facilities
where
	membercost > 0 and
	(membercost < monthlymaintenance/50.0);

--Basic string searches
--How can you produce a list of all facilities with the word 'Tennis' in their name?
select * from cd.facilities
where name like '%Tennis%';

--Matching against multiple possible values
--How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
select * from cd.facilities
where facid in (1, 5);

--Classify results into buckets
--How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost 
--is more than $100? Return the name and monthly maintenance of the facilities in question.
select name,
case when (monthlymaintenance > 100) then 'expensive'
	else 'cheap'
	end as cost
from cd .facilities;

--Working with dates
--How can you produce a list of members who joined after the start of September 2012? 
--Return the memid, surname, firstname, and joindate of the members in question.







