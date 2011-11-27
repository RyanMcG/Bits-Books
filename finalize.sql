-- Authors: 	Ryan McGowan
--		Alex Notwell

-- Step 3: Setup Foreign Keys
-- Book
ALTER TABLE Book ADD CONSTRAINT FOREIGN KEY(publisher_id) REFERENCES Publisher(id);

-- Admin
ALTER TABLE Admin ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES User(id);

-- Author

-- Billing
ALTER TABLE Billing ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES User(id);

-- Book_Author
ALTER TABLE Book_Author ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);
ALTER TABLE Book_Author ADD CONSTRAINT FOREIGN KEY(author_id) REFERENCES Author(id);

-- Book_Category
ALTER TABLE Book_Category ADD CONSTRAINT FOREIGN KEY(category_id) REFERENCES Category(id);
ALTER TABLE Book_Category ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);

-- Cart
ALTER TABLE Cart ADD CONSTRAINT FOREIGN KEY(order_id) REFERENCES `Order`(id);

-- CartItem
ALTER TABLE CartItem ADD CONSTRAINT FOREIGN KEY(cart_id) REFERENCES Cart(id);
ALTER TABLE CartItem ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);

-- Category

-- Inventory
ALTER TABLE Inventory ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);

-- InventoryOrder
ALTER TABLE InventoryOrder ADD CONSTRAINT FOREIGN KEY(inventory_id) REFERENCES Inventory(id);

-- Order
ALTER TABLE `Order` ADD CONSTRAINT FOREIGN KEY(cart_id) REFERENCES Cart(id);
ALTER TABLE `Order` ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES User(id);

-- OrderItem
ALTER TABLE OrderItem ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES Book(id);
ALTER TABLE OrderItem ADD CONSTRAINT FOREIGN KEY(order_id) REFERENCES `Order`(id);

-- OrderPayment
ALTER TABLE OrderPayment ADD CONSTRAINT FOREIGN KEY(order_id) REFERENCES `Order`(id);
ALTER TABLE OrderPayment ADD CONSTRAINT FOREIGN KEY(billing_id) REFERENCES Billing(id);

-- Publisher

-- User

-- UserAddress
ALTER TABLE UserAddress ADD CONSTRAINT FOREIGN KEY(user_id) REFERENCES `User`(id);

-- Creditcard
ALTER TABLE Creditcard ADD CONSTRAINT FOREIGN KEY(address_id) REFERENCES `UserAddress`(id);
ALTER TABLE Creditcard ADD CONSTRAINT FOREIGN KEY(billing_id) REFERENCES Billing(id);

-- Giftcard
ALTER TABLE Giftcard ADD CONSTRAINT FOREIGN KEY(billing_id) REFERENCES Billing(id);

