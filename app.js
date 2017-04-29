var express = require('express');
var app = express();

app.use('/assets', express.static(__dirname + '/public'));

var port = process.env.PORT || 3000;

var tpiData = 'tpinext.xml'

app.get('/', function (req, res) {
  res.sendFile(__dirname + '/' + tpiData);
});

app.listen(port);
