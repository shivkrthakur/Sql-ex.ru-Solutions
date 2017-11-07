Create Table Product (Maker varchar(10), Model varchar(50), Type varchar(50))
insert into Product (maker, model, type) values ('A','1232','PC')
insert into Product (maker, model, type) values ('A','1233','PC')
insert into Product (maker, model, type) values ('A','1276','Printer')
insert into Product (maker, model, type) values ('A','1298','Laptop')
insert into Product (maker, model, type) values ('A','1401','Printer')
insert into Product (maker, model, type) values ('A','1408','Printer')
insert into Product (maker, model, type) values ('A','1752','Laptop')
insert into Product (maker, model, type) values ('B','1121','PC')
insert into Product (maker, model, type) values ('B','1750','Laptop')
insert into Product (maker, model, type) values ('C','1321','Laptop')
insert into Product (maker, model, type) values ('D','1288','Printer')
insert into Product (maker, model, type) values ('D','1433','Printer')
insert into Product (maker, model, type) values ('E','1260','PC')
insert into Product (maker, model, type) values ('E','1434','Printer')
insert into Product (maker, model, type) values ('E','2112','PC')
insert into Product (maker, model, type) values ('E','2113','PC')
insert into Product (maker, model, type) values ('F','9999','PC')

Create Table PC (Code int, Model varchar(50), Speed SmallInt, Ram SmallInt, Hd real, Cd varchar(10), Price Money)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(1,'1232',500,64,5,'12x',600)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(10,'1260',500,32,10,'12x',350)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(11,'1233',900,128,40,'40x',980)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(12,'1233',800,128,20,'50x',970)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(2,'1121',750,128,14,'40x',850)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(3,'1233',500,64,5,'12x',600)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(4,'1121',600,128,14,'40x',850)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(5,'1121',600,128,8,'40x',850)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(6,'1233',750,128,20,'50x',950)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(7,'1232',500,32,10,'12x',400)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(8,'1232',450,64,8,'24x',350)
insert into PC (Code, Model, Speed, Ram, Hd, Cd, Price) values(9,'1232',450,32,10,'24x',350)

Create Table Laptop (Code int, Model varchar(50), Speed SmallInt, Ram SmallInt, Hd real, Screen TinyInt, Price Money)
insert into Laptop(code, model, speed, ram, hd, price, screen) values (1,1298,350,32,4,700,11)
insert into Laptop(code, model, speed, ram, hd, price, screen) values (2,1321,500,64,8,970,12)
insert into Laptop(code, model, speed, ram, hd, price, screen) values (3,1750,750,128,12,1200,14)
insert into Laptop(code, model, speed, ram, hd, price, screen) values (4,1298,600,64,10,1050,15)
insert into Laptop(code, model, speed, ram, hd, price, screen) values (5,1752,750,128,10,1150,14)
insert into Laptop(code, model, speed, ram, hd, price, screen) values (6,1298,450,64,10,950,12)
insert into Laptop(code, model, speed, ram, hd, price, screen) values (7,1298,350,32,10,1200,12)

Create Table Printer(Code int, Model varchar(50), Color Char(1), Type varchar(10), Price Money)
insert into printer(code,model,color,type,price) values (1,1276,'n','Laser',400)
insert into printer(code,model,color,type,price) values (2,1433,'y','Jet',270)
insert into printer(code,model,color,type,price) values (3,1434,'y','Jet',290)
insert into printer(code,model,color,type,price) values (4,1401,'n','Matrix',150)
insert into printer(code,model,color,type,price) values (5,1408,'n','Matrix',270)
insert into printer(code,model,color,type,price) values (6,1288,'n','Laser',400)

