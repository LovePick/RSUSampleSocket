var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

app.get('/', function (req, res) {
    res.sendFile(__dirname + '/index.html');
});

io.on('connect',
    function (socket) {
        console.log('a user connected');
        socket.broadcast.emit('ready connected to server');

        /*
        socket.on('chat message', function (msg) {
            console.log('message: ' + msg);
            io.emit('chat message', msg);
        });
*/

        socket.on('train001', function (msg) {
            console.log(msg);
            io.emit(msg);

        });
    }
);

http.listen(3000, function () {
    console.log('listening on *:3000');
}
);