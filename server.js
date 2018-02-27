const express = require('express');
let app = express();
const mongoose = require('mongoose');
const port = 3000;

app.listen(port, function () {
    console.log('thx for listening on station:', port);
    
}); //the port you want to use