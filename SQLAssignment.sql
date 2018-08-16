-- Part I – Working with an existing database

-- Setting up Oracle Chinook
-- In this section you will begin the process of working with the Oracle Chinook database
-- Task – Open the Chinook_Oracle.sql file and execute the scripts within.
-- 2.0 SQL Queries
-- In this section you will be performing various queries against the Oracle Chinook database.
-- 2.1 SELECT
-- Task – Select all records from the Employee table.
SELECT * FROM chinook.EMPLOYEE;
-- Task – Select all records from the Employee table where last name is King.
SELECT * FROM chinook.EMPLOYEE
	WHERE lastname = 'King';
-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM chinook.EMPLOYEE
	WHERE firstname = 'Andrew' and
	reportsto is null;
-- 2.2 ORDER BY
-- Task – Select all albums in Album table and sort result set in descending order by title.
SELECT * FROM album
	ORDER BY title desc;
-- Task – Select first name from Customer and sort result set in ascending order by city
SELECT firstname FROM customer
	ORDER BY city;
-- 2.3 INSERT INTO
-- Task – Insert two new records into Genre table
INSERT INTO genre(genreid, name)
	VALUES(27, 'Moombahton');
INSERT INTO genre(genreid, name)
	VALUES(27, 'Death Metal');
-- Task – Insert two new records into Employee table
INSERT INTO employee(employeeid, lastname, firstname, title, reportsto, 
	birthdate, hiredate, address, city, state, country, postalcode, phone, fax, email)
VALUES
 (9, 'Wallaby', 'Jeffrey', 'IT Staff', 6, '1776-08-14 00:00:00', 
 	'2003-05-26 00:00:00', '123 Easy St SW', 'New York', 'New York', 
 	'United States', '12345', '+1 (123) 456-7890', '+1 (123) 456-7891', 
 	'jeffiscool@chinookcorp.com');

INSERT INTO employee(employeeid, lastname, firstname, title, reportsto, 
	birthdate, hiredate, address, city, state, country, postalcode, phone, fax, email)
VALUES
 (10, 'Mungus', 'Hugh', 'IT Staff', 6, '1284-02-11 00:00:00', 
 	'2008-02-21 00:00:00', '123 Big St SW', 'Chicago', 'Illinois', 
 	'United States', '12345', '+1 (123) 456-7890', '+1 (123) 456-7891', 
 	'yaboihughmungus@chinookcorp.com');
-- Task – Insert two new records into Customer table
INSERT INTO customer(customerid, firstname, lastname, company, address, 
	city, state, country, postalcode, phone, fax, email, supportrepid)
VALUES
 (10, 'Willy', 'Wonka', 'IT Staff', 'Chocolate Company', '123 Cocoa NW', 'Kansas City', 'Missouri', '12345', '+1 (123) 456-7890', '+1 (123) 456-7891', 'willy@wonka.com', 3);

INSERT INTO customer(customerid, firstname, lastname, company, address, 
	city, state, country, postalcode, phone, fax, email, supportrepid)
VALUES
 (11, 'Luke', 'Skywalker', 'IT Staff', 'The Force LLC', '123 Jedi SW', 'Oakland', 'California', '12345', '+1 (123) 456-7890', '+1 (123) 456-7891', 'willy@wonka.com', 3);
-- 2.4 UPDATE
-- Task – Update Aaron Mitchell in Customer table to Robert Walter
UPDATE customer
SET firstname = 'Robert',
	lastname = 'Walter'
WHERE
 	firstname = 'Aaron' and lastname = 'Mitchell';
-- Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
UPDATE artist
SET name = 'CCR'
WHERE
	name = 'Creedence Clearwater Revival'

-- 2.5 LIKE
-- Task – Select all invoices with a billing address like “T%”
SELECT * FROM invoice
	WHERE billingaddress LIKE 'T%';
-- 2.6 BETWEEN
-- Task – Select all invoices that have a total between 15 and 
SELECT * FROM invoice
	WHERE total BETWEEN 15 and 50;
