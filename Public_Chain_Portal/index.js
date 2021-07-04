const morgan = require('morgan'),
    express = require('express'),
    app = express(),
    server = require('http').Server(app);
    bodyParser = require('body-parser');
    path = require('path');
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: false }));

app.use('/',express.static(__dirname + '/style'));


var name;
var password;

app.post('/login', (req,res) => {
    name = req.body.name;
    password = req.body.password;

    if(name=="admin" && password=="password") 
    {
        res.sendFile(path.join(__dirname+'/style/examples/bifurcate.html'));
    }
    else if (name=="contractor" && password=="password2")
    {   
        res.sendFile(path.join(__dirname+'/style/examples/contractor.html'));
    }
    else {
        res.status(500).send({ message: 'error' });
      
    }
});

app.get('/login', (req,res) => {
    res.sendFile(path.join(__dirname+'/style/examples/login-page.html'));
});


const port = process.env.PORT || 8000
server.listen(port);