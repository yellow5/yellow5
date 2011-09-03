var express = require('express');

var app = express.createServer(express.logger());
app.register('.haml', require('hamljs'));

app.configure(function ()
{
    this.set("views", __dirname + "/views");
    this.set("view engine", "hamljs");

    this.use(express.bodyParser());
    this.use(express.methodOverride());

    this.use(require("stylus").middleware({
        src: __dirname + "/views",
        compress: true
    }));

    this.use(express.static(__dirname + '/views'));
    this.use(this.router);
});

app.get('/', function(request, response) {
  response.render('index.haml', { layout: false });
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log("Listening on " + port);
});
