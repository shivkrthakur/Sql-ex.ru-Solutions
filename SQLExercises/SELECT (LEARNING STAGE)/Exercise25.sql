/*	author:@shivkrthakur  */
/*
Short database description "Computer firm":

The database scheme consists of four tables:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, screen, price)
Printer(code, model, color, type, price)

The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

Exercise: 25 (Serge I: 2003-02-14)
Find the printer makers also producing PCs with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity. 
Result set: maker.
*/
/*
Solution Explanation:

Caveat: The condition "where p.Type = 'Printer'" is important as there might be printer model records in Product table that are not in Printer table.
Because of this following query fails:

select distinct t1.maker from ( select distinct p.maker from Product p (nolock) inner join Printer pr (nolock) on p.model = pr.model) t1 
inner join ( select distinct p.maker from Product p (nolock) inner join PC pc (nolock) on p.model = pc.model
			 where pc.ram = (select min(ram) from PC) and pc.speed = (select max(speed) from PC where ram = (select min(ram) from PC))) t2
on t1.maker = t2.maker

while the two given in the solution below with "where p.Type = 'Printer'" pass.

Solution(s) below:
*/
select distinct t1.maker from Product p1 (nolock) 
inner join ( select distinct p.maker from Product p (nolock) inner join PC pc (nolock) on p.model = pc.model
			 where pc.ram = (select min(ram) from PC) and pc.speed = (select max(speed) from PC where ram = (select min(ram) from PC))) t2
on p1.maker = t2.maker
where p1.Type = 'Printer'

-- OR --

select distinct Maker 
from Product p 
where p.Type = 'Printer' 
and maker in (	select maker from Product p1 (nolock) 
				inner join PC p2 (nolock) on p1.model = p2.model 
				and speed = (select max(speed) from PC where ram = (select min(ram) from pc))
				and p2.ram = (select min(ram) from pc)
			 );

--- OR ---

select distinct t1.maker from ( select distinct p.maker from Product p (nolock) left outer join Printer pr (nolock) on p.model = pr.model where p.type = 'Printer') t1 
inner join ( select distinct p.maker from Product p (nolock) inner join PC pc (nolock) on p.model = pc.model
			 where pc.ram = (select min(ram) from PC) and pc.speed = (select max(speed) from PC where ram = (select min(ram) from PC))) t2
on t1.maker = t2.maker
