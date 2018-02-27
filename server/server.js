const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const port = process.env.PORT || 3000;
const promise = require('bluebird');
const pgp = require('pg-promise');
const connectionString = 'postgres://localhost:3000/puppies';

app.listen(port, function () {
    console.log('thx for listening on station:', port);
}); //the port you want to use