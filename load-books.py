from bitslib.models import (Book as b, Author as a, Book_Author as ba,
        Publisher as p, Category as c, Book_Category as bc)
from bitslib.models import Inventory as i
from web import db
import csv
from datetime import datetime
import random


class BookLoader():
    def load(self):
        now = datetime.now
        bookcsv = csv.reader(open('project_data.csv', 'rb'), delimiter=',')

        booklist = []
        for entry in bookcsv:
            booklist.append(entry)

        # Discard column headers
        booklist.pop(0)
        booklist.pop(0)

        cities = ['Detroit', 'Seattle', 'Chicago', 'New York', 'Palo Alto']
        states = {}
        states[cities[0]] = 'MI'
        states[cities[1]] = 'WA'
        states[cities[2]] = 'IL'
        states[cities[3]] = 'NY'
        states[cities[4]] = 'CA'
        est_date = now().strftime("%Y-%m-%d %H:%M")
        b_date = est_date

        previous_book = -1
        for bookentry in booklist:
            author = bookentry[2]
            publisher = bookentry[3]
            category = bookentry[6]
            city = cities[random.randrange(0, len(cities))]
            new_publisher = p(publisher, city, states[city], 'United States',
                    est_date)
            new_author = a(author, b_date)

            # Create new publisher if necessary
            create_pub = True
            for pub in p.query.all():
                if pub.name == publisher:
                    create_pub = False
            if create_pub:
                db.session.add(new_publisher)
                db.session.commit()

            # Create new author if necessary
            create_author = True
            for auth in a.query.all():
                if auth.name == author:
                    create_author = False
            if create_author:
                db.session.add(new_author)
                db.session.commit()

            # Create new category if necessary
            create_cat = True
            for cat in c.query.all():
                if cat.name == category:
                    create_cat = False
            if create_cat:
                new_category = c(category)
                db.session.add(new_category)
                db.session.commit()

            # Find category id for this book
            cat_id = -1
            for cat in c.query.all():
                if cat.name == category:
                    cat_id = cat.id

            # Find publisher id for this book
            pub_id = -1
            for pub in p.query.all():
                if pub.name == publisher:
                    pub_id = pub.id

            # If this entry is a new book
            if len(bookentry[0]) > 0:
                isbn = bookentry[0]
                title = bookentry[1]
                price = bookentry[5][1:]
                new_book = b(isbn, title, float(price), pub_id)
                db.session.add(new_book)
                db.session.commit()

                # Create inventory
                new_inventory = i(new_book.id, random.randrange(1, 100),
                        'OK')
                db.session.add(new_inventory)
                db.session.commit()

            # find the author id
                auth_id = -1
                for auth in a.query.all():
                    if auth.name.strip() == author.strip():
                        auth_id = auth.id

            if len(bookentry[0]) > 0:
                # Add book_category and book_author
                for bo in b.query.all():
                    if bo.title == bookentry[1]:
                        previous_book = bo.id
                ba_stmnt = ba.insert().values(book_id=previous_book,
                        author_id=auth_id, date_created=est_date,
                        date_modified=est_date)
                bc_stmnt = bc.insert().values(book_id=previous_book,
                        category_id=cat_id, date_created=est_date,
                        date_modified=est_date)
                db.engine.execute(ba_stmnt)
                db.engine.execute(bc_stmnt)
                db.session.commit()

if __name__ == '__main__':
    loader = BookLoader()
    loader.load()
