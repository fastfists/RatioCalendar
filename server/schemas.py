from ext import ma
from models import User, Event
from marshmallow import fields

class UserScehma(ma.ModelSchema):
    class Meta:
        model = User
        exclude = ["id"]

class EventSchema(ma.ModelSchema):
    class Meta:
        model = Event
        exclude = ["id"]

class UserEventsSchema(ma.Schema):

    user = fields.Nested(UserScehma)
    events = fields.Nested(EventSchema, many=True)

