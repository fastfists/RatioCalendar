from flask import Flask, render_template
from flask_socketio import SocketIO


app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'

socketio = SocketIO(app)

@socketio.on('event')
def handle_message(json):

    print(' < --- received message --- > ')
    print(message)

if __name__ == '__main__':
    socketio.run(app)
