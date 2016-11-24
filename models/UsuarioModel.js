var connection = require('../config/database.js');

module.exports = {
    getUsuario: function (callback) {
        if (connection) {
            connection.query('SELECT * FROM usuario ORDER BY id_persona', function (error, rows) {
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
    insertUsuario: function (usuarioData, callback) {
        if (connection) {
            connection.query('INSERT INTO usuario SET ?', usuarioData, function (error, result) {
                if (error) {
                    throw error;
                }
                else {
                    callback('usuario_index.jade', { usuario: result });
                }
            });
        }
    },

    getSingleUsuario: function (id_persona, callback) {
        if (connection) {
            var sql = 'select * from usuario where id_persona= ' + id_persona;
            connection.query(sql,
                function (error, result) {
                    if (error) {
                        throw error;
                    } else {
                        callback(null, result);
                    }
                });
        }
    },
    updateUsuario: function (usuarioData, callback) {
        var sql = 'update usuario set usuario= ' + connection.escape(usuarioData.usuario) + ', contrasena= ' + connection.escape(usuarioData.contrasena) +
            ', rol= ' + connection.escape(usuarioData.rol) +
            ' where id_persona= ' + usuarioData.id_persona;
        console.log(sql);
        if (connection) {
            connection.query(sql, function (error, result) {
                if (error) {
                    throw error;
                } else {
                    callback(null, result);
                }
            });
        }
    }
};