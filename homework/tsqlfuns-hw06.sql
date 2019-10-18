--Name: tsqlfuns-hw06
--Author: Greg Stephens
--Date: 24 July 2019

--1. What does a set operator do?
They compare complete rows between the results of two queries

--2. What are the general requirements of a set operator

--3. What is a Venn Diagram? This is not in the book.
Its a diagram representing mathematical or logical sets pictorially as circles or closed curves within
an enclosing rectangle, common elements of the sets being overlapped

--4. Draw a Venn Diagram of the UNION operator. What does it do?
It would be two circles and the overlapping parts would represent what is common or shared results and
the non-overlapping parts would show that everything from the original is not or doesn not have to be included

--5. Draw a Venn Diagram of the UNION ALL operator. What does it do?
The two circles would not be overlapping at all as the UNION ALL operator does not even attempt to remove
duplicates from the result

--6. Draw a Venn Diagram of the INTERSECT operator. What does it do?
This only returns rows that are common to the result which would be displayed by the overlapping areas and again
the not overlapped areas would be what is not common to the result of the queries

--7. If SQL Server supported the INTERSECT ALL operator, what would it do?
It would return the number of duplicate rows matching the lower of the counts in both input multi-sets

--8. Draw a Venn Diagram of the EXCEPT operator. What does it do?
This implements set differences. It operates on the results of two input queries and returns rows that appear in
the first input but not the second. The venn diagram would look like almost an eclipse that hasn not quite covered the sun

--9. If SQL Server supported the EXCEPT ALL operator, what would it do?
It returns only occurences of a row from the first multiset that do not have corresponding occurence in the second

--10. What is the precedence of the set operators?
INTERSECT, and then UNION and EXCEPT in order of appearance.
