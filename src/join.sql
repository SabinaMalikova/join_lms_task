-- 1. Бардык клиенттердин шаарлары  уникалдуу чыксын
select distinct city
from Customers;
-- 2. Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
select *
from Employees
where year (BirthDate) between 1950 and 1960;
-- 3. Франциялык поставщиктердин аттары жана мамлекети чыксын
select s.SupplierName, s.Country
from Suppliers s
where Country = 'France';
-- 4. Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
select s.CustomerName, s.Address, s.Country
from Customers s
where Country not in ('Spain')
  and CustomerName like 'A%';
-- 5. PostalCode бош болгон клиенттер чыксын
select *
from Customers c
where c.PostalCode = '';
-- 6. Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
select top 2 *
from Customers
where City = 'London';
-- 7. Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
select e.LastName, e.BirthDate
from Employees e
where LastName like '____';
-- 8. Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
select distinct s.city, count(s.SupplierID) as Supplier_count
from Suppliers s
group by s.city;
-- 10. Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
select c.CategoryName, SUM(p.Price) as sum_price
from Categories c
         inner join Products p on c.CategoryID = p.CategoryID
group by c.CategoryName;
-- 11. 6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT min(Products.Price) as min_price, Products.ProductName
from Products
         inner join Categories on Products.CategoryID = Categories.CategoryID
group by Products.ProductName;
-- 12. Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
SELECT Products.ProductName, Suppliers.SupplierName
from Products
-- 13. Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
SELECT count(p.ProductID) as count_product, p.SupplierID
from Products as p
         inner join Suppliers as s on p.SupplierID = s.SupplierID
group by p.SupplierID
order by count(p.ProductID) desc;
-- 14. Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
select c.customerName, e.firstName, s.shipperName
from customers as c,
     orders as o,
     employees as e,
     shippers as s
where c.customerID = o.customerID
  and o.employeeID = e.employeeID
  and s.shipperID = o.shipperID;
-- 15. Кайсы ишкер канча клиент обслуживайтеткен чыксын
select e.firstName, count(c.customerName) as clients_counts
from customers as c,
     orders as o,
     employees as e
where c.customerID = o.customerID
  and o.employeeID = e.employeeID
group by e.firstName
order by count(c.customerName) desc;