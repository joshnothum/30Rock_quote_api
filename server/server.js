const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const pg = require('pg');
const port = process.env.PORT || 5000;

const config = {
    database: 'thirtyRock', // the name of the database
    host: 'localhost', // where is your database?
    port: 5432, // the port number for you database, 5432 is the default
    max: 10, // how many connections at one time
    idleTimeoutMillis: 30000 // Close idle connections to db after
};

const pool = new pg.Pool(config);

app.listen(port, function () {
    console.log('thx for listening on station:', port);
}); //the port you want to use