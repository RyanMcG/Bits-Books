-- Authors: 	Ryan McGowan
--		Alex Notwell

-- Step 3: Setup Foreign Keys
-- Book
ALTER TABLE Book ADD CONSTRAINT FOREIGN KEY(publisher_id) REFERENCES Publisher(id);
ALTER TABLE Book MODIFY publisher_id INT(13) NOT NULL;

-- Admin
ALTER TABLE Admin ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES `User`(id);
ALTER TABLE Admin MODIFY user_id INT(13) NOT NULL;

-- Author

-- Billing
ALTER TABLE Billing ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES `User`(id);
ALTER TABLE Billing MODIFY user_id INT(13) NOT NULL;

-- Book_Author
ALTER TABLE Book_Author ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);
ALTER TABLE Book_Author ADD CONSTRAINT FOREIGN KEY(author_id) REFERENCES Author(id);
ALTER TABLE Book_Author MODIFY author_id INT(13) NOT NULL;
ALTER TABLE Book_Author MODIFY book_id INT(13) NOT NULL;

-- Book_Category
ALTER TABLE Book_Category ADD CONSTRAINT FOREIGN KEY(category_id) REFERENCES Category(id);
ALTER TABLE Book_Category ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);
ALTER TABLE Book_Category MODIFY category_id INT(13) NOT NULL;
ALTER TABLE Book_Category MODIFY book_id INT(13) NOT NULL;

-- Cart
ALTER TABLE Cart ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES `User`(id);
ALTER TABLE Cart MODIFY user_id INT(13) NOT NULL;

-- CartItem
ALTER TABLE CartItem ADD CONSTRAINT FOREIGN KEY(cart_id) REFERENCES Cart(id);
ALTER TABLE CartItem ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);
ALTER TABLE CartItem MODIFY  cart_id INT(13) NOT NULL;
ALTER TABLE CartItem MODIFY book_id INT(13) NOT NULL;

-- Category

-- Inventory
ALTER TABLE Inventory ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);
ALTER TABLE Inventory MODIFY book_id INT(13) NOT NULL;

-- InventoryOrder
ALTER TABLE InventoryOrder ADD CONSTRAINT FOREIGN KEY(inventory_id) REFERENCES Inventory(id);
ALTER TABLE InventoryOrder MODIFY inventory_id INT(13) NOT NULL;

-- Order
ALTER TABLE `Order` ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES `User`(id);
ALTER TABLE `Order` ADD CONSTRAINT FOREIGN KEY(cart_id) REFERENCES Cart(id);
ALTER TABLE `Order` MODIFY user_id INT(13) NOT NULL;
ALTER TABLE `Order` MODIFY cart_id INT(13) NOT NULL;

-- OrderItem
ALTER TABLE OrderItem ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);
ALTER TABLE OrderItem ADD CONSTRAINT FOREIGN KEY(order_id) REFERENCES `Order`(id);
ALTER TABLE OrderItem MODIFY order_id INT(13) NOT NULL;
ALTER TABLE OrderItem MODIFY book_id INT(13) NOT NULL;

-- OrderPayment
ALTER TABLE OrderPayment ADD CONSTRAINT FOREIGN KEY(order_id) REFERENCES `Order`(id);
ALTER TABLE OrderPayment ADD CONSTRAINT FOREIGN KEY(billing_id) REFERENCES Billing(id);
ALTER TABLE OrderItem MODIFY order_id INT(13) NOT NULL;
ALTER TABLE OrderItem MODIFY book_id INT(13) NOT NULL;

-- Publisher

-- User

-- UserAddress
ALTER TABLE UserAddress ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES `User`(id);
ALTER TABLE UserAddress MODIFY user_id INT(13) NOT NULL;

-- Creditcard
ALTER TABLE Creditcard ADD CONSTRAINT FOREIGN KEY(address_id) REFERENCES `UserAddress`(id);
ALTER TABLE Creditcard ADD CONSTRAINT FOREIGN KEY(billing_id) REFERENCES Billing(id);
ALTER TABLE Creditcard MODIFY address_id INT(13) NOT NULL;

-- Giftcard
ALTER TABLE Giftcard ADD CONSTRAINT FOREIGN KEY(billing_id) REFERENCES Billing(id);

