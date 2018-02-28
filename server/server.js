const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const port = process.env.PORT || 5000;
// Body parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

let parsedData = require('./public/modules/parse.js');

app.get('/quote', (req, res) => {
    pool.connect(function (errorConnectingToDb, db, done) {
        if (errorConnectingToDb) {
            // There was an error and no connection was made
            console.log('Error connecting', errorConnectingToDb);
        } else {
            // We connected to the db!!!!! pool -1
            let queryText = 'SELECT *' +
                            'FROM "quote"';
            db.query(queryText, [], function (errorMakingQuery, result) {
                // We have received an error or result at this point
                done(); // pool +1
                if (errorMakingQuery) {
                    console.log('Error making query', errorMakingQuery);
                    res.sendStatus(401);
                } else {
                    // Send back something... hopefull a success
                    console.log("results from quote", result.rows);
                    res.send(result.rows);
                }
            }); // END QUERY
        }
    }); // END POOL
});
app.use(express.static('server/public'));
app.listen(port, function () {
    console.log('thx for listening on station:', port);
}); //the port you want to use