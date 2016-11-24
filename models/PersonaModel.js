var connection = require('../config/database.js');
//var io=require('../app.js')

//io.io.sockets.on('connection', function (socket) {
//    connection.query('select * from tipo_documento', function (err, rs, field) {
//        if (err) { connection.end(); return; }
//        socket.emit('tipo_documento', rs);
//    });
//});
module.exports = {

    //obtener todos los usuarios    
    getUsers: function (callback) {
        
        if (connection) {
            connection.query('SELECT * FROM persona ORDER BY id_persona', function (error, rows) {
                if (error) {
                    console.log(error);
                    throw error;
                }
                else {
                    callback(null, rows);
                }
            });
        }
    },

    //añadir un nuevo usuario
    insertUser : function (personaData, callback) {
        if (connection) {
            
            connection.query('INSERT INTO persona SET ?', personaData, function (error, result) {
                if (error) {
                    throw error;
                }
                else {
                    callback('index_persona.jade', { personas: result });
                }
            });
        }
    },

    //obtener un usuario especifico
    getSingleUser: function (persona_id, callback) {
        if (connection)
        {
            var sql = 'select * from persona where id_persona= ' + persona_id;
            connection.query(sql,
                function (error, result)
                {
                    if (error) {
                        throw error;
                    } else
                    {                        
                        callback(null, result );
                    }
                });
        }
    },
    updatePersona: function (personaData, callback)
    {
        var sql = 'update persona set nombres= ' + connection.escape(personaData.nombres) + ', apellidos= ' + connection.escape(personaData.apellidos) +
            ', direccion= ' + connection.escape(personaData.direccion) + ', telefono1= ' + personaData.telefono1 + ', telefono2= ' + personaData.telefono2 + ', correo= ' + connection.escape(personaData.correo) +
            ' where id_persona= ' + personaData.id_persona;
        console.log(sql);
        if (connection)
        {
            connection.query(sql, function (error, result) {
                if (error) {
                    throw error;
                } else
                {
                    callback(null, result);
                }
            });

        }
    }
};

