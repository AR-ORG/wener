# Javascript

## Tips

* https://developer.mozilla.org/en-US/docs/Web/Events

```js
// 简单的播放音频
var audio = new Audio('audio_file.mp3');
audio.play();

// JSON 序列化缩进
JSON.stringify({a:1,b:2,c:{d:1,e:[1,2]}}, null, 4); // Indented 4 spaces
JSON.stringify({a:1,b:2,c:{d:1,e:[1,2]}}, null, "\t"); // Indented with tab


// 模拟按键
var keyboardEvent = document.createEvent("KeyboardEvent");
var initMethod = typeof keyboardEvent.initKeyboardEvent !== 'undefined' ? "initKeyboardEvent" : "initKeyEvent";

keyboardEvent[initMethod](
                   "keydown", // event type : keydown, keyup, keypress
                    true, // bubbles
                    true, // cancelable
                    window, // viewArg: should be window
                    false, // ctrlKeyArg
                    false, // altKeyArg
                    false, // shiftKeyArg
                    false, // metaKeyArg
                    40, // keyCodeArg : unsigned long the virtual key code, else 0
                    0 // charCodeArgs : unsigned long the Unicode character associated with the depressed key, else 0
);
document.dispatchEvent(keyboardEvent);

// 模拟 jq 按键事件
jQuery.event.trigger({ type : 'keypress', which : character.charCodeAt(0) });


/**
 * 全屏
 *
 * @see http://fullscreen.spec.whatwg.org/
 * @see https://developer.mozilla.org/en-US/docs/DOM/Using_fullscreen_mode
 */
function fullscreen() {
    var element = document.body;
    // Check which implementation is available
    var requestMethod = element.requestFullScreen ||
        element.webkitRequestFullscreen ||
        element.webkitRequestFullScreen ||
        element.mozRequestFullScreen ||
        element.msRequestFullscreen;

    if( requestMethod ) {
        requestMethod.apply( element );
    }
}
```

## FAQ

### 检测方向

* [Prevent orientation change in iOS Safari](https://stackoverflow.com/a/7061983/1870054)

```js
var query = window.matchMedia("(orientation:landscape)")
var isPortrait = !query.matches;

function getOrientation() {
  return window.innerWidth > window.innerHeight ? 'landscape' : 'portrait';
}

// https://developer.mozilla.org/en-US/docs/Web/API/Screen
// http://caniuse.com/screen-orientation/embed/
screen.orientation.type

// https://developer.mozilla.org/en-US/docs/Web/Events/orientationchange
window.addEventListener("orientationchange", function() {
    alert("the orientation of the device is now " + screen.orientation.angle);
});
```

### 检测网络连通性
```js
function doConnectFunction() {
}
function doNotConnectFunction() {
}

var i = new Image();
i.onload = doConnectFunction;
i.onerror = doNotConnectFunction;
// CHANGE IMAGE URL TO ANY IMAGE YOU KNOW IS LIVE
i.src = 'http://server.com/some.png?t=' + Date.now();
```


https://github.com/nolimits4web/swiper/

MatrixRain
https://codepen.io/P3R0/pen/MwgoKv
Flame
https://codepen.io/dazulu/pen/fGFyj
FireText
http://pag.es/fire/
http://pag.es/fire/test.html



video
https://howlerjs.com/
https://github.com/CreateJS


## Engine

* [List of ECMAScript engines](https://en.wikipedia.org/wiki/List_of_ECMAScript_engines)
* [JerryScript](https://github.com/Samsung/jerryscript) JavaScript engine for the Internet of Things
  * Full ECMAScript 5.1 standard compliance
  * 160K binary size when compiled for ARM Thumb-2
  * Heavily optimized for low memory consumption
  * Written in C99 for maximum portability
  * Snapshot support for precompiling JavaScript source code to byte code
  * Mature C API, easy to embed in applications
* [Duktape](https://github.com/svaarala/duktape)  embeddable Javascript engine with a focus on portability and compact footprint
  * Embeddable, portable, compact
  * Ecmascript E5/E5.1 compliant, some features implemented from Ecmascript 2015 (E6) and Ecmascript 2016 (E7)
  * Khronos/ES6 TypedArray and Node.js Buffer bindings
  * WHATWG Encoding API living standard
  * Built-in debugger
  * Built-in regular expression engine
  * Built-in Unicode support
  * Minimal platform dependencies
  * Combined reference counting and mark-and-sweep garbage collection with finalization
  * Custom features like co-routines
  * Property virtualization using a subset of Ecmascript E6 Proxy object
  * Bytecode dump/load for caching compiled functions
  * Distributable includes an optional logging framework, CommonJS-based module loading implementations, etc
  * Liberal license


## 数据可视化
* D3
* [vega/vega](https://github.com/vega/vega)
  * A visualization grammar.
  * a declarative format for creating, saving, and sharing interactive visualization designs.
  * 使用 JSON 生成 SVG/Canvas
  * [vega/vega-lite](https://github.com/vega/vega-lite)
    * A grammar of interactive graphics, built on Vega. 
    * [编辑器](https://vega.github.io/editor)
* [Clusterize.js](https://github.com/NeXTs/Clusterize.js)
  * 无限长的列表
* [nvd3](https://github.com/novus/nvd3)
* [cubism](https://github.com/square/cubism)
  * Time serial
* [handsontable](https://github.com/handsontable/handsontable)
  * Excel 表格
* [ag-grid/ag-grid](https://github.com/ag-grid/ag-grid)
  * Advanced Data Grid / Data Table supporting Javascript / React / AngularJS / Web Components


## Bootstrap
* [fuelux](https://github.com/ExactTarget/fuelux)
  * UI 组件
* [PixelKit-Bootstrap-UI-Kits](https://github.com/Pixelkit/PixelKit-Bootstrap-UI-Kits)
  * 非常好看的网页模板,免费的也有很多组件和主题
* [bootstrap-datepicker](https://github.com/uxsolutions/bootstrap-datepicker)
* [bootstrap-switch](https://github.com/nostalgiaz/bootstrap-switch)
* [Bootswatch](https://bootswatch.com/)
