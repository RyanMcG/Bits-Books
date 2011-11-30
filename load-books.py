from bitslib.models import Book as b, Author as a, Publisher as p
from web import db
import csv
import datetime as dt
bookcsv = csv.reader(open('project data.csv', 'rb'), delimiter=',')

booklist = []
for entry in bookcsv:
	bookdict.append(entry)

# Discard column headers
booklist.pop(0)
booklist.pop(0)

for bookentry in booklist:
	author = bookentry[2]
	publisher = bookentry[3]
	
	

