from datetime import datetime
from sqlalchemy.orm import relationship
from ext import db

class User(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    events = relationship("Event", backref="user")

class Event(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.Text, nullable=True)
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return f"<Event {self.name}> {date}"
