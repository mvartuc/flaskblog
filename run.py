import os
from flaskblog import create_app
from livereload import Server

app = create_app()

app.debug = True


@app.shell_context_processor
def make_shell_context():
    return {}

if __name__ == "__main__":
    # Uncomment line below and delete the livereload related code on production
    app.run(debug=True)

