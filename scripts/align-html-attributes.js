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
  process.stdout.write(formatHTML(buffer));
});

function formatHTML(html) {
  var leftSpacing = '';
  var i = 0;
  while(true) {
    var c = html.charAt(i);
    if (c != ' ') break;
    leftSpacing += ' ';
    i++;
  }

  var $ = cheerio.load(html);

  var element = $('*:first-child');
  var node = element[0];

  var tag = node.name;
  var closingTag = '</' + tag;
  var selfClosing = html.indexOf('</' + tag) == -1;
  var xmlClosing = (new RegExp('<' + tag + '[^>]*\ \/>','m')).test(html);

  var attrs = node.attribs;
  var newHTML = leftSpacing + '<' + tag;
  if (count(attrs) > 0) {
    newHTML += ' ';
    var tabSpacing = repeat(' ', newHTML.length);

    var first = true;
    for (var attr in attrs) {
      var value = attrs[attr];
      if (first) {
        first = false;
      } else {
        newHTML += "\n" + tabSpacing;
      }
      newHTML += attr;
      if (value && value.length) {
        newHTML += '="' + value + '"';
      }
    }
  }

  var content = element.html();
  var hasContent = !selfClosing && content.length > 0;
  content = content.split("\n");
  if (selfClosing && xmlClosing) {
    newHTML += ' />';
  } else {
    newHTML += '>';
    if (hasContent) {
      newHTML += "\n";
    }
  }

  if (hasContent) {
    for (var i=0;i<content.length;i++) {
      newHTML += leftSpacing + '  ' + content[i].trim() + "\n";
    }
  }

  if (!selfClosing) {
    if (hasContent) {
      newHTML += leftSpacing;
    }
    newHTML += '</' + tag + '>';
  }

  return newHTML;
}

function repeat(c, l) {
  var text = '';
  for(var i=0;i<l;i++) {
    text += c;
  }
  return text;
}

function count(obj) {
  var count = 0;
  for (var i in obj) {
    count++;
  }
  return count;
}
