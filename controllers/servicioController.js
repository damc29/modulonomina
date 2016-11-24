var UserModel = require('../models/ServicioModel');

module.exports = {
    home: function (req, res, next) {
        UserModel.getServicio(function (error, data) {
            res.render('servicio_index', { servicio: data });
        });
    },
    add: function (req, res, next) {
        res.render('servicio_add');

    },
    edit: function (req, res, next) {
        var codigo = req.params.id;
        console.log('El codigo es: '+ codigo);
        UserModel.getSingleServicio(codigo, function (error, data) {
            if (typeof data !== 'undefined' && data.length > 0) {
                res.render("servicio_edit",
                    {
                        servicio: data
                    });
            }
        });
    },
    save_edit: function (req, res, next) {

        var servicioData = {
            codigo: req.params.id,
            nombre: req.body.nombre,
            estado:req.body.estado,
            descripcion: req.body.descripcion
        };
        UserModel.updateServicio(servicioData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.redirect('/servicio');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
        });

    },
    guardar: function (req, res, next) {

        var servicioData = {
            codigo: null,
            nombre: req.body.nombre,
            estado: req.body.estado,
            descripcion: req.body.descripcion
        };
        UserModel.insertServicio(servicioData, function (error, data) {
            //            //si la persona se ha insertado correctamente mostramos su info
            console.log(data);
            if (typeof data !== 'undefined') {
                res.redirect('/servicio');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
        });
    },
    //Metodos para la API REST
    listar: function (req, res, next) {
        UserModel.getServicio(function (error, data)
        {
            res.status(200)
            .json({
                status: 'success',
                servicio: data,
                message: 'Retrieved ALL Usuario'
            });            
        });
    },
    consultar: function (req, res, next)
    {
        var codigo = req.params.id;
      
        UserModel.getSingleServicio(codigo, function (error, data) {
            if (typeof data !== 'undefined' && data.length > 0) {
                res.status(200)
                .json({
                    status: 'success',
                    servicio: data,
                    message: 'Inserted one Usuario'
                });
            }
        });        
    },
    crear: function (req, res, next) {
        var servicioData = {
            codigo: null,
            nombre: req.body.nombre,
            estado: req.body.estado,
            descripcion: req.body.descripcion
        };
        UserModel.insertServicio(servicioData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.status(200)
                .json({
                    status: 'success',
                    servicio: data,
                    message: 'Inserted one Usuario'
                });
            }
            else {
                return next(error);
            }
        });
    },
    editar: function (req, res, next) {
        
        var servicioData = {
            codigo: req.params.id,
            nombre: req.body.nombre,
            estado:req.body.estado,
            descripcion: req.body.descripcion
        };
        UserModel.updateServicio(servicioData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.status(200)
                .json({
                    status: 'success',
                    servicio: data,
                    message: 'Inserted one Usuario'
                });
            }
            else {
                return next(error);
            }
        });
    }
};
