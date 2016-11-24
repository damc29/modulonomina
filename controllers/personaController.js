var UserModel = require('../models/PersonaModel');


module.exports = {
    home: function (req, res, next) {
        UserModel.getUsers(function (error, data)
        {
            res.render('index_persona', { personas: data });
        });
    },
    add: function (req, res, next)
    {
                
        res.render('persona_add');
    },
    edit: function (req, res, next)
    {
        var id_persona = req.params.id;
      
        UserModel.getSingleUser(id_persona, function (error, data) {
            if (typeof data !== 'undefined' && data.length > 0) {
                res.render("persona_edit",
                {                  
                    persona: data
                });
            }
        });        
    },
    save_edit: function (req, res, next) {
        
        var personaData = {
            id_persona: req.params.id,
            nombres: req.body.nombres,
            apellidos: req.body.apellidos,
            direccion: req.body.direccion,
            telefono1: req.body.telefono1,
            telefono2: req.body.telefono2,
            correo: req.body.correo
        };
        UserModel.updatePersona(personaData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.redirect('/persona');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
        });

    },
    guardar: function (req, res, next) {       
               
        var personaData = {
            id_persona: req.body.id,
            nombres: req.body.nombres,
            apellidos: req.body.apellidos,
            direccion: req.body.direccion,
            telefono1: req.body.telefono1,
            telefono2: req.body.telefono2,
            correo:req.body.correo
        };     
        UserModel.insertUser(personaData, function (error, data) {
            //            //si la persona se ha insertado correctamente mostramos su info
            console.log(data);
            if (typeof data !== 'undefined') {
                res.redirect('/persona');
            }
            else {
                res.json(500, { "msg": "Error" });
            }
       
        });        
        
    },
    //Metodos para la API REST
    listar: function (req, res, next) {
        UserModel.getUsers(function (error, data)
        {
            res.status(200)
            .json({
                status: 'success',
                personas: data,
                message: 'Retrieved ALL Usuario'
            });            
        });
    },
    consultar: function (req, res, next)
    {
        var id_persona = req.params.id;
      
        UserModel.getSingleUser(id_persona, function (error, data) {
            if (typeof data !== 'undefined' && data.length > 0) {
                res.status(200)
                .json({
                    status: 'success',
                    personas: data,
                    message: 'Inserted one Usuario'
                });
            }
        });        
    },
    crear: function (req, res, next) {
        var personaData = {
            id_persona: req.params.id,
            nombres: req.body.nombres,
            apellidos: req.body.apellidos,
            direccion: req.body.direccion,
            telefono1: req.body.telefono1,
            telefono2: req.body.telefono2,
            correo: req.body.correo
        };
        UserModel.insertUser(personaData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.status(200)
                .json({
                    status: 'success',
                    personas: data,
                    message: 'Inserted one Usuario'
                });
            }
            else {
                return next(error);
            }
        });
    },
    editar: function (req, res, next) {
        
        var personaData = {
            id_persona: req.params.id,
            nombres: req.body.nombres,
            apellidos: req.body.apellidos,
            direccion: req.body.direccion,
            telefono1: req.body.telefono1,
            telefono2: req.body.telefono2,
            correo: req.body.correo
        };
        UserModel.updatePersona(personaData, function (error, data) {
            if (typeof data !== 'undefined') {
                res.status(200)
                .json({
                    status: 'success',
                    personas: data,
                    message: 'Inserted one Usuario'
                });
            }
            else {
                return next(error);
            }
        });
    }
};
