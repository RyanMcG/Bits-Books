from model.models import Book, Author


class ModelHelper(object):
    """Helper class for running indepth database operations."""

    def __init__(self, app, db):
        self.app = app
        self.db = db
        self.log = app.logger

    def get_search_results(self, search, params=None):
        """Get results of a search with the given parameter."""
        #TODO: Make results a bit nicer
        #TODO: Make searching more user friendly (not case sensitive).
        results = False
        if search:
            searchq = "%" + search + "%"
            books = Book.query.filter(Book.title.like(searchq)).all()
            authors = Author.query.filter(Author.name.like(searchq)).all()
            for a in authors:
                books.extend(a.Books)
            results = [(x.isbn, x.title, x.price) for x in books]
            self.log.info("Ran search with argument: '%s';" % search +
                    " received %d" % len(results))
        else:
            self.log.warning("Attempted search with out string.")
        return results
