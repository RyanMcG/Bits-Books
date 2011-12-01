from bitslib.models import User as u, Creditcard as cc, Giftcard as gc, Billing as b, UserAddress as ua
from web import db
from datetime import datetime

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
		admin1 = u('notwella@me.com','anotwell','loging','Alex Notwell','5174031662')
		db.session.add(admin1)
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
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4321543265437654, 123, time)
		db.session.add(cc1)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='mbasta@gmail.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '1700 Essex Road', '', 'Columbus', 'OH', '43221', 'United States')
		db.session.add(addr1)
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
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4339565245438765, 208, time)
		db.session.add(cc1)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='tsyed@yahoo.com':
				selected_user = user
				
		addr1 = ua(selected_user.id, selected_user.name, '212 Running Farm Lane', 'Apt. 101', 'Palo Alto', 'CA', '97802', 'United States')
		db.session.add(addr1)
		db.session.commit()
		
		billing1 = b('Creditcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		cc1 = cc(selected_user.name, addr1.id, billing1.id, 4321565245448596, 903, time)
		db.session.add(cc1)
		db.session.commit()
		
		# --------------------------------------------------------------------------------
		selected_user = ''
		for user in u.query.all():
			if user.email=='dsaul@yahoo.com':
				selected_user = user
		
		billing1 = b('Giftcard', selected_user.id)
		db.session.add(billing1)
		db.session.commit()
		
		gc1 = gc(billing1.id, 987629374321565245448596, 2222)
		db.session.add(cc1)
		db.session.commit()
		
		

if __name__=='__main__':
	loader = UserLoader()
	loader.load()
	loader.loadAdmin()
	loader.loadBilling()
