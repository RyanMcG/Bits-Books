from bitslib.models import InventoryOrder as io, Inventory as i, Book as b
from web import db

class InventoryOrderLoader():
	def load(self):
		for item in i.query.all():
			if item.quantity < 10:
				i.status = 'Ordered'
				new_cost = 0
				quant = 0
				for bo in b.query.all():
					if item.book_id == bo.id:
						new_cost = bo.price
						quant = item.quantity
				new_inventory_order = io(new_cost, 20, item.book_id, quant)
				db.session.add(new_inventory_order)
				db.session.commit() 

if __name__=='__main__':
	loader = InventoryOrderLoader()
	loader.load()