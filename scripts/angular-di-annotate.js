#!/usr/bin/env node

var readline = require('readline');
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var buffer = ''
rl.on('line', function(line){
  buffer += line + ' ';
}).on('close', function() {
  process.stdout.write(formatAttrs(buffer));
});

function formatAttrs(content) {
  var data = content.match(/^(.*?)function\((.+?)\)\s* {/m);
  if (!data || data.length <= 1) return content;

  var lhs = data[1];
  var rhs = data[2];

  var attrs = rhs.split(/\s*,\s*/); 
  var js = '["' + attrs.join('", "') + '", function(' + attrs.join(', ') + ') {';
  return lhs + js;
}
