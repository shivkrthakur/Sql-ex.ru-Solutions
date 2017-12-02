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

Exercise: 30 (Serge I: 2003-02-14)
Under the assumption that receipts of money (inc) and payouts (out) can be registered any number of times a day for each collection point [i.e. the code column is the primary key], display a table with one corresponding row for each operating date of each collection point.
Result set: point, date, total payout per day (out), total money intake per day (inc). 
Missing values are considered to be NULL.
*/
/*
Solution(s) below:
*/

SELECT DISTINCT X.POINT, X.DATE, Z.OUT AS OUT, Y.INC AS INCOME
FROM ( SELECT I.CODE, I.POINT, I.DATE FROM INCOME I
UNION  SELECT O.CODE, O.POINT, O.DATE FROM OUTCOME O) X
LEFT OUTER JOIN (SELECT POINT, DATE, INC = SUM(INC) FROM INCOME INC GROUP BY POINT, DATE) Y ON X.POINT = Y.POINT AND X.DATE = Y.DATE
LEFT OUTER JOIN (SELECT POINT, DATE, OUT = SUM(OUT) FROM OUTCOME OUT GROUP BY POINT, DATE) Z ON X.POINT = Z.POINT AND X.DATE = Z.DATE
