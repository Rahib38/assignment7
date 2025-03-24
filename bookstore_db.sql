-- Active: 1742195770280@@127.0.0.1@5432@bookstore_db@public
CREATE table books(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price DECIMAL(10, 2) CHECK (price>=0),
    stock INT CHECK (stock>=0) NOT NULL DEFAULT 0,
    published_year INT CHECK (published_year >= 1000 AND published_year <= 9999)
);

DROP Table books;
DROP Table customers;

CREATE table customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_email VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

CREATE table orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) NOT NULL,
    book_id INT REFERENCES books(book_id) NOT NULL,
    quantity INTEGER CHECK (quantity>0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP Table orders;


INSERT INTO books (title, author, price, stock, published_year) 
    VALUES
    ('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, '1999'),
    ('Clean Code', 'Robert C. Martin', 35.00, 5, '2008'),
    ('You Don`t Know JS', 'Kyle Simpson', 30.00, 8, '2014'),
    ('Refactoring', 'Martin Fowler', 50.00, 3, '1999'),
    ('Database Design Principles', 'Jane Smith', 20.00, 0, '2018');


INSERT INTO customers (customer_name, customer_email, joined_date) 
    VALUES
    ('Alice', 'alice@email.com','2023-01-10'),
    ('Bob', 'bob@email.com','2022-05-15 '),
    ('Charlie', 'charlie@email.com','2023-06-20 ');


INSERT INTO orders ( customer_id, book_id, quantity, order_date) 
    VALUES
    (1,2,1,'2024-03-10'),
    (2,1,1,'2024-02-20'),
    (1,3,2,'2024-03-05');

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;


-- 1️⃣ Find books that are out of stock.

SELECT title from books
    WHERE stock=0;


-- 2️⃣ Retrieve the most expensive book in the store.

SELECT *,price from books 
    ORDER BY price
    DESC
    LIMIT 1;


-- 3️⃣ Find the total number of orders placed by each customer.

SELECT c.customer_name, COUNT(*) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;



-- 4️⃣ Calculate the total revenue generated from book sales.

SELECT  sum(price) AS total_revenue FROM books;


-- 5️⃣ List all customers who have placed more than one order.

SELECT c.customer_name, COUNT(*) AS total_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING count(*) > 1;


-- 6️⃣ Find the average price of books in the store.

SELECT  round(avg(price),2) AS avg_book_price FROM books;



-- 7️⃣ Increase the price of all books published before 2000 by 10%.

UPDATE books
SET price = price * 1.10
WHERE published_year <2000;

-- 8️⃣ Delete customers who haven't placed any orders.

DELETE FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);