import { SocketIO } from 'nativescript-socketio';

var socketIO;

export function init() {
    
    let url = "http://cd7bbc2d.ngrok.io";
    socketIO = new SocketIO(url, {});

    socketIO.connect();

    socketIO.on('connect', () => {
        socketIO.emit("event", { vfaar : "test"});
    });
}


