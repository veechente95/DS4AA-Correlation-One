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
select memid, surname, firstname, joindate 
from cd.members
where joindate >= '2012-09-01';

--Removing duplicates, and ordering results
--How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
select distinct surname from cd.members
order by surname asc
limit 10;

--Combining results from multiple queries
--You, for some reason, want a combined list of all surnames and all facility names.
select surname from cd.members
union
select name from cd.facilities;

--Simple aggregation
--You'd like to get the signup date of your last member. How can you retrieve this information?
select max(joindate) as latest
from cd.members;

--More Aggregation
--You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?
select firstname, surname, joindate
from cd.members
where joindate = 
	(select max(joindate)
		from cd.members);

--Retrieve the start times of members' bookings
--How can you produce a list of the start times for bookings by members named 'David Farrell'?
select bks.starttime
	from
		cd.bookings bks
		inner join cd.members mems
			on mems.memid = bks.memid
	where 
		mems.firstname='David'
		and mems.surname='Farrell';

--Work out the start times of bookings for tennis courts
--How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
--Return a list of start time and facility name pairings, ordered by the time.
select bks.starttime as start, facs.name as name
	from
		cd.facilities facs
		inner join cd.bookings bks
			on facs.facid = bks.facid
	where
		facs.name in ('Tennis Court 2', 'Tennis Court 1') and
		bks.starttime >= '2012-09-21' and
		bks.starttime < '2012-09-22'
order by bks.starttime;

--Produce a list of all members who have recommended another member
--How can you output a list of all members who have recommended another member? 
--Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
select distinct recs.firstname as firstname, recs.surname as surname
from cd.members mems
inner join cd.members recs
on recs.memid = mems.recommendedby
order by surname, firstname;

--Produce a list of all members, along with their recommender
--How can you output a list of all members, including the individual who recommended them (if any)? 
--Ensure that results are ordered by (surname, firstname).
select mems.firstname as memfname, mems.surname as memsname, recs.firstname as recfname, recs.surname as recsname
	from 
		cd.members mems
		left outer join cd.members recs
			on recs.memid = mems.recommendedby
order by memsname, memfname;
