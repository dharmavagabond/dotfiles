/* global slate */

'use strict';

var mac = {
  width: 1920,
  height: 1080,
  bar: 23,
  browser: 'Firefox Developer Edition'
};

var full = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': mac.width,
  'height': mac.height
});

var leftHalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': mac.width / 2,
  'height': mac.height
});

var rightHalf = slate.operation('move', {
  'x': mac.width / 2,
  'y': 'screenOriginY',
  'width': mac.width / 2,
  'height': mac.height
});

var topHalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': mac.width,
  'height': mac.height / 2
});

var bottomHalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': mac.height / 2,
  'width': mac.width,
  'height': mac.height / 2
});

var semiFull = slate.operation('move', {
  'x': mac.width / 16,
  'y': mac.height / 16 + mac.bar,
  'width': mac.width - mac.width / 8,
  'height': mac.height - mac.bar - mac.height / 8
});

var center = function(windowObject) {
  var size = windowObject.size();
  var width = size.width;
  var height = size.height;

  windowObject.move({
    'x': mac.width / 2 - width / 2,
    'y': (mac.height + mac.bar) / 2 - height / 2
  });
};

var sublime = slate.operation('move', {
    'x': mac.width / 2 - 1226 / 2,
    'y': mac.height / 16 + mac.bar,
    'width': 1226,
    'height': mac.height - mac.bar - mac.height / 8
});

var hideAll = slate.operation('hide', {
  'app': 'all-but:"Finder"'
});

var focusSublime = slate.operation('focus', {
  'direction': 'above',
  'app': 'Sublime Text'
});

var focusBrowser = slate.operation('focus', {
  'direction': 'above',
  'app': mac.browser
});

var getLayout = function() {
  var layout = {
    '_before_': {
      'operations': hideAll
    },
    '_after_': {
      'operations': [focusBrowser, focusSublime]
    },
    'Sublime Text': {
      'operations': rightHalf
    }
  };
  layout[mac.browser] = { 'operations': leftHalf };

  return Object.freeze(layout);
};

var dev = slate.operation('layout', {
  'name': slate.layout('dev', getLayout())
});

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
  's:shift,alt': sublime,
  'c:shift,alt,cmd': center
});
