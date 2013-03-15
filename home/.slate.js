// Based off of:
// https://github.com/jigish/dotfiles/blob/master/slate.js

// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000
});

// Monitors
var monAcer   = "1680x1050";
var monLaptop = "1680x1050";
var monIMac   = "2560x1440";

var pushRight = slate.operation("push", {
  "direction" : "right",
  "style" : "bar-resize:screenSizeX/2"
});

var pushLeft = slate.operation("push", {
  "direction" : "left",
  "style" : "bar-resize:screenSizeX/2"
});

var toggleITermShell = slate.operation("shell", {
  "command" : "/usr/bin/osascript -l AppleScript toggleITerm.applescript",
  "wait" : false,
  "path": "~/.bin"
});



var itermToggle = function (win) {
  if (win.app().name() == "iTerm") {
    var windowWidth = win.size().width;
    var screenWidth = win.screen().rect().width;

    // Only do execute fullscreen toggle if we are in fullscreen mode.
    if (windowWidth == screenWidth)
      win.doOperation(toggleITermShell);
  }
}

slate.bind("1:ctrl", function(win) {
  itermToggle(win); 
  win.doOperation(pushLeft);
});

slate.bind("2:ctrl", function(win) {
  itermToggle(win); 
  win.doOperation(pushRight);
});

var fullscreen = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var monAcerFull = S.op("move", {
  "screen" : monAcer,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var monAcerLeft = monAcerFull.dup({ "width" : "screenSizeX/2" });
var monAcerRight = monAcerLeft.dup({ "x" : "screenOriginX+screenSizeX/2" });


var monIMacFull = S.op("move", {
  "screen" : monIMac,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var monIMacLeft = monIMacFull.dup({ "width" : "screenSizeX/2" });
var monIMacRight = monIMacLeft.dup({ "x" : "screenOriginX+screenSizeX/2" });


var shell = slate.operation("shell", {
  "command" : "/usr/bin/osascript -l AppleScript makeFullScreen.scpt iTerm false",
  "wait" : true,
  "path" : "~/.bin"
});


var sequence = slate.operation("sequence", {
  "operations": [
    [function (win) {
      win.doOperation(shell);
    }],
    [function (win) {
      slate.operation("focus", {
        "app" : "iTerm"
      });
    }],
    [pushRight]
  ]
});

S.bnda({
  // Layout Bindings
  "0:ctrl" : fullscreen,
  "esc:ctrl" : S.op("grid"),
  "3:ctrl" : sequence
});
