const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const port = 3000;

app.listen(port, function () {
    console.log('thx for listening on station:', port);
    
}); //the port you want to use