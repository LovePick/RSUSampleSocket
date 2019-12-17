var http = require('http');

//create a server object:
http.createServer(function (req, res) {

    var msg = {
        message: 'Hello World!',
        time: '2019-11-23 13:10:00'
    }




    var jsonStr = JSON.stringify(msg);
    res.write(jsonStr); //write a response to the client
    res.end(); //end the response
}).listen(8080); //the server object listens on port 8080