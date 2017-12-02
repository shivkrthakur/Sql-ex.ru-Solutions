/*	author:@shivkrthakur  */
/*
Short database description "Recycling firm":

The firm owns several buy-back centers for collection of recyclable materials. Each of them receives funds to be paid to the recyclables suppliers. Data on funds received is recorded in the table 
Income_o(point, date, inc)
The primary key is (point, date), where point holds the identifier of the buy-back center, and date corresponds to the calendar date the funds were received. The date column doesn’t include the time part, thus, money (inc) arrives no more than once a day for each center. Information on payments to the recyclables suppliers is held in the table
Outcome_o(point, date, out)
In this table, the primary key (point, date) ensures each buy-back center reports about payments (out) no more than once a day, too. 
For the case income and expenditure may occur more than once a day, another database schema with tables having a primary key consisting of the single column code is used:
Income(code, point, date, inc)
Outcome(code, point, date, out)
Here, the date column doesn’t include the time part, either.

Exercise: 29 (Serge I: 2003-02-14)
Under the assumption that receipts of money (inc) and payouts (out) are registered not more than once a day for each collection point [i.e. the primary key consists of (point, date)], write a query displaying cash flow data (point, date, income, expense). 
Use Income_o and Outcome_o tables.
*/
/*
Solution(s) below:
*/

select x.point, x.date, inc.inc as income, out.out as expense
from(select i.point, i.date from income_o i
union select o.point, o.date from outcome_o o) x
left outer join income_o inc on inc.point = x.point and inc.date = x.date
left outer join outcome_o out on out.point = x.point and out.date = x.date
