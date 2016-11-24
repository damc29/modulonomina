var UserModel = require('../models/UsuarioModel');

module.exports = {
    home: function (req, res, next) {
        UserModel.getUsuario(function (error, data) {
            res.render('usuario_index', { usuarios: data });
        });
    },
    add: function (req, res, next) {
        res.render('usuario_add');

    },
    edit: function (req, res, next) {
        var codigo = req.params.id_persona;
        console.log('El codigo es: ' + codigo);
        UserModel.getSingleUsuario(codigo, function (error, data) {
            if (typeof data !== 'undefined' && data.length > 0) {
                res.render("usuario_edit",
                    {
                        usuarios: data
                    });
            }
        });
    },
    save_edit: function (req, res, next) {

        var usuarioData = {
            id_persona: req.params.id_persona,
            usuario: req.body.usuario,
            contrasena: req.body.contrasena,
            rol: req.body.rol,
            fecha_creacion: req.body.fecha_creacion
        };
        UserModel.updateUsuario(usuarioData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.redirect('/usuario');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
        });

    },
    guardar: function (req, res, next) {

        var usuarioData = {
            id_persona: req.params.id_persona,
            usuario: req.body.usuario,
            contrasena: req.body.contrasena,
            rol: req.body.rol,
            fecha_creacion: req.body.fecha_creacion
        };
        UserModel.insertUsuario(usuarioData, function (error, data) {
            //            //si la persona se ha insertado correctamente mostramos su info
            console.log(data);
            if (typeof data !== 'undefined') {
                res.redirect('/usuario');
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
        var id_persona = req.params.id;
      
        UserModel.getSingleServicio(id_persona, function (error, data) {
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
