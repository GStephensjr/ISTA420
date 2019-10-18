# Name: tsqlfuns-hw07
## Author: Greg Stephens
### Date: July 27, 2019


##### 1. What is a window function?
it computes a scalar(single) result value based on a calculation against a subset of the rows from the underlying query.

##### 2. What does PARTITION do?
it restricts the window to the subset of rows that have matching values from the partitioning column

##### 3. What does ORDER BY do?
defines ordering
in a window aggregate function, it specifies a frame
in a ranking function it defines the rank of the returns (ordermonth)

##### 4. What does ROWS BETWEEN do?
filters a frame,
or a subset, of rows from the window partition between the two specified delimiters.

##### 5. What is a ranking window function? Why would you use it? Give an example.
ranking windows themselves between other windows (ordering)

##### 6. What is an offset window function? Why would you use it? Give an example.
returns an element from a row that is at a certain offset from the
current row or at the beginning or end of a window frame.

##### 7. What do LEAD and LAG DO
You use these functions to obtain an element from a row that is at a certain offset from the current row within the partition, based on the indicated ordering.
- The LAG function looks before the current row,
- the LEAD function looks ahead

##### 8. What do FIRST VALUE and LAST VALUE do?
You use the FIRST_VALUE and LAST_VALUE functions to return an element from the first and last rows in the window frame, respectively.


##### 9. What is an aggregate window function? Why would you use it? Give an example.
gathers rows in the defined window

##### 10. What is a pivot table and what does it do?
the pivot function converts the rows in an aggregate result into columns and vice versa
a pivot table is a table whose rows have been converted to columns
