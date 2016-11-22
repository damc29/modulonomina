
var connection = require('../config/database.js');

module.exports = {
    getOrganizacion: function (callback) {
        if (connection) {
            connection.query('SELECT * FROM organizacion ORDER BY id_organizacion', function (error, rows) {
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
    insertOrganizacion: function (organizacionData, callback) {
        if (connection) {
            connection.query('INSERT INTO organizacion SET ?', organizacionData, function (error, result) {
                if (error) {
                    throw error;
                }
                else {
                    callback('organizacion_index.jade', { organizacion: result });
                }
            });
        }
    },

    editOrganizacion: function (organizacion_id, callback) {
        if (connection) {
            var sql = 'select * from organizacion where id_organizacion= ' + organizacion_id;
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
    updateOrganizacion: function (organizacionData, callback) {
        var sql = 'update organizacion set nombre= ' + connection.escape(organizacionData.nombre) + ', direccion= ' + connection.escape(organizacionData.direccion) +
            ', telefono= ' + connection.escape(organizacionData.telefono) + ', correo= ' + connection.escape(organizacionData.correo) +
            ' where id_organizacion= ' + organizacionData.id_organizacion;
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

