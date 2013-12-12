/* global slate*/

var monitor = {
  width: 1920,
  height: 1080,
  barra: 21
};

var full = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': monitor.width,
  'height': monitor.height
});
var leftHalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': monitor.width / 2,
  'height': monitor.height
});
var rightHalf = slate.operation('move', {
  'x': monitor.width / 2,
  'y': 'screenOriginY',
  'width': monitor.width / 2,
  'height': monitor.height
});
var topHalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': monitor.width,
  'height': monitor.height / 2
});
var bottomHalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': monitor.height / 2,
  'width': monitor.width,
  'height': monitor.height / 2
});
var semiFull = slate.operation('move', {
  'x': monitor.width / 16,
  'y': monitor.height / 16 + monitor.barra,
  'width': monitor.width - monitor.width / 8,
  'height': monitor.height - monitor.barra - monitor.height / 8
});
var center =  function(windowObject) {
  var size    = windowObject.size();
  var width   = size.width;
  var height  = size.height;
  windowObject.move({
    'x' : monitor.width / 2 - width / 2,
    'y' : (monitor.height + monitor.barra) / 2 - height / 2
  });
};
var hideAll = slate.operation('hide', {
  'app' : 'all-but:"Finder"'
});
var focusSublime = slate.operation('focus', {
  'direction' : 'above',
  'app': 'Sublime Text'
});
var focusChrome = slate.operation('focus', {
  'direction' : 'above',
  'app': 'Google Chrome'
});
var devLayout = slate.layout('dev', {
  '_before_': {
    'operations': hideAll
  },
  '_after_': {
    'operations': [focusChrome, focusSublime]
  },
  'Google Chrome': {
    'operations': leftHalf
  },
  'Sublime Text': {
    'operations': rightHalf
  }
});
var dev = slate.operation('layout', { 'name' : devLayout });

slate.configAll({
  defaultToCurrentScreen: true,
  orderScreensLeftToRight: true,
  nudgePercentOf: 'screenSize',
  resizePercentOf: 'screenSize'
});
slate.bindAll({
  'f:shift,alt': full,
  'c:shift,alt': semiFull,
  'l:shift,alt': leftHalf,
  'r:shift,alt': rightHalf,
  'b:shift,alt': bottomHalf,
  't:shift,alt': topHalf,
  'd:shift,alt': dev,
  'h:shift,alt': hideAll,
  'c:shift,alt,cmd': center
});
