-- Tabela proizvoda: Products(prod_id, prod_name, category_id, price, stock)
-- Tabela kategorija: Categories(category_id, category_name)
-- Tabela narudžbina: Orders(order_id, order_date, customer_id)
-- Tabela stavke narudžbine: OrderItems(order_id, prod_id, quantity, item_price)
-- Tabela kupaca: Customers(customer_id, city, country))

-- I. Kreacija tabela

-- Kategorije
CREATE TABLE Categories (
category_id int PRIMARY KEY,
category_name VARCHAR(100) NOT NULL
);

-- Proizvodi
CREATE TABLE Products (
prod_id int PRIMARY KEY,
prod_name VARCHAR(100) NOT NULL,
category_id int REFERENCES Categories(category_id),
price NUMERIC(10, 2)  NOT NULL,
stock NUMERIC  DEFAULT 0 NOT NULL
);

-- Kupci
CREATE TABLE Customers (
customer_id INTEGER  PRIMARY KEY,
city VARCHAR(100),
country VARCHAR(100)
);

-- Narudzbine
CREATE TABLE Orders (
order_id INTEGER  PRIMARY KEY,
order_date DATE NOT NULL,
customer_id INTEGER REFERENCES Customers(customer_id)
);

-- Stavke narudzbine
CREATE TABLE OrderItems (
order_id INTEGER REFERENCES Orders(order_id),
prod_id INTEGER REFERENCES Products(prod_id),
quantity INTEGER NOT NULL,
item_price NUMERIC(10, 2) NOT NULL,
PRIMARY KEY (order_id, prod_id)
);

-- II. Unos podataka

-- Unos kategorija
INSERT INTO Categories (category_id,category_name) VALUES (1,'Elektronika');
INSERT INTO Categories (category_id,category_name) VALUES (2,'Kuvanje');
INSERT INTO Categories (category_id,category_name) VALUES (3,'Igračke');
INSERT INTO Categories (category_id,category_name) VALUES (4,'Kancelarijski');

-- Unos proizvoda (10 proizvoda rasporedjenih po 4 kategorije)
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (1, 'Laptop Pro 14"', 1, 1200.00, 20);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (2, 'Smartphone X', 1, 799.99, 50);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (3, 'Televizor 55"', 1, 699.99, 15);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (4, 'Električni blender', 2, 89.99, 40);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (5, 'Espresso aparat', 2, 129.99, 30);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (6, 'Pisaći blokčić', 4, 3.50, 500);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (7, 'Fen za kosu', 4, 24.99, 60);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (8, 'Igračka lutka', 3, 14.99, 200);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (9, 'Disk mobilni 1TB', 1, 59.99, 25);
INSERT INTO Products (prod_id, prod_name, category_id, price, stock) VALUES (10, 'Set Olovaka', 4, 5.99, 300);

-- Unos kupaca
INSERT INTO Customers (customer_id, city, country) VALUES (1, 'Beograd', 'Srbija');
INSERT INTO Customers (customer_id, city, country) VALUES (2, 'Novi Sad', 'Srbija');
INSERT INTO Customers (customer_id, city, country) VALUES (3, 'Niš', 'Srbija');
INSERT INTO Customers (customer_id, city, country) VALUES (4, 'Zagreb', 'Hrvatska');
INSERT INTO Customers (customer_id, city, country) VALUES (5, 'Sarajevo', 'Bosna i Hercegovina');

-- Narudžbine
INSERT INTO Orders (order_id, order_date, customer_id) VALUES
(1, '2025-01-02', 1)
(2, '2025-01-03', 2)
(3, '2025-01-02', 3)
(4, '2025-01-03', 4)
(5, '2025-01-03', 5)
(6, '2025-03-02', 1)
(7, '2025-03-03', 2)
(8, '2025-03-02', 3)
(9, '2025-03-03', 4)
(10, '2025-03-03', 5)

