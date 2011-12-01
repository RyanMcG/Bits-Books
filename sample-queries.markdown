Sample Queries
==============
Required Queries
----------------
Find all of the books by Pratchett that cost less than $10
Query:
	SELECT B.id, B.title, B.isbn, A.name, B.price FROM Book as B, Author as A, Book_Author as BA WHERE (B.id=BA.book_id AND BA.author_id=A.id) AND A.name='Terry Pratchett' AND B.price<10;

Result:
	+-----+--------------------+----------+-----------------+-------+
	| id  | title              | isbn     | name            | price |
	+-----+--------------------+----------+-----------------+-------+
	| 102 | Small Gods         | 61092177 | Terry Pratchett |  7.99 |
	| 103 | Going Postal       | 60502935 | Terry Pratchett |  7.99 |
	| 104 | Pyramids           | 61020656 | Terry Pratchett |  7.99 |
	| 106 | Guards! Guards!    | 61020648 | Terry Pratchett |  7.99 |
	| 107 | Unseen Academicals | 61161721 | Terry Pratchett |  7.99 |
	+-----+--------------------+----------+-----------------+-------+

Give all of the titles and dates for purchases made by a particular customer
Query:
	SELECT B.title, O.date_modified FROM User as U, `Order` as O, OrderItem as OI, Book as B WHERE (O.user_id=U.id AND OI.order_id=O.id AND B.id=OI.book_id) AND (U.id=21);
Result:
	+-------------------------+---------------------+
	| title                   | date_modified       |
	+-------------------------+---------------------+
	| Intermediate Accounting | 2011-12-01 07:53:00 |
	+-------------------------+---------------------+

List all of the books with less than 5 quantity in stock
Query:
	SELECT B.title, I.quantity FROM Book as B, Inventory as I WHERE (B.id=I.book_id) AND (I.quantity<5);
Result:
	+-----------------------------------------------------+----------+
	| title                                               | quantity |
	+-----------------------------------------------------+----------+
	| The Five Dysfunctions of a Team: A Leadership Fable |        4 |
	| Contact                                             |        2 |
	| Engaging The Enemy                                  |        3 |
	+-----------------------------------------------------+----------+

Unique Queries
--------------
Add a new user:
Query:
	INSERT INTO User VALUES (id=25, username='myusername', name='Bob Smith', email='bsmith@yahoo.com', password='bobspass', phone='6145431234', date_created='2001-01-01 12:00:00', date_modified='2001-01-01 12:00:00');
Result:
	Query OK, 1 row affected (0.00 sec)

Recover a user's password
Query:
	SELECT U.email, U.password FROM User as U WHERE U.email='notwella@me.com';
Result:
	+-----------------+----------+
	| email           | password |
	+-----------------+----------+
	| notwella@me.com | login    |
	+-----------------+----------+

Get all addresses a user has entered
Query:
	SELECT U.name, UA.address1, UA.city, UA.state, UA.zip FROM User as U, UserAddress as UA WHERE (U.id=UA.user_id) AND (U.email='notwella@me.com');
Result:
	+--------------+-------------------+----------+-------+-------+
	| name         | address1          | city     | state | zip   |
	+--------------+-------------------+----------+-------+-------+
	| Alex Notwell | 123 Neil Avenue   | Columbus | OH    | 43201 |
	| Alex Notwell | 2046 Bedford Road | Columbus | OH    | 43212 |
	| Alex Notwell | 1800 King Avenue  | Columbus | OH    | 43212 |
	+--------------+-------------------+----------+-------+-------+