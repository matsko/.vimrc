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
  processBoolean(buffer)
});

function moreThanOne(code, c) {
  return code.indexOf(c) != code.lastIndexOf(c);
}

function processBoolean(code) {

  code = code.replace(/^.+?[^><!=]=\s*/, '');

  var oldLength = code.length;
  code = code.replace(/^[^\|\&]+?\(/,'');
  if (code.length < oldLength) {
    code = code.replace(/\)[^\)]*?$/,'');
  }

  code = code.trim();
  if (code.charAt(0) == '(' && code.charAt(code.length-1) == ')') {
    if (!moreThanOne(code, '(') && !moreThanOne(code, ')')) {
      code = code.substring(1, code.length-1);
    }
  }

  var tokens = [];
  var paramDepth = 0;
  var a = 0;
  for(var i=0;i<code.length;i++) {
    var c = code.charAt(i); 
    if (c == '(') {
      paramDepth++;
      continue;
    } else if (c == ')') {
      paramDepth--;
      continue;
    }

    if (c == '&' || c == '|') {
      var cc = code.charAt(i + 1); 
      if (cc == c) {
        if (paramDepth == 0) {
          var token = code.substring(a, i-1);
          i += 1;
          while(true) {
            var ccc = code.charAt(++i);
            if (ccc != ' ') {
              break;
            }
          }
          a = i;
          setToken(tokens, token);
          tokens.push('" ' + c + c + ' "');
        } else {
          i += 2;
        }
      }
    }
  }

  setToken(tokens, code.substring(a, code.length));

  process.stdout.write(buffer + "\n");
  process.stdout.write('console.log(' + tokens.join(", ") + ');' + "\n");
  process.stdout.write('console.log("' + code + '=", ' + code + ');')
}

function setToken(tokens, val) {
  val = val.trim();
  tokens.push('"' + val + '="');
  tokens.push(val);
  tokens.push("\n");
}
