function waitLoadDrag(elementId, time) {
  if (document.querySelector('div[img-url]') != null) {
    drag(elementId);
  } else {
    setTimeout(function () {
      waitLoadDrag(elementId, time);
    }, time);
  }
}

// Test via a getter in the options object to see if the passive property is accessed
var supportsPassive = false;
try {
  var opts = Object.defineProperty({}, 'passive', {
    get: function() {
      supportsPassive = true;
    }
  });
  window.addEventListener("testPassive", null, opts);
  window.removeEventListener("testPassive", null, opts);
} catch (e) {}


let minX, minY, maxX, maxY;
function drag(elementId) {
  let element = document.getElementById(elementId);
  minX = -element.scrollWidth + window.innerWidth;
  minY = -element.scrollHeight + window.innerHeight;
  maxX = "0";
  maxY = "0";
  element.style.position = 'absolute';
  element.style.top = '58px';//初态的位置
  element.style.left = '0px';

  //响应键盘操作用于移动
  let key = {
    UP: false,
    DOWN: false,
    LEFT: false,
    RIGHT: false
  };

  let direction = {
    38: "UP",
    39: "RIGHT",
    40: "DOWN",
    37: "LEFT"
  };

  function getTransformValue(element) {
    let cst = window.getComputedStyle(element);
    let curTransform = cst.webkitTransform ||
                       cst.mozTransform ||
                       cst.msTransform ||
                       cst.oTransform ||
                       "err";// No transform set("none") or browser not supported
    let values;
    if (curTransform == "none") {
      values = [1, 0, 0, 1, 0, 0];
    } else {
      values = curTransform.split('(')[1],
      values = values.split(')')[0],
      values = values.split(',');
    }
    return values;
  }

  function checkBorder(translateX, translateY) {
    let retX, retY;
    if (typeof(translateX) != "undefined") {
      retX = translateX;
      translateX < minX && (retX = minX);
      translateX > maxX && (retX = maxX);
    }
    if (typeof(translateY) != "undefined") {
      retY = translateY;
      translateY < minY && (retY = minY);
      translateY > maxY && (retY = maxY);
    }
    return retX || retY;
  }

  function keyboardMove() {
    if (pendingKeyboardUpdate) cancelAnimationFrame(pendingKeyboardUpdate);
    let offsetX = 0, offsetY = 0;
    if (key['UP']) {
      offsetY -= 15;
    }
    if (key['DOWN']) {
      offsetY += 15;
    }
    if (key['LEFT']) {
      offsetX -= 15;
    }
    if (key['RIGHT']) {
      offsetX += 15;
    }
    element.style.position = 'absolute';
    let values = getTransformValue(element);
    // values[0:5]: matrix(cos(a), sin(a), -sin(a), cos(a), x, y)
    tempX = parseInt(values[4]) - offsetX;
    tempY = parseInt(values[5]) - offsetY;
    if (isNaN(tempY))
      tempY = maxY;
    if (isNaN(tempX))
      tempX = maxX;

    console.log(tempX, tempY);
    tempX = checkBorder(tempX, undefined);
    tempY = checkBorder(undefined, tempY);
    element.style.transform = 'translate(' + tempX + 'px, ' + tempY + 'px)';

    if (krAF) {
      pendingKeyboardUpdate = requestAnimationFrame(keyboardMove);
    }
  }

  let krAF = true, pendingKeyboardUpdate = null;
  document.body.onkeydown = function (e) {
    //屏蔽默认按键功能
    //e.preventDefault();
    if (direction[e.keyCode]) {
      key[direction[e.keyCode]] = true;
      krAF = true;
      console.log(direction[e.keyCode]);
      pendingKeyboardUpdate = requestAnimationFrame(keyboardMove);
    }
  }

  document.body.onkeyup = function (e) {
    if (direction[e.keyCode]) {
      key[direction[e.keyCode]] = false;
      console.log(direction[e.keyCode]);
      if (key['UP']||key['DOWN']||key['LEFT']||key['RIGHT']) krAF = false;
    }
  }

  let position = {
    offsetX: 0, //点击处偏移元素的X
    offsetY: 0, //偏移Y值
    endX: 0, //移动过程中的指针/触屏位置X
    endY: 0, //位置Y
    state: false, //是否正处于拖拽状态，true表示正在拖拽，false表示释放
    rAF: true
  }, pendingUpdate = null;

  //获得兼容的event对象
  function getEvent(event) {
    return event || window.event;
  }

  //移动元素
  function setLocation() {
    position.rAF = true;
    //设置绝对位置在文档中，鼠标当前位置-开始拖拽时的偏移位置
    element.style.position = 'absolute';
    let values = getTransformValue(element);
    // values[0:5]: matrix(cos(a), sin(a), -sin(a), cos(a), x, y)
    translateX = parseInt(values[4]) + (position.endX - position.offsetX);
    translateY = parseInt(values[5]) + (position.endY - position.offsetY);
    position.offsetX = position.endX;
    position.offsetY = position.endY;
    translateX = checkBorder(translateX, undefined);
    translateY = checkBorder(undefined, translateY);
    element.style.transform = "translate(" + translateX + "px," + translateY + "px)";
  }

  //绑定鼠标按下动作
  function onMousedown(event) {
    //获得偏移的位置以及更改状态
    let e = getEvent(event);
    position.offsetX = e.clientX;
    position.offsetY = e.clientY;
    position.state = true;
  }

  //绑定触屏开始动作
  function onTouchstart(event) {
    //获得触屏点
    let e = getEvent(event);

    //只用第一个触控点（暂时）
    position.offsetX = e.touches.item(0).clientX;
    position.offsetY = e.touches.item(0).clientY;
    position.state = true;
  }

  //鼠标拖动元素动作
  function onMousemove(event) {
    let e = getEvent(event);
    position.endX = e.clientX;
    position.endY = e.clientY;
    if (position.state && position.rAF) {
      position.rAF = false;
      pendingUpdate = requestAnimationFrame(setLocation);
      //setLocation();
    }
  }

  //触屏拖动元素动作
  function onTouchmove(event) {
    let e = getEvent(event);
    position.endX = e.touches.item(0).clientX;
    position.endY = e.touches.item(0).clientY;
    if (position.state && position.rAF) {
      position.rAF = false;
      requestAnimationFrame(setLocation);
      //setLocation();
    }
  }

  //元素被鼠标拖住
  element.addEventListener('mousedown', function (event) {
    element.style.cursor = "move";
    onMousedown(event);
  }, supportsPassive ? { passive: true } : false);

  //触屏开始状态
  element.addEventListener('touchstart', function (event) {
    event.preventDefault();
    //这方法太脏了(#1
    let tooltip = document.querySelector('div[role="tooltip"]');
    if (!(tooltip === undefined || tooltip === null)) {
      tooltip.remove();
    }
    let evt = document.createEvent("MouseEvents");
    evt.initEvent("mouseout", true, true);
    event.target.dispatchEvent(evt);
    onTouchstart(event);
  }, supportsPassive ? { passive: true } : false);

  //元素移动过程中
  element.addEventListener('mousemove', function (event) {
    onMousemove(event);
  }, supportsPassive ? { passive: true } : false);

  //触屏移动过程中
  element.addEventListener('touchmove', function (event) {
    event.preventDefault();
    onTouchmove(event);
  }, supportsPassive ? { passive: true } : false);

  //释放拖拽状态
  element.addEventListener('mouseup', function (event) {
    element.style.cursor = "auto";
    position.state = false;
    position.rAF = true;
    cancelAnimationFrame(pendingUpdate);
  }, supportsPassive ? { passive: true } : false);

  //触屏释放状态
  element.addEventListener('touchend', function (event) {
    element.style.cursor = "auto"
    position.state = false;
    //真的太脏了(#2
    if (event.target.className == 'description'
    || event.target.className == 'weight-modifiers'
    || event.target.className == 'feature-unlocks') {
      let evt = document.createEvent("MouseEvents");
      evt.initEvent("mouseover", true, true);
      event.target.dispatchEvent(evt);
    }
  }, supportsPassive ? { passive: true } : false);
}
