var UserModel = require('../models/PredioModel');

module.exports = {
    home: function (req, res, next) {
        UserModel.getPredio(function (error, data) {
            res.render('predio_index', { predios: data });
        });
    },
    add: function (req, res, next) {
        res.render('predio_add');

    },
    edit: function (req, res, next) {
        var codigo = req.params.id;
        console.log('El codigo es: '+ codigo);
        UserModel.getSinglePredio(codigo, function (error, data) {
            if (typeof data !== 'undefined' && data.length > 0) {
                res.render("predio_edit",
                    {
                        predio: data
                    });
            }
        });
    },
    save_edit: function (req, res, next) {

        var predioData = {
            codigo: req.params.id,
            nombre: req.body.nombre,
            estado:req.body.estado,
            descripcion: req.body.descripcion
        };
        UserModel.updatePredio(predioData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.redirect('/servicio');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
        });

    },
    guardar: function (req, res, next) {

        var predioData = {
            codigo: null,
            nombre: req.body.nombre,
            estado: req.body.estado,
            descripcion: req.body.descripcion
        };
        UserModel.insertServicio(predioData, function (error, data) {
            //            //si la persona se ha insertado correctamente mostramos su info
            console.log(data);
            if (typeof data !== 'undefined') {
                res.redirect('/predio');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
        });
    }
};
