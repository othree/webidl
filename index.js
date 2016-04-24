var request = require('request');
var cheerio = require('cheerio');

var base = 'https://mxr.mozilla.org';

request(base + '/mozilla-central/source/dom/webidl/', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    var $ = cheerio.load(body);

    var links = $('td[align=left] > a[href*=webidl]');

    links.map(function (i, node) {
      var pathname = node.attribs.href
      var url = base + pathname + '?raw=1';
      var frags = pathname.split('/');
      var filename = frags[frags.length - 1];
      if (/\.webidl$/.test(filename)) {
        console.log('wget -q "' + url + '" -O ' + filename);
        require('child_process').execSync('wget -q "' + url + '" -O webidl/' + filename);
      }
    });

  }
});
