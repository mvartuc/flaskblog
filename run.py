import os
from flaskblog import create_app
from livereload import Server

app = create_app()

app.debug = True

# ------------------- Live reload ----------------------------------------------
all_css_files_path = os.path.join(app.static_folder, "*.css")
all_html_files_path = os.path.join(app.root_path, app.template_folder, "*.html")
# ------------------- Live reload End ------------------------------------------

@app.shell_context_processor
def make_shell_context():
    return {}

if __name__ == "__main__":
    # Uncomment line below and delete the livereload related code on production
    #app.run(debug=True)

    # ------------------- Live reload -------------------------
    server = Server(app.wsgi_app)
    # watch all .css files for change
    server.watch(all_css_files_path)
    # watch all .css files for change
    server.watch(all_html_files_path)
    server.serve()
    # ------------------- Live reload End ---------------------
    