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


var monAcerFull = S.op("move", {
  "screen" : monAcer,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var monAcerLeft = monAcerFull.dup({ "width" : "screenSizeX/2" });
var monAcerRight = monAcerLeft.dup({ "x" : "screenOriginX+screenSizeX/2" });

S.bnda({
  // Layout Bindings
  "1:ctrl" : monAcerLeft,
  "2:ctrl" : monAcerRight,
  "0:ctrl" : monAcerFull,
  "esc:ctrl" : S.op("grid")
});
