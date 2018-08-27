let express = require('express');
let app = express();
let rp = require('request-promise');
let fs = require('fs');
let axios = require('axios');
var Promise = require('bluebird');

const db = pgp(config);

const config = {
    host: 'localhost',
    port: 5432,
    database: 'veronica2',
    user: 'postgres'
};

const pgp = require('pg-promise')(initOptions);

var urls = [ 'https://en.wikipedia.org/wiki/Futures_and_promises', 'https://en.wikipedia.org/wiki/Continuation-passing_style', 'https://en.wikipedia.org/wiki/JavaScript', 'https://en.wikipedia.org/wiki/Node.js', 'https://en.wikipedia.org/wiki/Google_Chrome' ];

Promise.all([ 'https://en.wikipedia.org/wiki/Futures_and_promises', 'https://en.wikipedia.org/wiki/Continuation-passing_style', 'https://en.wikipedia.org/wiki/JavaScript', 'https://en.wikipedia.org/wiki/Node.js', 'https://en.wikipedia.org/wiki/Google_Chrome' ])
    .then(function(res){
        res.forEach(function(link){
            rp(link);
            console.log(res);
        });
    });

    function saveWebPage(url, filename){
        axios.get(url)
        .then(function(htmlString){
            fs.writeFile(filename, htmlString.data, 'utf8', function(err){
                if(err) throw err;
                console.log('File saved');
            });
        })
        .catch(function(err){
            console.log(err);
        })
    };
    saveWebPage(url[1], 'page.html');

    function cat(file1, file2, outputFile){
        var p1 = new Promise(function(resolve, reject){
            fs.readFile(file1, 'utf8', function(err, data){
                resolve(data);
            });
        })
        var p2 = new Promise(function(resolve, reject){
            fs.readFile(file2, 'utf8', function(err, data){
                resolve(data);
            })
        })
        Promise.all([p1, p2]).then(function(add){
            fs.writeFile(outputFile, add[0] + add[1], function(err){
                if(err) throw (err);
                console.log('Added');
            })
        })
    }
    cat('page.txt', 'page2.txt', 'output.txt');

    function addNumbers(x, y){
        var p = new Promise(function(resolve, reject){
            try{
                if(Number.isInteger(x) && Number.isInteger(y)){
                    resolve(x + y);
                }
                else{
                    reject('error');
                }
            }catch(error){

            }
        })
        return p;
    }
    addNumbers(1, 2).then(function(result){
        console.log(result);

    }).catch(function(error){
        console.log(error);
    });

app.listen(8000, function(){
    console.log('Listening on port 8000');
});