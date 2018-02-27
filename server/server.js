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

app.get('/quotes',(req, res) => {
    pool.connect(function (errorConnectingToDb, db, done) {
        if (errorConnectingToDb) {
            // There was an error and no connection was made
            console.log('Error connecting', errorConnectingToDb);
        } else {
            // We connected to the db!!!!! pool -1
            let queryText = 'SELECT *'+
                            'FROM "quotes';
            db.query(queryText, [], function (errorMakingQuery, result) {
                // We have received an error or result at this point
                done(); // pool +1
                if (errorMakingQuery) {
                    console.log('Error making query', errorMakingQuery);
                } else {
                    // Send back success!
                    console.log("RESULT: ", result.rows);
                   res.send(result.rows);
                }
            }); // END QUERY
        }
    }); // END POOL
});

app.listen(port, function () {
    console.log('thx for listening on station:', port);
}); //the port you want to use