-- Task – Select all employees hired between 1st of June 2003 and 1st of March 
SELECT * FROM employee
	WHERE hiredate BETWEEN '2003-06-01' and '2004-03-01';
-- 2.7 DELETE
-- Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
ALTER TABLE invoice
DROP CONSTRAINT fk_invoicecustomerid,
ADD CONSTRAINT fk_invoicecustomerid
   FOREIGN KEY (customerid)
   REFERENCES customer(customerid)
   ON DELETE CASCADE;

ALTER TABLE invoiceline
DROP CONSTRAINT fk_invoicelineinvoiceid,
ADD CONSTRAINT fk_invoicelineinvoiceidid
   FOREIGN KEY (invoiceid)
   REFERENCES invoice(invoiceid)
   ON DELETE CASCADE;

DELETE FROM customer
WHERE firstname = 'Robert' and lastname = 'Walter';
-- SQL Functions
-- In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
-- 3.1 System Defined Functions
-- Task – Create a function that returns the current time.
-- Task – create a function that returns the length of a mediatype from the mediatype table
-- 3.2 System Defined Aggregate Functions
-- Task – Create a function that returns the average total of all invoices
-- Task – Create a function that returns the most expensive track
-- 3.3 User Defined Scalar Functions
-- Task – Create a function that returns the average price of invoiceline items in the invoiceline table
-- 3.4 User Defined Table Valued Functions
-- Task – Create a function that returns all employees who are born after 1968.
-- 4.0 Stored Procedures
--  In this section you will be creating and executing stored procedures. You will be creating various types of stored procedures that take input and output parameters.
-- 4.1 Basic Stored Procedure
-- Task – Create a stored procedure that selects the first and last names of all the employees.
-- 4.2 Stored Procedure Input Parameters
-- Task – Create a stored procedure that updates the personal information of an employee.
-- Task – Create a stored procedure that returns the managers of an employee.
-- 4.3 Stored Procedure Output Parameters
-- Task – Create a stored procedure that returns the name and company of a customer.
-- 5.0 Transactions
-- In this section you will be working with transactions. Transactions are usually nested within a stored procedure. You will also be working with handling errors in your SQL.
-- Task – Create a transaction that given a invoiceId will delete that invoice (There may be constraints that rely on this, find out how to resolve them).
-- Task – Create a transaction nested within a stored procedure that inserts a new record in the Customer table
-- 6.0 Triggers
-- In this section you will create various kinds of triggers that work when certain DML statements are executed on a table.
-- 6.1 AFTER/FOR
-- Task - Create an after insert trigger on the employee table fired after a new record is inserted into the table.
-- Task – Create an after update trigger on the album table that fires after a row is inserted in the table
-- Task – Create an after delete trigger on the customer table that fires after a row is deleted from the table.

-- 6.2 INSTEAD OF
-- Task – Create an instead of trigger that restricts the deletion of any invoice that is priced over 50 dollars.
-- 7.0 JOINS
-- In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
-- 7.1 INNER
-- Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
SELECT customer.firstname, customer.lastname, 
		invoice.invoiceid FROM customer
INNER JOIN invoice ON (customer.customerid = invoice.customerid);
-- 7.2 OUTER
-- Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
SELECT customer.customerid, customer.firstname,
		customer.lastname, invoice.invoiceid,
		invoice.total 
		FROM customer 
FULL OUTER JOIN invoice ON 
		(customer.customerid = invoice.customerid);
-- 7.3 RIGHT
-- Task – Create a right join that joins album and artist specifying artist name and title
SELECT artist.name, album.title
	FROM album
	RIGHT JOIN artist ON 
	(album.artistid = artist.artistid);
-- 7.4 CROSS
-- Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
SELECT * FROM album
	CROSS JOIN artist
	ORDER BY artist.name;
-- 7.5 SELF
-- Task – Perform a self-join on the employee table, joining on the reportsto column.
SELECT * FROM employee b
	INNER JOIN employee n
	ON b.reportsto = n.employeeid;








