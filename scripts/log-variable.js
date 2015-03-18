#!/usr/bin/env node

var cheerio = require('cheerio');

var readline = require('readline');
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var buffer = ''
rl.on('line', function(line){
  buffer += line + ' ';
}).on('close', function() {
  process.stdout.write(formatLine(buffer));
});

function formatLine(code) {
  var match = code.match(/(\s*)var (.+?)\s*=/);
  if (match.length) {
    code += "\n" + match[1] + 'dump("' + match[2] + '",' + match[2] + ');';
  }
  return code;
}
