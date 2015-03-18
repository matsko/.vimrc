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
  process.stdout.write(formatArray(buffer));
});

function formatArray(content) {
  var data = content.match(/^(.*?)\[(.+?)\](.*)$/m);
  if (!data || data.length <= 1) return content;

  var lhs = data[1];
  var items = data[2].split(/\s*,\s*/);
  var rhs = data[3];

  var js = "['" + items.join("','") + "']";
  return lhs + js + rhs;
}
