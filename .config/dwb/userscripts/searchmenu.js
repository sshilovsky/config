//!javascript

var search_engines = null

function read_engines()
{
    search_engines = io.read(data.searchEngines).split("\n").filter(function(line) { 
        return line.trim().length > 0; 
    }).map(function(line) {
        var token = line.split(" ");
        var shortcut = token[0];
        var url = token.slice(1).join(" ");
        var parsedUrl = net.parseUri(url);
        return {
            shortcut : shortcut, 
            url : url, 
            host : (parsedUrl ? parsedUrl.host : null)
        };
    });
}

function getSelection() 
// TODO issue: doesn't work for github.com on some dwb builds
{
    var frames = tabs.current.allFrames;
    for (var i=frames.length-1; i>=0; --i) 
    {
        var selection = JSON.parse(frames[i].inject("return document.getSelection().toString()"));
        if (selection && selection.length > 0)
            return selection;
    }
    return null;
}

read_engines()

Signal.connect("contextMenu", function (wv, menu) {
    if(!search_engines) return;

    var text = (getSelection() || "").trim();
    if (text.length == 0) return;

    menu.addItems([null])
    search_engines.forEach(function(entry) {
        menu.addItems([{   
            label: "Search \""+text+"\" with "+entry.host,
            callback: function() {
                execute("tabopen "+entry.shortcut+" "+text);
            }
        }])
    })
})

