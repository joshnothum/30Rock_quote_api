const fs = require('fs');
const parser = require('subtitles-parser');

let srt = fs.readFileSync('./server/S07E01.srt', { encoding: 'utf-8' });

let data = parser.fromSrt(srt);

console.log(data);

module.exports = data;