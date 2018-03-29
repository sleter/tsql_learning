create view "Products from USA" as
SELECT Products.ProductName
from Products
inner join Suppliers
on Products.SupplierID = Suppliers.SupplierID
where Suppliers.Country = 'USA'

select * from "Products from USA"

select * from Customers
where Customers.customerID not in (SELECT CustomerID from Orders)

select emp2.FirstName, emp.LastName from Employees emp2
cross join Employees emp

select cus.CompanyName, pro.ProductName from Customers cus
join Orders ord on cus.CustomerID = ord.CustomerID
join [Order Details] orde on orde.OrderID = ord.OrderID
join Products pro on pro.ProductID = orde.ProductID

select cus.CompanyName, sum(od.UnitPrice*od.Quantity) as n from Customers cus
join Orders o on cus.CustomerID = o.CustomerID
join [Order Details] od on od.OrderID = o.OrderID
join Products p on p.ProductID = od.ProductID
group by cus.CompanyName
order by n desc

select c.CompanyName from Customers c
full outer join Orders o on c.CustomerID = o.CustomerID
where o.CustomerID is null

select cat.CategoryName, sum(Quantity) as [Laczna ilosc] from Products pro
join Categories cat on pro.CategoryID = cat.CategoryID
join [Order Details] od on od.ProductID = pro.ProductID
join Orders ord on ord.OrderID = od.OrderID
group by cat.CategoryName

update Products set UnitPrice = UnitPrice*1.1 where ProductName in
(
select ProductName from Products p
join [Order Details] od on p.ProductID = od.ProductID
join Orders o on o.OrderID = od.OrderID
group by p.ProductName
having count(o.OrderID) > 10 
)

select cus.CompanyName, pro.ProductName, e.FirstName, e.LastName
into "Customer Product Employee"
from Customers cus
join Orders ord on cus.CustomerID = ord.CustomerID
join [Order Details] ord2 on ord2.OrderID = ord.OrderID
join Products pro on pro.ProductID = ord2.ProductID
join Employees e on e.EmployeeID = ord.EmployeeID

select * from [Customer Product Employee]


/*drop table [Suppliers no products]*/

/*select * from [Suppliers no products]*/

create view [Order Prices] as
select od.OrderID, sum(UnitPrice*Quantity-UnitPrice*Quantity*Discount) as Cena
from [Order Details] od 
group by od.OrderID;

select * from [Order Prices]