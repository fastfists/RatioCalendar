from flask import Blueprint, request, jsonify
from slugify import slugify
from ext import bcrypt, db
from models import User, Event
from schemas import UserScehma, EventSchema, UserEventsSchema

api = Blueprint(__name__, 'api')

@api.route('/api/events/', methods=["GET","POST"])
def getEvent():
    """
        Get Event By user
        {
            slug: slug
            password: passwordhash
        }
    """
    
    body = request.json
    user = User.query.filter_by(slug=body["slug"]).first()
    
    if user.password == body["password"]:
        print("Correct Password returning events")
        return jsonify(EventSchema(many=True).dump(user.events))
    else:
        print("Wrong password sending error code")
        return jsonify({"error" : "Incorrect password"})

@api.route('/api/events/create', methods=["GET","POST"])
def createEvent():
    """
        {
            user: user,
            events: events
        }
    """

    schema = UserEventsSchema()
    body = schema.load(request.json)

    username = body.get("user").username
    user = User.query.filter_by(username=username).first_or_404()

    user.events.extend(body.get("events"))
    db.session.add(user)
    db.session.commit()

    return jsonify(EventSchema(many=True).dump(user.events))

@api.route('/api/user/create', methods=["GET","POST"])
def createUser():

    schema = UserScehma(partial=True)
    user = schema.load(request.json)

    if User.query.filter_by(username=user.username).first():
        return jsonify({ "error" : "Username already exists" }) 

    if User.query.filter_by(email=user.email).first():
        return jsonify({ "error" : "Email already exists" }) 
    
    user.slug = slugify(user.username)
    hashed_password = bcrypt.generate_password_hash(user.password).decode('utf-8')
    user.password = hashed_password

    db.session.add(user)
    db.session.commit()

    return jsonify(UserScehma().dump(user))


@api.route('/api/user/login', methods=["GET","POST"])
def login():
    """
    {
        user: {
            username
            password
        }
    }
    """
    schema = UserScehma()
    submission = schema.load(request.json)
    
    user = User.query.filter_by(username=submission.username).first()
    if user and bcrypt.check_password_hash(user.password, submission.password):
        return jsonify(schema.dump(user))
    else:
        return jsonify({"error" : "Invalid username or password" })

