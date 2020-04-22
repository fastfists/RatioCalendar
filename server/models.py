from datetime import datetime
from sqlalchemy.orm import relationship
from ext import db

class User(db.Model):

    id = db.Column(db.Integer, primary_key=True)

    username = db.Column(db.String)
    slug = db.Column(db.String)
    email = db.Column(db.String)
    password = db.Column(db.String(256))

    events = relationship("Event", backref="user")

class Event(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.Text, nullable=True)
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return f"<Event {self.name}> {date}"
