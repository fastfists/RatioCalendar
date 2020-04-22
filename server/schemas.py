from ext import ma
from models import User, Event

class UserScehma(ma.ModelSchema):
    class Meta:
        model = User
        exclude = ["id"]

class EventScehma(ma.ModelSchema):
    class Meta:
        model = Event
        exclude = ["id"]
