var UserModel = require('../models/OrganizacionModel');

module.exports = {
    home: function (req, res, next) {
        UserModel.getOrganizacion(function (error, data) {
            res.render('organizacion_index', { organizacion: data });
        });
    },
    add: function (req, res, next) {
        res.render('organizacion_add');

    },
    edit: function (req, res, next) {
        var id_organizacion = req.params.id;

        UserModel.editOrganizacion(id_organizacion, function (error, data) {
            if (typeof data !== 'undefined' && data.length > 0) {
                res.render("organizacion_edit",
                    {
                        organizacion: data
                    });
            }
        });
    },
    save_edit: function (req, res, next) {

        var organizacionData = {
            id_organizacion: req.params.id,
            nombre: req.body.nombre,           
            direccion: req.body.direccion,
            telefono: req.body.telefono,            
            correo: req.body.correo
        };
        UserModel.updateOrganizacion(organizacionData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.redirect('/organizacion');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
        });

    },
    guardar: function (req, res, next) {

        var organizacionData = {
            id_organizacion: req.body.id,
            nombre: req.body.nombre,
            direccion: req.body.direccion,
            telefono: req.body.telefono,
            correo: req.body.correo
        };
        UserModel.insertOrganizacion(organizacionData, function (error, data) {
            //            //si la persona se ha insertado correctamente mostramos su info
            //console.log(data);
            if (typeof data !== 'undefined') {
                res.redirect('/organizacion');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
        });
    }
};