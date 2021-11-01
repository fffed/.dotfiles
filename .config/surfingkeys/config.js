// mapkey('<Ctrl-d>', 'Show me the money', function() {
//     Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
// });

map('<Ctrl-d>', 'd');
map('<Ctrl-u>', 'e');

addSearchAliasX('b', 'brave', 'https://search.brave.com/search?source=web&q=', 's', 'https://search.brave.com/api/suggest?rich=true&source=web&q=', function(response) {
    var res = JSON.parse(response.text);
    return res[1];
});

addSearchAliasX('q', 'qwant', 'https://www.qwant.com/?t=web&q=', 's', 'https://api.qwant.com/v3/suggest?locale=en_GB&q=', function(response) {
    var res = JSON.parse(response.text);
    return res[data.items];
});

