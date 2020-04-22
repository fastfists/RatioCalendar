from flask import Flask
from routes import api
from models import Event

def create_app():

    from ext import db, migrate, bcrypt, ma

    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres://ixrcohfw:Sp1xwKt9WhCkVvK8yued3PoH_xloNkyK@drona.db.elephantsql.com:5432/ixrcohfw'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    app.register_blueprint(api)

    db.init_app(app)
    bcrypt.init_app(app)
    migrate.init_app(app, db)
    ma.init_app(app)

    return app

if __name__ == '__main__':

    create_app().run()
