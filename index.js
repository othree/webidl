var request = require('request');
var cheerio = require('cheerio');

var exec = require('sync-exec');

var base = 'https://dxr.mozilla.org';

var sourcePath = '/mozilla-central/source';
var rawPath = '/mozilla-central/raw-file';
var path = '/dom/webidl';

request(base + sourcePath + path + '/', function (error, response, body) {
  if (!error && response.statusCode === 200) {
    var $ = cheerio.load(body);

    var links = $('a.conf');

    var pathname = links[0].attribs.href;
    var url = base + pathname;

    request(url, function (error, response, body) {
      if (!error && response.statusCode === 200) {
        var $ = cheerio.load(body);

        var link = $('a.raw');
        if (link.length) {
          var pathname = link[0].attribs.href;
          var frags = pathname.split('/');

          var rawBase = base + rawPath + '/' + frags[5] + path;

          links.map(function (i, node) {
            var pathname = node.attribs.href;
            var frags = pathname.split('/');
            var filename = frags[frags.length - 1];
            var url = rawBase + '/' + filename;
            if (/\.webidl$/.test(filename)) {
              console.log('wget -q "' + url + '" -O ' + filename);
              exec('wget -q "' + url + '" -O webidl/' + filename);
            }
          });
        }
      }
    });
  }
});
