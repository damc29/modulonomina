var connection = require('../config/database.js');
module.exports = {
    getServicio: function (callback) {
        if (connection) {
            connection.query('SELECT * FROM servicio ORDER BY codigo', function (error, rows) {
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
    insertServicio: function (servicioData, callback) {
        if (connection) {
            connection.query('INSERT INTO servicio SET ?', servicioData, function (error, result) {
                if (error) {
                    throw error;
                }
                else {
                    callback('servicio_index.jade', { servicio: result });
                }
            });
        }
    },

    editServicio: function (servicio_codigo, callback) {
        if (connection) {
            var sql = 'select * from servicio where codigo= ' + servicio_codigo;
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
    updateServicio: function (servicioData, callback) {
        var sql = 'update servicio set nombre= ' + connection.escape(servicioData.nombre) + ', estado= ' + connection.escape(servicioData.estado) +
            ', descripcion= ' + connection.escape(servicioData.descripcion) + 
            ' where codigo= ' + servicioData.codigo;
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