-- Stavke narudzbine:
-- Narudzbine:
INSERT INTO Orders (order_id, order_date, customer_id) VALUES
-- Stavke narudzbine:
INSERT INTO OrderItems (order_id, prod_id, quantity, item_price) VALUES
(1, 1, 1, 1200.00)
(1, 3, 4, 699.99)
(1, 5, 1, 129.99)
(1, 6, 2, 3.50)
(1, 9, 1, 59.99)
(2, 2, 1, 799.99)
INSERT INTO OrderItems (order_id, prod_id, quantity, item_price) VALUES
(2, 3, 10, 699.99)
(2, 7, 10, 24.99)
(3, 1, 1, 1200.00)
(3, 3, 4, 699.99)
(3, 6, 2, 3.50)
(3, 8, 1, 14.99)
(3, 9, 1, 59.99)
INSERT INTO OrderItems (order_id, prod_id, quantity, item_price) VALUES
(4, 8, 1, 14.99)
(4, 9, 10, 59.99)
(4, 10, 10, 5.99)
(5, 1, 1, 1200.00)
(5, 3, 4, 699.99)
(6, 5, 1, 129.99)
(6, 6, 2, 3.50)
INSERT INTO OrderItems (order_id, prod_id, quantity, item_price) VALUES
(6, 9, 1, 59.99)
(7, 2, 1, 799.99)
(7, 3, 10, 699.99)
(7, 7, 10, 24.99)
(8, 1, 1, 1200.00)
(8, 3, 4, 699.99)
(8, 6, 2, 3.50)
INSERT INTO OrderItems (order_id, prod_id, quantity, item_price) VALUES
(9, 8, 1, 14.99)
(9, 9, 1, 59.99)
(9, 10, 10, 5.99)
(10, 1, 1, 1200.00)
(10, 2, 1, 799.99)
(10, 3, 4, 699.99)
INSERT INTO OrderItems (order_id, prod_id, quantity, item_price) VALUES
(10, 6, 2, 3.50)
(10, 8, 1, 14.99)
(10, 9, 1, 59.99)
(10, 10, 10, 5.99)

-- III. Zadaci

-- 1. prikazite broj proizvoda u svakoj kategoriji
select count(Products.prod_id),Categories.category_id
from Products join Categories on (Products.category_id=Categories.category_id)
group by Categories.category_id

-- 2. minimalna, prosecna  i maksimalna cena po kategoriji
select min(price),avg(price),max(price),Categories.category_id
from Products join Categories on (Products.category_id=Categories.category_id)
group by Categories.category_id  

-- 3. prosecna prodajna vrednost po kategoriji samo za kategorije sa vise od 3 proizvoda (HAVING)
select Categories.category_id,avg(item_price*quantity),count(distinct Products.prod_id)
from Products join Categories on (Products.category_id=Categories.category_id) join OrderItems on(OrderItems.prod_id=Products.prod_id)
group by Categories.category_id
having  count(distinct Products.prod_id)>3

-- 4. Spajanje sa podupitom – prosečna količina i cena po proizvodu sa filtriranjem             “prodavnica” (store)
-- Opis: Ispišite proizvod zajedno sa prosečnom količinom po narudžbini i prosečnom 
-- iznosu po jedinici, ali samo za proizvode iz kategorije koja ima više od 3 proizvoda.
select Products.prod_id,avg(OrderItems.quantity),avg(OrderItems.item_price)
from Products join OrderItems on (OrderItems.prod_id=Products.prod_id)
where category_id in 
   (select category_id
   from Products
   group by category_id
   having count(Products.prod_id)>3 )
group by Products.prod_id

-- 5. Vremenski trend ukupne prodaje po mesecu sa HAVING
-- Opis: Prikažite mesec i ukupnu prodaju (revenue) za svaki mesec, samo meseci gde ukupna prodaja
-- prelazi određeni iznos (npr. 1000).
select to_char(order_date,'MM'),sum(quantity*item_price)
from Orders join OrderItems on (OrderItems.order_id=Orders.order_id)
group by to_char(order_date,'MM')
having sum(quantity*item_price)>1000
