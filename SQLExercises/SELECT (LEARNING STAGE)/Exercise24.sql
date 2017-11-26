/*	author:@shivkrthakur  */
/*
Short database description "Computer firm":

The database scheme consists of four tables:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, screen, price)
Printer(code, model, color, type, price)

The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

Exercise: 24 (Serge I: 2003-02-03)
List the models of any type having the highest price of all products present in the database.
*/

select Model from (
select p.Model, Price from Product p inner join PC pc on p.Model = pc.Model where pc.Price = (Select Max(price) from PC)
union 
select p.Model, Price from Product p inner join Laptop l on p.Model = l.Model where l.Price = (Select Max(price) from Laptop)
union 
select p.Model, Price from Product p inner join Printer pr on p.Model = pr.Model where pr.Price = (Select Max(price) from Printer)
) t 
where t.Price = (select Max(x.Price) from (	select p.Model, Price from Product p inner join PC pc on p.Model = pc.Model where pc.Price = (Select Max(price) from PC)
											union 
											select p.Model, Price from Product p inner join Laptop l on p.Model = l.Model where l.Price = (Select Max(price) from Laptop)
											union 
											select p.Model, Price from Product p inner join Printer pr on p.Model = pr.Model where pr.Price = (Select Max(price) from Printer)
										  ) x)
