function waitLoadDrag(elementId, time) {
  if (document.querySelector('div[img-url]') != null) {
    drag(elementId);
  } else {
    setTimeout(function () {
      waitLoadDrag(elementId, time);
    }, time);
  }
}

function drag(elementId) {
  let element = document.getElementById(elementId);
  let minX = -element.scrollWidth + window.innerWidth;
  let minY = -element.scrollHeight + window.innerHeight;
  let maxX = element.offsetLeft;
  let maxY = element.offsetTop;

  //响应键盘操作用于缩放
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

  document.body.onkeydown = function (e) {
    //屏蔽默认按键功能
    e.preventDefault();
    if (direction[e.keyCode]) {
      key[direction[e.keyCode]] = true;
      console.log(direction[e.keyCode]);
      keyboardMove();
    }
  }

  document.body.onkeyup = function (e) {
    if (direction[e.keyCode]) {
      key[direction[e.keyCode]] = false;
      console.log(direction[e.keyCode]);
    }
  }

  function keyboardMove() {
    let offsetX = 0, offsetY = 0;
    if (key['UP']) {
      offsetY -= 20;
    }
    if (key['DOWN']) {
      offsetY += 20;
    }
    if (key['LEFT']) {
      offsetX -= 20;
    }
    if (key['RIGHT']) {
      offsetX += 20;
    }
    element.style.position = 'absolute';
    tempY = parseInt(element.style.top, 10) - offsetY;
    tempX = parseInt(element.style.left, 10) - offsetX;
    if (isNaN(tempY))
      tempY = maxY;
    if (isNaN(tempX))
      tempX = maxX;

    console.log(tempX, tempY);
    if (tempY < minY) {
      tempY = minY;
    }
    if (tempY > maxY) {
      tempY = maxY;
    }
    if (tempX < minX) {
      tempX = minX;
    }
    if (tempX > maxX) {
      tempX = maxX;
    }
    element.style.top = ((tempY > 0) ? '+' + tempY : tempY) + 'px';
    element.style.left = ((tempX > 0) ? '+' + tempX : tempX) + 'px';
  }

  let position = {
    offsetX: 0, //点击处偏移元素的X
    offsetY: 0, //偏移Y值
    state: 0 //是否正处于拖拽状态，1表示正在拖拽，0表示释放
  };

  //获得兼容的event对象
  function getEvent(event) {
    return event || window.event;
  }

  //绑定鼠标按下动作
  function onMousedown(event) {
    //获得偏移的位置以及更改状态
    let e = getEvent(event);
    if (event.target.nodeName != 'svg') {
      position.offsetX = e.offsetX;
      position.offsetY = e.offsetY;
      console.log("Event: ", position.offsetX, position.offsetY);
      /*while (tmp.className.split(' ')[0] != 'node') {
        tmp = tmp.parentNode;
        position.offsetX += tmp.offsetLeft;
        position.offsetY += tmp.offsetTop;
        console.log("Callback: ", tmp.className, position.offsetX, position.offsetY);
      }*/

      let tmp = event.target;
      while (tmp.className.split(' ')[0] != 'chart') {
        tmp = tmp.parentNode;
      }

      console.log("Padding: ", event.target.getBoundingClientRect());
      position.offsetX += event.target.getBoundingClientRect().left;
      position.offsetY += event.target.getBoundingClientRect().top;
      console.log("Padding: ", tmp.getBoundingClientRect());
      position.offsetX -= tmp.getBoundingClientRect().left;
      position.offsetY -= tmp.getBoundingClientRect().top;
      console.log("Final:", position.offsetX, position.offsetY);
    } else {

      position.offsetX = e.offsetX;
      position.offsetY = e.offsetY;
      console.log(position.offsetX, position.offsetY);
    }
    position.state = 1;
  }
 
  //拖动元素动作
  function onMousemove(event) {
    let e = getEvent(event);
    if (position.state) {
      position.endX = e.clientX;
      position.endY = e.clientY;
      //设置绝对位置在文档中，鼠标当前位置-开始拖拽时的偏移位置
      element.style.position = 'absolute';
      if ((position.endY - position.offsetY) < maxY) {
        element.style.top = position.endY - position.offsetY + 'px';
      } else {
        element.style.top = ((maxY > 0) ? '+' + maxY : maxY) + 'px';
        position.offsetY = position.endY - maxY;
      }
      if ((position.endX - position.offsetX) < maxX) {
        element.style.left = position.endX - position.offsetX + 'px';
      } else {
        element.style.left = ((maxX > 0) ? '+' + maxX : maxX) + 'px';
        position.offsetX = position.endX - maxX;
      }
      if ((position.endY - position.offsetY) > minY) {
        element.style.top = position.endY - position.offsetY + 'px';
      } else {
        element.style.top = ((minY > 0) ? '+' + minY : minY) + 'px';
        position.offsetY = position.endY - minY;
      }
      if ((position.endX - position.offsetX) > minX) {
        element.style.left = position.endX - position.offsetX + 'px';
      } else {
        element.style.left = ((minX > 0) ? '+' + minX : minX) + 'px';
        position.offsetX = position.endX - minX;
      }
      //console.log(position);
    }
  }

  //元素被鼠标拖住
  element.addEventListener('mousedown', function (event) {
    element.style.cursor = "move";
    onMousedown(event);
  }, false);

  //元素移动过程中
  element.addEventListener('mousemove', function (event) {
    onMousemove(event);
  }, false);

  //释放拖拽状态
  element.addEventListener('mouseup', function (event) {
    element.style.cursor = "auto";
    position.state = 0;
  }, false);
}   
