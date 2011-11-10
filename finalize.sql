-- Authors: 	Ryan McGowan
--		Alex Notwell

-- Step 3: Setup Foreign Keys
-- Book
ALTER TABLE Book ADD FOREIGN KEY(publisher_id) REFERENCES Publisher(id);

-- Admin
ALTER TABLE Admin ADD FOREIGN KEY(user_id) REFERENCES User(id);

-- Author

-- Billing
ALTER TABLE Billing ADD FOREIGN KEY(user_id) REFERENCES User(id);

-- Book_Author
ALTER TABLE Book_Author ADD FOREIGN KEY(book_id) REFERENCES Book(id);
ALTER TABLE Book_Author ADD FOREIGN KEY(author_id) REFERENCES Author(id);

-- Book_Category
ALTER TABLE Book_Category ADD FOREIGN KEY(category_id) REFERENCES Category(id);
ALTER TABLE Book_Category ADD FOREIGN KEY(book_id) REFERENCES Book(id);

-- Cart
ALTER TABLE Cart ADD FOREIGN KEY(order_id) REFERENCES `Order`(id);

-- CartItem
ALTER TABLE CartItem ADD FOREIGN KEY(cart_id) REFERENCES Cart(id);
ALTER TABLE CartItem ADD FOREIGN KEY(book_id) REFERENCES Book(id);

-- Category

-- Inventory
ALTER TABLE Inventory ADD FOREIGN KEY(book_id) REFERENCES Book(id);

-- InventoryOrder
ALTER TABLE InventoryOrder ADD FOREIGN KEY(invetory_id) REFERENCES Inventory(id);

-- Order
ALTER TABLE `Order` ADD FOREIGN KEY(cart_id) REFERENCES Cart(id);
ALTER TABLE `Order` ADD FOREIGN KEY(user_id) REFERENCES User(id);

-- OrderItem
ALTER TABLE OrderItem ADD FOREIGN KEY(book_id) REFERENCES Book(id);

-- OrderPayment
ALTER TABLE OrderPayment ADD FOREIGN KEY(order_id) REFERENCES `Order`(id);
ALTER TABLE OrderPayment ADD FOREIGN KEY(billing_id) REFERENCES Billing(id);

-- Publisher

-- User

-- UserAddress
ALTER TABLE UserAddress ADD FOREIGN KEY(user_id) REFERENCES `User`(id);

-- Creditcard
ALTER TABLE Creditcard ADD FOREIGN KEY(address_id) REFERENCES `UserAddress`(id);

-- Giftcard

