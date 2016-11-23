var mysql = require('mysql');

var connection = mysql.createConnection(
    {
        host: '127.0.0.1',
        user: 'root',
        password: '',
        database: 'bd_servicios_publicos'
    }
);

connection.connect();
module.exports = connection;

var io = require('../app.js')

io.io.sockets.on('connection', function (socket) {
    console.log('Evento disparado****');
    connection.query('select * from tipo_documento', function (err, rs, field) {
        if (err) { connection.end(); return; }
        socket.emit('tipo_documento', rs);
    });
});