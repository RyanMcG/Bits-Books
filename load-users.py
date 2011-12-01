from bitslib.models import User as u, Creditcard as cc, Giftcard as gc, Billing as b, UserAddress as ua, Admin as a, Cart as c, CartItem as ci, Order as o, OrderItem as oi, Book, OrderPayment as op
from web import db
from datetime import datetime
import random

class UserLoader():
	def load(self):
		newuser1 = u('dsheffey@bitbook.com','dsheffey','mypass','Dona Sheffey','6141231234')
		newuser2 = u('mbasta@gmail.com','mbasta','password','Milagros Basta','6141231234')
		newuser3 = u('ccrandle@yahoo.com','ccrandle','pass1234','Chandra Crandle','6141231234')
		newuser4 = u('nbritt@hotmail.com','nbritt','p1a2s3s4','Neil Brittingham','6141231234')
		newuser5 = u('fmcray@hotmail.com','fmcray','fernpass','Fernando Mcray','6141231234')
		newuser6 = u('hrozar@yahoo.com','hrozar','rozpass1','Hugh Rozar','6141231234')
		newuser7 = u('khelt@gmail.com','khelt','mypassword','Kurt Helt','6141231234')
		newuser8 = u('efierros@bitbook.com','efierros','passerik','Erik Fierros','6141231234')
		newuser9 = u('mkono@bitbook.com','mkono','marc123','Marcie Kono','6141231234')
		newuser10 = u('mwafford@bitbook.com','mwafford','passwordmatt','Mathew Wafford','6141231234')
		newuser11 = u('kgrajales@gmail.com','kgrajales','kgpassw','Kelly Grajales','6141231234')
		newuser12 = u('cbrimer@gmail.com','cbrimer','cbrimpass','Cody Brimer','6141231234')
		newuser13 = u('bdoubleday@facebook.com','bdouble','bdub123','Benita Doubleday','6141231234')
		newuser14 = u('dsaul@yahoo.com','dsaul','dspass','Darren Saulsberry','6141231234')
		newuser15 = u('eherdt@gmail.com','eherdt','mypass12','Edwina Herdt','6141231234')
		newuser16 = u('lyadao@gmail.com','lyadao','lize565','Liza Yadao','6141231234')
		newuser17 = u('jpanza@yahoo.com','jpanza','password999','Javier Panza','6141231234')
		newuser18 = u('equashie@hotmail.com','equashie','eqpass9898','Esmeralda Quashie','6141231234')
		newuser19 = u('emaio@hotmail.com','emaio','thepassword','Earlene Maio','6141231234')
		newuser20 = u('tsyed@yahoo.com','tseyd','tspassword','Ted Syed','6141231234')
		
		
		db.session.add(newuser1)
		db.session.add(newuser2)
		db.session.add(newuser3)
		db.session.add(newuser4)
		db.session.add(newuser5)
		db.session.add(newuser6)
		db.session.add(newuser7)
		db.session.add(newuser8)
		db.session.add(newuser9)
		db.session.add(newuser10)
		db.session.add(newuser11)
		db.session.add(newuser12)
		db.session.add(newuser13)
		db.session.add(newuser14)
		db.session.add(newuser15)
		db.session.add(newuser16)
		db.session.add(newuser17)
		db.session.add(newuser18)
		db.session.add(newuser19)
		db.session.add(newuser20)
		
		db.session.commit()
		
	def loadAdmin(self):
		admin1 = u('notwella@me.com','anotwell','login','Alex Notwell','5174031662')
		db.session.add(admin1)
		db.session.commit()
		levels = ['basic', 'admin', 'staff']
		for user in u.query.all():
			new_admin = a(random.randrange(0, 3), user.id)
			db.session.add(new_admin)
			db.session.commit()
	
	def loadBilling(self):
		now = datetime.now
		time = now().strftime("%Y-%m-%d %H:%M")
		selected_user = ''
		for user in u.query.all():
			if user.email=='notwella@me.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '123 Neil Avenue', '', 'Columbus', 'OH', '43201', 'United States')
		db.session.add(addr1)
		db.session.commit()
		
		addr2 = ua(selected_user.id, selected_user.name, '2046 Bedford Road', '', 'Columbus', 'OH', '43212', 'United States')
		db.session.add(addr2)
		db.session.commit()
		
		addr3 = ua(selected_user.id, selected_user.name, '1800 King Avenue', '', 'Columbus', 'OH', '43212', 'United States')
		db.session.add(addr3)
		db.session.commit()
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		billing2 = b('Creditcard', selected_user.id)
		db.session.add(billing2)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4321543265437654, 123, time)
		db.session.add(cc1)
		db.session.commit()
		
		cc2 = cc(selected_user.name, addr2.id, billing2.id, 4321543265437654, 123, time)
		db.session.add(cc2)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='mbasta@gmail.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '1700 Essex Road', '', 'Columbus', 'OH', '43221', 'United States')
		db.session.add(addr1)
		db.session.commit()
		
		addr2 = ua(selected_user.id, selected_user.name, '203 3rd Avenue', 'Apt. 101', 'Columbus', 'OH', '43201', 'United States')
		db.session.add(addr2)
		db.session.commit()
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4321543265438765, 354, time)
		db.session.add(cc1)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='nbritt@hotmail.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '1710 Essex Road', '', 'Columbus', 'OH', '43221', 'United States')
		db.session.add(addr1)
		db.session.commit()
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 6784543265438765, 957, time)
		db.session.add(cc1)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='fmcray@hotmail.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '1801 Guilford Road', '', 'Columbus', 'OH', '43221', 'United States')
		db.session.add(addr1)
		db.session.commit()
		
		addr2 = ua(selected_user.id, selected_user.name, '2403 Main Street', '', 'Columbus', 'OH', '43200', 'United States')
		db.session.add(addr2)
		db.session.commit()
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4321565245438765, 186, time)
		db.session.add(cc1)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='lyadao@gmail.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '1325 Tremont Road', '', 'Columbus', 'OH', '43212', 'United States')
		db.session.add(addr1)
		db.session.commit()
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		billing2 = b('Giftcard', selected_user.id)
		db.session.add(billing2)
		db.session.commit()
		
		billing3 = b('Giftcard', selected_user.id)
		db.session.add(billing3)
		db.session.commit()
		
		billing4 = b('Giftcard', selected_user.id)
		db.session.add(billing4)
		db.session.commit()
		
		billing5 = b('Giftcard', selected_user.id)
		db.session.add(billing5)
		db.session.commit()
		
		billing6 = b('Giftcard', selected_user.id)
		db.session.add(billing6)
		db.session.commit()
		
		billing7 = b('Giftcard', selected_user.id)
		db.session.add(billing7)
		db.session.commit()
		
		billing8 = b('Giftcard', selected_user.id)
		db.session.add(billing8)
		db.session.commit()
		
		billing9 = b('Giftcard', selected_user.id)
		db.session.add(billing9)
		db.session.commit()
		
		billing10 = b('Giftcard', selected_user.id)
		db.session.add(billing10)
		db.session.commit()
		
		billing11 = b('Giftcard', selected_user.id)
		db.session.add(billing11)
		db.session.commit()
		
		billing12 = b('Giftcard', selected_user.id)
		db.session.add(billing12)
		db.session.commit()
		
		billing13 = b('Giftcard', selected_user.id)
		db.session.add(billing13)
		db.session.commit()
		
		billing14 = b('Giftcard', selected_user.id)
		db.session.add(billing14)
		db.session.commit()
		
		billing15 = b('Giftcard', selected_user.id)
		db.session.add(billing15)
		db.session.commit()
		
		billing16 = b('Giftcard', selected_user.id)
		db.session.add(billing16)
		db.session.commit()
		
		billing17 = b('Giftcard', selected_user.id)
		db.session.add(billing17)
		db.session.commit()
		
		billing18 = b('Giftcard', selected_user.id)
		db.session.add(billing18)
		db.session.commit()
		
		billing19 = b('Giftcard', selected_user.id)
		db.session.add(billing19)
		db.session.commit()
		
		billing20 = b('Giftcard', selected_user.id)
		db.session.add(billing20)
		db.session.commit()
		
		billing21 = b('Giftcard', selected_user.id)
		db.session.add(billing21)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4339565245438765, 208, time)
		db.session.add(cc1)
		db.session.commit()
		
		gc2 = gc(billing2.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc2)
		db.session.commit()
		
		gc3 = gc(billing3.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc3)
		db.session.commit()
		
		gc4 = gc(billing4.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc4)
		db.session.commit()
		
		gc5 = gc(billing5.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc5)
		db.session.commit()
		
		gc6 = gc(billing6.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc6)
		db.session.commit()
		
		gc7 = gc(billing7.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc7)
		db.session.commit()
		
		gc8 = gc(billing8.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc8)
		db.session.commit()
		
		gc9 = gc(billing9.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc9)
		db.session.commit()
		
		gc10 = gc(billing10.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc10)
		db.session.commit()
		
		gc11 = gc(billing11.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc11)
		db.session.commit()
		
		gc12 = gc(billing12.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc12)
		db.session.commit()
		
		gc13 = gc(billing13.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc13)
		db.session.commit()
		
		gc14 = gc(billing14.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc14)
		db.session.commit()
		
		gc15 = gc(billing15.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc15)
		db.session.commit()
		
		gc16 = gc(billing16.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc16)
		db.session.commit()
		
		gc17 = gc(billing17.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc17)
		db.session.commit()
		
		gc18 = gc(billing18.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc18)
		db.session.commit()
		
		gc19 = gc(billing19.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc19)
		db.session.commit()
		
		gc20 = gc(billing20.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc20)
		db.session.commit()
		
		gc21 = gc(billing21.id, random.randrange(100000000000000000000000,999999999999999999999999), random.randrange(1000, 9999))
		db.session.add(gc21)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='tsyed@yahoo.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '212 Running Farm Lane', 'Apt. 101', 'Palo Alto', 'CA', '97802', 'United States')
		db.session.add(addr1)
		db.session.commit()
		
		addr2 = ua(selected_user.id, selected_user.name, '2934 Coventry Road', '', 'Columbus', 'OH', '43212', 'United States')
		db.session.add(addr2)
		db.session.commit()
		
		addr3 = ua(selected_user.id, selected_user.name, '4234 West Devon Road', '', 'Columbus', 'OH', '43212', 'United States')
		db.session.add(addr3)
		db.session.commit()
		
		addr4 = ua(selected_user.id, selected_user.name, '383 Ashdowne Road', '', 'Columbus', 'OH', '43212', 'United States')
		db.session.add(addr4)
		db.session.commit()
		
		addr5 = ua(selected_user.id, selected_user.name, '2383 Arlington Avenue', '', 'Columbus', 'OH', '43212', 'United States')
		db.session.add(addr5)
		db.session.commit()
		
		addr6 = ua(selected_user.id, selected_user.name, '1283 Club Road', '', 'Columbus', 'OH', '42122', 'United States')
		db.session.add(addr6)
		db.session.commit()
		
		addr7 = ua(selected_user.id, selected_user.name, '1282 Cardiff Road', '', 'Columbus', 'OH', '43211', 'United States')
		db.session.add(addr7)
		db.session.commit()
		
		addr8 = ua(selected_user.id, selected_user.name, '2398 Lane Avenue', '', 'Columbus', 'OH', '43222', 'United States')
		db.session.add(addr8)
		db.session.commit()
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		billing2 = b('Creditcard', selected_user.id)
		db.session.add(billing2)
		db.session.commit()
		
		billing3 = b('Creditcard', selected_user.id)
		db.session.add(billing3)
		db.session.commit()
		
		billing4 = b('Creditcard', selected_user.id)
		db.session.add(billing4)
		db.session.commit()
		
		billing5 = b('Creditcard', selected_user.id)
		db.session.add(billing5)
		db.session.commit()
		
		billing6 = b('Creditcard', selected_user.id)
		db.session.add(billing6)
		db.session.commit()
		
		billing7 = b('Creditcard', selected_user.id)
		db.session.add(billing7)
		db.session.commit()
		
		billing8 = b('Creditcard', selected_user.id)
		db.session.add(billing8)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4321565245448596, 903, time)
		db.session.add(cc1)
		db.session.commit()
		
		cc2 = cc(selected_user.name, addr2.id, billing2.id, 4321565245448596, 903, time)
		db.session.add(cc2)
		db.session.commit()
		
		cc3 = cc(selected_user.name, addr3.id, billing3.id, 4321565245448596, 903, time)
		db.session.add(cc3)
		db.session.commit()
		
		cc4 = cc(selected_user.name, addr4.id, billing4.id, 4321565245448596, 903, time)
		db.session.add(cc4)
		db.session.commit()
		
		cc5 = cc(selected_user.name, addr5.id, billing5.id, 4321565245448596, 903, time)
		db.session.add(cc5)
		db.session.commit()
		
		cc6 = cc(selected_user.name, addr6.id, billing6.id, 4321565245448596, 903, time)
		db.session.add(cc6)
		db.session.commit()
		
		cc7 = cc(selected_user.name, addr7.id, billing7.id, 4321565245448596, 903, time)
		db.session.add(cc7)
		db.session.commit()
		
		cc8 = cc(selected_user.name, addr8.id, billing8.id, 4321565245448596, 903, time)
		db.session.add(cc8)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='dsaul@yahoo.com':
				selected_user = user
		
		billing1 = b('Giftcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		billing2 = b('Giftcard', selected_user.id)
		db.session.add(billing2)
		db.session.commit()
		
		billing3 = b('Giftcard', selected_user.id)
		db.session.add(billing3)
		db.session.commit()
		
		billing4 = b('Giftcard', selected_user.id)
		db.session.add(billing4)
		db.session.commit()
		
		billing5 = b('Giftcard', selected_user.id)
		db.session.add(billing5)
		db.session.commit()
		
		billing6 = b('Giftcard', selected_user.id)
		db.session.add(billing6)
		db.session.commit()
		
		gc1 = gc(billing1.id, 987629374321565245448596, 2222)
		db.session.add(gc1)
		db.session.commit()
		
		gc2 = gc(billing2.id, 987629374321565245484756, 2348)
		db.session.add(gc2)
		db.session.commit()
		
		gc3 = gc(billing3.id, 987629374534523423423423, 9383)
		db.session.add(gc3)
		db.session.commit()
		
		gc4 = gc(billing4.id, 987629374321565234234354, 7821)
		db.session.add(gc4)
		db.session.commit()
		
		gc5 = gc(billing5.id, 987629374321565249273546, 2917)
		db.session.add(gc5)
		db.session.commit()
		
		gc6 = gc(billing6.id, 987629374321565245863524, 8734)
		db.session.add(gc6)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='khelt@gmail.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '212 Farm Lane', '', 'Palo Alto', 'CA', '97802', 'United States')
		db.session.add(addr1)
		db.session.commit()
		
		addr2 = ua(selected_user.id, selected_user.name, '213 Farm Lane', '', 'Palo Alto', 'CA', '97802', 'United States')
		db.session.add(addr2)
		db.session.commit()
		
		addr3 = ua(selected_user.id, selected_user.name, '214 Farm Lane', '', 'Palo Alto', 'CA', '97802', 'United States')
		db.session.add(addr3)
		db.session.commit()
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		billing2 = b('Creditcard', selected_user.id)
		db.session.add(billing2)
		db.session.commit()
		
		billing3 = b('Creditcard', selected_user.id)
		db.session.add(billing3)
		db.session.commit()
		
		billing4 = b('Creditcard', selected_user.id)
		db.session.add(billing4)
		db.session.commit()
		
		billing5 = b('Creditcard', selected_user.id)
		db.session.add(billing5)
		db.session.commit()
		
		billing6 = b('Creditcard', selected_user.id)
		db.session.add(billing6)
		db.session.commit()
		
		billing7 = b('Giftcard', selected_user.id)
		db.session.add(billing7)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4321565245448596, 903, time)
		db.session.add(cc1)
		db.session.commit()
		
		cc2 = cc(selected_user.name, addr2.id, billing2.id, 4321565245448596, 903, time)
		db.session.add(cc2)
		db.session.commit()
		
		cc3 = cc(selected_user.name, addr3.id, billing3.id, 4321565245448596, 903, time)
		db.session.add(cc3)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing4.id, 4321565245645643, 234, time)
		db.session.add(cc1)
		db.session.commit()
		
		cc2 = cc(selected_user.name, addr2.id, billing5.id, 4321565245645643, 234, time)
		db.session.add(cc2)
		db.session.commit()
		
		cc3 = cc(selected_user.name, addr3.id, billing6.id, 4321565245645643, 234, time)
		db.session.add(cc3)
		db.session.commit()
		
		gc6 = gc(billing7.id, 847586974321565234234354, 5687)
		db.session.add(gc6)
		db.session.commit()

	def loadCarts(self):
		for user in u.query.all():
			new_cart = c(user.id, 'Open')
			db.session.add(new_cart)
			db.session.commit()
			book_id = 0
			for book in b.query.all():
				prev = book_id
				book_id = book.id
				if random.randrange(0,2)==0:
					book_id = prev
			
			new_item = ci(new_cart.id, book_id, random.randrange(1, 5), 'OK')
			db.session.add(new_item)
			#db.session.add(new_cart)
			#db.session.add(new_item)
			db.session.commit()

	def loadOrders(self):
		for cart in c.query.all():
			new_order = o(cart.user_id, cart.id, 0, 0, 'Shipped')
			db.session.add(new_order)
			db.session.commit()
			for cart_item in ci.query.all():
				if cart_item.cart_id==cart.id:
					cost = 0
					for bo in Book.query.all():
						print '***', bo.id, cart_item.book_id, bo.price
						if bo.id==cart_item.book_id:
							cost = float(bo.price)

					new_order_item = oi(new_order.id, cart_item.book_id, cart_item.quantity, cost, float(cost) + 1, 'OK')
					new_order.shipping = 5
					db.session.add(new_order)
					db.session.commit()
					new_order.tax = .07 * float(new_order_item.price) * new_order_item.quantity
					db.session.add(new_order_item)
					db.session.commit()

		
					billing_id = None
					for billing in b.query.all():
						if billing.user_id == cart.user_id:
							billing_id = billing.id

					subtotal = float(new_order_item.price) * new_order_item.quantity + float(new_order.tax) + float(new_order.shipping)
					new_order_payment = op(new_order_item.id, billing_id, subtotal)
					db.session.add(new_order_payment)
					db.session.commit()
			db.session.add(new_order)
	
			

			db.session.commit()


		

if __name__=='__main__':
	loader = UserLoader()
	loader.load()
	loader.loadAdmin()
	loader.loadBilling()
	loader.loadCarts()
	loader.loadOrders()
