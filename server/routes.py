from flask import Blueprint, request
from .schemas import *

api = Blueprint(__name__, 'api')


@api.route('/api/events/')
def getEvent():
    """
        Get Event By user
    """

    schema = UserScehma(many=false)
    body = schema.load(request.json)
