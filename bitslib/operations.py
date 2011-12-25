from bitslib.models import Book, Author


def get_search_results(search, params=None):
    results = False
    if search:
        searchq = "%" + search + "%"
        books = Book.query.filter(Book.title.like(searchq)).all()
        authors = Author.query.filter(Author.name.like(searchq)).all()
        for a in authors:
            books.extend(a.Books)
        results = [(x.isbn, x.title, x.price) for x in books]
    return results
