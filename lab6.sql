/*zad1*/
WITH XMLNAMESPACES ('uri' as ns1)
select * from Customers 
FOR XML path('customer'), root('Customers') 

/*zad2*/
WITH XMLNAMESPACES ('uri' as ns1) 
SELECT CustomerID, CAST((Select * From Customers Cus where C.CustomerID = Cus.CustomerId  for xml auto, elements) as xml) as  Data 
INTO XmlCustomers from Customers C 
drop table XmlCustomers
/*zad3*/
Select Data.query('/Cus/CompanyName, /Cus/Country') as Data 
from XmlCustomers 

select * from XmlCustomers

WITH XMLNAMESPACES ('uri' as ns1) 
SELECT Data.value('(/Cus/CompanyName)[1]', 'varchar(max)') as CompanyName,
	   Data.value('(/Cus/ContactName)[1]', 'varchar(max)') as ContactName
FROM XmlCustomers

/*zad4*/
DECLARE @a xml 
SET @a = ( SELECT Data from XmlCustomers for xml auto, elements, root('root') )  
  
select @a.query(' element Customers{  for $k in /root/XmlCustomers/Data/Cus where $k/Country="Poland" or $k/Country="Spain" return $k } ') 


/*zad5*/
SELECT Data.value('(/Cus/CustomerID)[1]', 'varchar(max)') as [@id],
		Data.value('(/Cus/CompanyName)[1]', 'varchar(max)') as Nazwa,
	   Data.value('(/Cus/Country)[1]', 'varchar(max)') as Kraj
FROM XmlCustomers
where Data.value('(/Cus/Country)[1]', 'varchar(max)') like 'Germany'
for xml path('Klient'), root('Klienci') 

/*zad6*/
SELECT * FROM Orders join [Order Details] as D on Orders.OrderID = D.OrderID
WHERE D.OrderID in  (select ordd.OrderID from [Order Details] as ordd group by ordd.OrderID 
HAVING SUM( ordd.Quantity * ordd.UnitPrice) > 15000 )
FOR XML AUTO

SELECT CAST((SELECT * FROM Orders join [Order Details] as D on Orders.OrderID = D.OrderID
WHERE D.OrderID in  (select ordd.OrderID from [Order Details] as ordd group by ordd.OrderID 
HAVING SUM( ordd.Quantity * ordd.UnitPrice) > 15000 ) for xml auto) as xml) as  Data into xml6

SELECT CAST((SELECT * FROM Orders join [Order Details] as D on Orders.OrderID = D.OrderID
WHERE D.OrderID in  (select ordd.OrderID from [Order Details] as ordd group by ordd.OrderID 
HAVING SUM( ordd.Quantity * ordd.UnitPrice) > 15000 ) for xml auto) as xml) as  Data into xml6

drop table xml6

select * from xml6




