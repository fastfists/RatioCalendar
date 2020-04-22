from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_bcrypt import Bcrypt
from flask_marshmallow import Marshmallow

migrate = Migrate()
db = SQLAlchemy()
ma = Marshmallow()
bcrypt = Bcrypt()
