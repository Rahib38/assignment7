
## 1. What is PostgreSQL?
**PostgreSQL** হল একটি ওপেন সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা ডেটা সঞ্চয় এবং পরিচালনা করতে ব্যবহৃত হয়। এটি SQL (Structured Query Language) ব্যবহার করে ডেটাবেসে ডেটা প্রবেশ, আপডেট, মুছে ফেলা এবং প্রশ্ন করা যায়। PostgreSQL অত্যন্ত শক্তিশালী এবং স্কেলেবল ডাটাবেস সিস্টেম।

## 2. What is the purpose of a database schema in PostgreSQL?
PostgreSQL-এ **ডাটাবেস স্কিমা** হল একটি কনটেইনার বা ফোল্ডার, যেখানে ডাটাবেসের অবজেক্ট (যেমন টেবিল, ভিউ, ফাংশন) রাখা হয়। স্কিমার মাধ্যমে ডাটাবেসের অবজেক্টগুলো সংগঠিত থাকে এবং একাধিক ব্যবহারকারী বা অ্যাপ্লিকেশন পৃথকভাবে তাদের কাজ করতে পারে।

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
- **Primary Key**: একটি টেবিলের কলাম বা কলামের সেট যা প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে। প্রতিটি প্রাইমারি কী মান অবশ্যই ইউনিক এবং নাল নয়।
  
- **Foreign Key**: একটি টেবিলের কলাম যা অন্য টেবিলের প্রাইমারি কী এর সাথে সম্পর্কিত। এটি টেবিলগুলির মধ্যে রেফারেনশিয়াল ইন্টিগ্রিটি বজায় রাখে।

## 4. What is the difference between the VARCHAR and CHAR data types?
- **VARCHAR** (Variable Character): এটি একটি ভেরিয়েবল-লেংথ স্ট্রিং ডেটা টাইপ। এতে স্টোর করা ডেটার দৈর্ঘ্য তার আসল সাইজ অনুযায়ী আলাদা হতে পারে। এটি সাধারণত সাশ্রয়ী এবং নমনীয়।
  
- **CHAR** (Character): এটি একটি ফিক্সড-লেংথ স্ট্রিং ডেটা টাইপ। যদি স্ট্রিংটির দৈর্ঘ্য কম হয়, তাহলে বাকি জায়গা ফাঁকা (প্যাড) পূর্ণ করা হয়।

## 5. Explain the purpose of the WHERE clause in a SELECT statement.
**WHERE** ক্লজটি SQL স্টেটমেন্টে শর্ত বসানোর জন্য ব্যবহৃত হয়, যাতে নির্দিষ্ট শর্তে মেলে এমন রেকর্ডগুলো নির্বাচন করা যায়। উদাহরণস্বরূপ, আপনি কেবলমাত্র এমন কাস্টমারদের দেখতে চান যারা একটি নির্দিষ্ট শহরে থাকেন, সেক্ষেত্রে WHERE ক্লজ ব্যবহার করা হয়।

## 6. What are the LIMIT and OFFSET clauses used for?
- **LIMIT**: এটি SQL স্টেটমেন্টে রিটার্ন হওয়া রেকর্ডের সংখ্যা সীমিত করতে ব্যবহৃত হয়। উদাহরণস্বরূপ, আপনি সর্বোচ্চ ১০টি রেকর্ড চান।
  
- **OFFSET**: এটি SQL স্টেটমেন্টে রেকর্ডের শুরু পজিশন নির্ধারণ করে। উদাহরণস্বরূপ, আপনি ১০টি রেকর্ড দেখানোর পরে পরবর্তী ১০টি রেকর্ড দেখতে চান, তাহলে OFFSET ব্যবহার করতে হবে।

## 7. How can you modify data using UPDATE statements?
**UPDATE** স্টেটমেন্ট ব্যবহৃত হয় একটি টেবিলের ডেটা পরিবর্তন করতে। এতে **SET** কিওয়ার্ড ব্যবহার করে নতুন মান দেয়া হয় এবং **WHERE** ক্লজের মাধ্যমে কোন রেকর্ডটি আপডেট হবে তা নির্ধারণ করা হয়। উদাহরণ:

```sql
UPDATE customers SET email = 'newemail@example.com' WHERE id = 1;
```

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
**JOIN** অপারেশনটি বিভিন্ন টেবিলের মধ্যে সম্পর্ক তৈরি করে এবং একসাথে ডেটা প্রদান করে। এটি সম্পর্কিত টেবিলগুলির মধ্যে ডেটা সংযুক্ত করার জন্য ব্যবহৃত হয়। PostgreSQL-এ বিভিন্ন ধরনের JOIN (যেমন INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN) রয়েছে।

উদাহরণ:

```sql
SELECT customers.name, orders.order_date
FROM customers
JOIN orders ON customers.id = orders.customer_id;
```

## 9. Explain the GROUP BY clause and its role in aggregation operations.
**GROUP BY** ক্লজটি SQL-এ ডেটা গ্রুপ করার জন্য ব্যবহৃত হয়, যাতে আমরা গ্রুপের উপর বিভিন্ন অ্যাগ্রিগেট ফাংশন (যেমন COUNT, SUM, AVG) প্রয়োগ করতে পারি। এটি মূলত গ্রুপ ভিত্তিক বিশ্লেষণ করতে সাহায্য করে।

উদাহরণ:

```sql
SELECT customer_id, COUNT(*) 
FROM orders 
GROUP BY customer_id;
```

## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
- **COUNT()**: এটি নির্দিষ্ট কলামের রেকর্ডের সংখ্যা গণনা করে।
- **SUM()**: এটি নির্দিষ্ট কলামের সমস্ত মানের যোগফল বের করে।
- **AVG()**: এটি নির্দিষ্ট কলামের গড় (average) মান বের করে।

উদাহরণ:

```sql
SELECT COUNT(*) FROM orders;
SELECT SUM(price) FROM books;
SELECT AVG(price) FROM books;
```