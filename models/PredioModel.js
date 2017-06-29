var connection = require('../config/database.js');
module.exports = {
    getPredio: function (callback) {
        if (connection) {
            connection.query('SELECT * FROM predio ORDER BY codigo_predio', function (error, rows) {
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
    insertPredio: function (predioData, callback) {
        if (connection) {
            connection.query('INSERT INTO predio SET ?', predioData, function (error, result) {
                if (error) {
                    throw error;
                }
                else {
                    callback('predio_index.jade', { predio: result });
                }
            });
        }
    },

    getSinglePredio: function (predio_codigo, callback) {
        if (connection) {
            var sql = 'select * from predio where codigo_predio= ' + predio_codigo;
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