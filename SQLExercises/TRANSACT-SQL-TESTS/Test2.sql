/*
"Computer Firm" database is used.
Let product table include 35 rows and PC table include 67 rows with 5 rows for model 1232 among these.
How many rows will be returned by the following statement?

Select p.Model, p.Maker from Product p Left Join PC on p.model = pc.model and p.Model = 1232

1. 39
2. 40
3. 67
4. 5
5. 35

Answer: 39
*/
select Count(*) from Product where model = 1232
select Model, Count(Code) from PC --where model = 1232 
group by Model

select * from Product
select p.Model, p.Maker from Product p left outer join PC on p.Model = pc.Model and p.Model = 1232


