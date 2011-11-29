from flask import Markup


def debug_str(print_me):
    """Prints out an HTML escaped string in code and pre tags."""
    if isinstance(print_me, (list, tuple)):
        print_me = "\n".join([str(x) for x in print_me])
    if isinstance(print_me, dict):
        print_me = "{\n\t" + "\n\t".join([str(x) + ": " + str(y) for x, y in
            print_me.items()]) + "\n}"
    return """<code class="debug-str"><pre>{0}</pre></code>""".format(
            Markup.escape(str(print_me)))


def generate_encrypted_password(password, user=None):
    return password


def generate_salt():
    return "skdjansU983j4398ns0d9"
