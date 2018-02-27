console.log('hello');


var fs = require('fs');
var parser = require('subtitles-parser');

var srt = fs.readFileSync('my.srt', 'utf8');

var data = parser.fromSrt(srt);