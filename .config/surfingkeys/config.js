// mapkey('<Ctrl-d>', 'Show me the money', function() {
//     Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
// });

map('<Ctrl-d>', 'd');
map('<Ctrl-u>', 'e');

// MAPPINGS
// Create mapping in vim editor
aceVimMap('kj', '<Esc>', 'insert');

addSearchAliasX('b', 'brave', 'https://search.brave.com/search?source=web&q=', 's', 'https://search.brave.com/api/suggest?rich=true&source=web&q=', function(response) {
    var res = JSON.parse(response.text);
    return res[1].map(function(r) {
        return r.q;
    });
});

addSearchAliasX('w', 'qwant', 'https://www.qwant.com/?t=web&q=', 's', 'https://api.qwant.com/v3/suggest?locale=en_GB&q=', function(response) {
    var res = JSON.parse(response.text);
    return res.data.items.map(function(r) {
        return r.value;
    });
});

// SETTINGS
if (navigator.brave) {
    settings.defaultSearchEngine = "b";
}

settings.omnibarMaxResults = 15;

// STYLING
Visual.style('marks', 'background-color: #F5AC46;');
Visual.style('cursor', 'background-color: #F54646 ');

// Gruvbox Dark
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #282828;
    color: #ebdbb2;
}
.sk_theme tbody {
    color: #b8bb26;
}
.sk_theme input {
    color: #d9dce0;
}
.sk_theme .url {
    color: #98971a;
}
.sk_theme .annotation {
    color: #b16286;
}
.sk_theme .omnibar_highlight {
    color: #ebdbb2;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #282828;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #d3869b;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
