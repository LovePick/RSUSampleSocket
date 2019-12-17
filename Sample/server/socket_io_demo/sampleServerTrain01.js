var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

app.get('/', function (req, res) {
    res.sendFile(__dirname + '/sampleListeningTrain01.html');
});

app.get('/hello', function (req, res) {
    res.send('Hello World!!!')
});

var i = 0

io.on('connect',
    function (socket) {
        console.log('a user connected');
        //socket.broadcast.emit('ready connected to server');


        socket.on('chat message', function (msg) {
            console.log('message: ' + msg);
            io.emit('chat message', msg);
        });


        socket.on('train01', function (msg) {
            console.log('message: ' + msg);
            //io.emit('train01', msg);

        });


        /// test loop echo data
        setTimeout(function run() {
            i += 1;

            //io.emit('train01', trainSampleData());
            io.emit('train01', 'hello');

            setTimeout(run, 5000);
        }, 1000);
        ///////

    }
);

http.listen(3000, function () {
    console.log('listening on *:3000');
}
);


function trainSampleData() {
    return {
        id: "T01",
        name: "Train01",
        from: "D07",
        strDepartTime: "28-11-2019 15:36:10",
        to: "B01-A",
        strArriveTime: "28-11-2019 15:46:10",
        startStation: "สถานีต้นทาง",
        endStation: "สถานีปลายทาง",
        status: 1,
        crowdStatus: 0,
        timeTableID: "tb01",
        dewellTime: "45",
        speed: "1",
        direction: 0,
        timeStamp: Math.floor(Date.now() / 1000)
    };
}