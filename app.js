
/**
 * Module dependencies.
 */
var express = require('express');
var routes = require('./routes');
var http = require('http');
var path = require('path');
var app = express();
var mysql = require('mysql');

// all environments
//app.use(app.router);
//app.use(express.cookieParser());
//app.use(express.session({ secret: 'abcd1234' }));

app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(app.router);
app.use(require('stylus').middleware(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'public')));
// development only
if ('development' == app.get('env')) {
    app.use(express.errorHandler());
}
app.get('/', routes.index);
app.get('/about', routes.about);
app.get('/contact', routes.contact);

var server=http.createServer(app).listen(app.get('port'), function () {
    console.log('Express server listening on port ' + app.get('port'));
});
var io = require('socket.io').listen(server);
module.exports.io = io;
//PersonaController++++++++++++++++++++++++++++++++++++++++++++
var persona = require('./controllers/personaController');
app.get('/persona', persona.home);
app.get('/persona/nueva', persona.add);
app.post('/persona/nueva', persona.guardar);
app.get('/persona/editar/:id', persona.edit);
app.post('/persona/editar/:id', persona.save_edit);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//OrganizacionController++++++++++++++++++++++++++++++++++++++++++++
var organizacion = require('./controllers/organizacionController');
app.get('/organizacion', organizacion.home);
app.get('/organizacion/nueva', organizacion.add);
app.post('/organizacion/nueva', organizacion.guardar);
app.get('/organizacion/editar/:id', organizacion.edit);
app.post('/organizacion/editar/:id', organizacion.save_edit);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//ServicioController++++++++++++++++++++++++++++++++++++++++++++
var servicio = require('./controllers/servicioController');
app.get('/servicio', servicio.home);
app.get('/servicio/nueva', servicio.add);
app.post('/servicio/nueva', servicio.guardar);
app.get('/servicio/editar/:id', servicio.edit);
app.post('/servicio/editar/:id', servicio.save_edit);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++