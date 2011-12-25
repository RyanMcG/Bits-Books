from flask import Markup
import hashlib
import string
import random


def debug_str(print_me):
    """Prints out an HTML escaped string in code and pre tags."""
    if isinstance(print_me, (list, tuple)):
        print_me = "\n".join([str(x) for x in print_me])
    if isinstance(print_me, dict):
        print_me = "{\n\t"
        + "\n\t".join([str(x) + ": " + str(y) for x, y in print_me.items()])
        + "\n}"
    escaped = Markup.escape(str(print_me))
    return """<code class="debug-str"><pre>{0}</pre></code>""".format(escaped)


def str_to_digits(wannabe_number):
    """Returns an integer version of the given string or int by removing all
    non-digit characters."""
    if isinstance(wannabe_number, int):
        return wannabe_number
    else:
        ret = ''.join(filter(lambda x: x.isdigit(), str(wannabe_number)))
        return int(ret) if ret != '' else None


def generate_encrypted_password(password):
    """Encrypts the password by hashing it with a random salt."""
    salt = generate_salt()
    hash = hashlib.sha1()
    hash.update(salt + password)
    password = salt + "$" + hash.hexdigest()
    return password


def generate_salt(length=8):
    """Generates a random string of the given length to be used as a salt."""
    return "".join(random.sample(string.letters + string.digits, length))
