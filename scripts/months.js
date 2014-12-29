#!/usr/bin/env node

var dateFormat = "MMMM";
switch(process.argv[2]) {
  case "short":
    dateFormat = "MMM";
  break;
  case "num":
    dateFormat = "M";
  break;
}

var moment = require('moment');

var months = [];
for(var i=0;i<12;i++) {
  var d = new Date(2010, i);
  months.push(moment(d).format(dateFormat));
}

console.log(months.join("\n"));
