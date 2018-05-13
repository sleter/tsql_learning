/*zad1*/
create procedure daty
@aDate date,
@bDate date
as
select * from orders 
where OrderDate >=@aDate
AND OrderDate <=@bDate;

EXEC daty '1997-08-15','2018-04-12'

/*zad2*/
create procedure klienci_zamowienia
@name varchar(40) as select * from orders 
join Customers on orders.CustomerID = Customers.CustomerID
where CompanyName like '%' + @name + '%' OR ContactName like '%' + @name + '%'

EXEC klienci_zamowienia 'Du monde entier'
EXEC klienci_zamowienia 'monde'

/* Zad3 */ 
create trigger display on Products 
	after insert 
as 
DECLARE @product varchar(255) = ( SELECT inserted.ProductName  FROM inserted JOIN Suppliers s  ON inserted.SupplierID = s.SupplierID)
DECLARE @company varchar(255) = ( SELECT s.CompanyName  FROM inserted JOIN Suppliers s  ON inserted.SupplierID = s.SupplierID)
	print 'Nazwa: '+ @company + ' Produkt: ' + @product


insert into Products values ('NowyProdukt',1,1,'ak',12.00,2,3,3,0)

/* Zad4 */ 
drop procedure discount

create procedure discount
	@wartosc real
as 
declare @rabat real = 0.10
	update [Order Details]
	set Discount = @rabat
	where UnitPrice*Quantity > @wartosc

select * from [Order Details]

EXEC discount 0.3

/* Zad5 */ 
alter table Orders add LastModified date 

select * from Orders

create trigger updateDate on [Order Details]
after insert, update, delete 
as 
	update Orders 
	set LastModified = GETDATE()
	where Orders.OrderID in  ( SELECT OrderID FROM inserted) or  Orders.OrderID in  ( SELECT OrderID FROM deleted) 
	
	
insert into [Order Details] values (10250,13,40.00,10,0)

/*zad6*/

declare @name varchar(255)
create trigger pom on Customers
after insert as
declare curs cursor for
select ProductName from Suppliers s
join Products on s.SupplierID =Products.SupplierID
join inserted on inserted.Country=Suppliers.Country

open curs 
fetch next from c into @COuntry
while @@FETCH_STATUS
 



