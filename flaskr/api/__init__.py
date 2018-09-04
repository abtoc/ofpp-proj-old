from flaskr import app

from flaskr.api import idm
app.register_blueprint(idm.bp)
