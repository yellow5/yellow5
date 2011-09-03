var express = require('express');

var app = express.createServer(express.logger());
app.register('.haml', require('hamljs'));

app.get('/', function(request, response) {
  response.render('index.haml', { layout: false });
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log("Listening on " + port);
});
