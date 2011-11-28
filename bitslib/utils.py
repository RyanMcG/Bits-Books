from flask import Markup


def debug_str(print_me):
    """Prints out an HTML escaped string in code and pre tags."""
    return """<code class="debug-str"><pre>{0}</pre></code>""".format(
            Markup.escape(str(print_me)))
