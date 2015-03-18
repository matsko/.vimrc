#!/usr/bin/env node

var cheerio = require('cheerio');
    
var readline = require('readline');
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var buffer = '';
rl.on('line', function(line){
  buffer += line + ' ';
}).on('close', function() {
  processSemicolons(buffer);
});

function processSemicolons(code) {
  var tab = '';
  var i = 0;
  var c = code.charAt(i);
  if (c == ' ') {
    do {
      c = code.charAt(i++);
      tab += ' ';
    } while(c != ' ');
  }

  var vals = code.split(';');
  var response = '';
  for(var i=0;i<vals.length;i++) {
    var value = vals[i].trim();
    if (value) {
      response += tab + value + ";\n";
    }
  }
  
  process.stdout.write(response);
}
