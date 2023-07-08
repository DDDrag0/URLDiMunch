let i = 0;
// ELEMENT
function elm(x) {
  let target = x.substring(1);
  let type = x.charAt(0);
  if (type == '#') {
    return document.getElementById(target);
  } else if (type == '.') {
    return document.getElementsByClassName(target);
  } else {
    return document.getElementsByTagName(x);
  }
}

// ACCOUNT CLICK
window.onclick = function () {
  elm(".accountLinks")[0].style.display = 'none';
};

// SUB MENU
if (elm(".has-submenu")) {
  for (i = 0, len = elm(".has-submenu").length; i < len; i++) {if (window.CP.shouldStopExecution(0)) break;
    elm(".has-submenu")[i].onclick = function (e) {
      e.stopPropagation();
      toggle(this.nextElementSibling);
    };
  }window.CP.exitedLoop(0);
}

// BTN SWITCH
if (elm(".checkAll") != undefined) {
  for (i = 0, len = elm(".checkAll").length; i < len; i++) {if (window.CP.shouldStopExecution(1)) break;
    let target = elm(".checkAll")[i].getAttribute("target");
    if (elm(target)[i] != undefined) {
      elm(".checkAll")[i].onchange = function () {
        let checked = this.checked;
        for (i = 0, len = elm(target).length; i < len; i++) {if (window.CP.shouldStopExecution(2)) break;
          elm(target)[i].checked = checked;
        }window.CP.exitedLoop(2);
      };
    }
  }window.CP.exitedLoop(1);
}

// MENU ICON CLICK
if (elm(".menuIcon")) {
  elm(".menuIcon")[0].onclick = function () {
    elm(".container")[0].classList.toggle("is-click");
  };
}

// INPUT IMG
function getImg(x) {
  if (x.files.length > 0) {
    let fr = new FileReader();
    imgSrc = null;
    let parent = x.parentElement;
    fr.onload = function (e) {
      imgSrc = e.target.result;
      if (parent.getElementsByTagName("img").length > 0) {
        parent.removeChild(parent.getElementsByTagName("img")[0]);
      }
      img = document.createElement("img");
      img.setAttribute("src", imgSrc);
      img.style.width = "80px";
      img.style.verticalAlign = "top";
      parent.appendChild(img);
    };
    fr.readAsDataURL(x.files[0]);
  }
}

// NEW INPUT
for (i = 0, len = elm(".btnNewInput").length; i < len; i++) {if (window.CP.shouldStopExecution(3)) break;
  elm(".btnNewInput")[i].onclick = function () {
    findClosest(this, elm(".inputGroup")).nextElementSibling.classList.remove("hide");
  };
}

// SUB LIST
window.CP.exitedLoop(3);if (elm(".btnCaret")) {
  for (i = 0, len = elm(".btnCaret").length; i < len; i++) {if (window.CP.shouldStopExecution(4)) break;
    elm(".btnCaret")[i].onclick = function () {
      let row = findClosest(this, elm(".row"));
      row.classList.toggle("is-active");
    };
  }window.CP.exitedLoop(4);
}
if (elm(".caretAll")) {
  for (i = 0, len = elm(".caretAll").length; i < len; i++) {if (window.CP.shouldStopExecution(5)) break;
    elm(".caretAll")[i].onchange = function () {
      let stt = this.checked;
      let table = findClosest(this, elm(".table"));
      let row = findChildren(table, elm(".row"));
      for (i = 0, len = row.length; i < len; i++) {if (window.CP.shouldStopExecution(6)) break;
        if (stt) {
          row[i].classList.add("is-active");
        } else {
          row[i].classList.remove("is-active");
        }
      }window.CP.exitedLoop(6);
    };
  }window.CP.exitedLoop(5);
}

// SORT
if (elm(".titleSelect") != undefined) {
  for (i = 0, len = elm(".titleSelect").length; i < len; i++) {if (window.CP.shouldStopExecution(7)) break;
    elm(".titleSelect")[i].onclick = function (e) {
      e.stopPropagation();
      this.classList.toggle("is-active");
    };
  }window.CP.exitedLoop(7);
}
window.onclick = function () {
  for (i = 0, len = elm(".titleSelect").length; i < len; i++) {if (window.CP.shouldStopExecution(8)) break;
    elm(".titleSelect")[i].classList.remove("is-active");
  }window.CP.exitedLoop(8);
};


// FILTER
if (elm('.btnFilter') != undefined) {
  for (i = 0, len = elm('.btnFilter').length; i < len; i++) {if (window.CP.shouldStopExecution(9)) break;
    elm('.btnFilter')[i].onclick = function () {
      elm('.boxFilter')[0].classList.toggle('is-active');
    };
  }window.CP.exitedLoop(9);
}

// PRICE BAR
let slider = document.getElementById('filterPrice');
let rangeValue = document.getElementsByClassName('rangeValue');

noUiSlider.create(slider, {
  start: [0, 100],
  connect: true,
  range: {
    'min': 0,
    'max': 100 } });



slider.noUiSlider.on('update', function (values) {
  for (i = 0, len = values.length; i < len; i++) {if (window.CP.shouldStopExecution(10)) break;
    rangeValue[i].setAttribute('value', values[i]);
  }window.CP.exitedLoop(10);
  values = values.map(function (x) {
    return parseInt(x);
  });
  // AJAX HERE
  //     $.ajax({
  //         url: 'ajax.php',
  //         type: 'GET',
  //         data: {},
  //         success: function(){

  //         }
  //     });  
});

for (i = 0, len = rangeValue.length; i < len; i++) {if (window.CP.shouldStopExecution(11)) break;
  rangeValue[i].addEventListener('change', function () {
    let v = [];
    for (i = 0, len = rangeValue.length; i < len; i++) {if (window.CP.shouldStopExecution(12)) break;
      v[i] = rangeValue[i].value;
    }window.CP.exitedLoop(12);
    slider.noUiSlider.set(v);
    // AJAX HERE
    console.log(v);
  });
}window.CP.exitedLoop(11);

let noUihandle = elm('.noUi-handle');
if (noUihandle != undefined) {
  for (i = 0, len = noUihandle.length; i < len; i++) {if (window.CP.shouldStopExecution(13)) break;
    noUihandle[i].addEventListener('click', function () {
      let v = slider.noUiSlider.get();
      // AJAX HERE
      console.log(v);
    });
  }window.CP.exitedLoop(13);
}

//FIND PARENT
function findClosest(x, parent) {
  do {if (window.CP.shouldStopExecution(14)) break;
    if (parent.length > 0) {
      for (i = 0, len = parent.length; i < len; i++) {if (window.CP.shouldStopExecution(15)) break;
        if (x.isSameNode(parent[i])) {
          return x;
        }
      }window.CP.exitedLoop(15);
    } else {
      if (x.isSameNode(parent)) {
        return x;
      }
    }
  } while (x = x.parentElement);window.CP.exitedLoop(14);
}

// FIND CHILDREN
function findChildren(x, y) {
  let arr = [];
  if (y.length > 0) {
    for (i = 0, len = y.length; i < len; i++) {if (window.CP.shouldStopExecution(16)) break;
      if (x.isSameNode(findClosest(y[i], x))) {
        arr.push(y[i]);
      }
    }window.CP.exitedLoop(16);
  } else {
    if (x.isSameNode(findClosest(y, x))) {
      arr.push(y);
    }
  }
  return arr;
}

//RENDER HTML
function renderHTML(x, content) {
  let tag = document.createElement(x);
  tag.append(content);
  return tag;
}

//TOGGLE
function toggle(x) {
  let css = window.getComputedStyle(x, null);
  if (css.getPropertyValue("display") == 'none') {
    x.style.display = 'block';
  } else {
    x.style.display = 'none';
  }
}


//SLIDE	
function slideToggle(el) {
  let elCss = window.getComputedStyle(el, null);
  if (elCss.getPropertyValue("height") == 0 + 'px') {
    el.style.height = el.scrollHeight + "px";
  } else {
    el.style.height = 0;
  }
}

function extend(o1, o2) {
  if (o1 instanceof Array) {
    let result = [];
    // RESULT = O1
    for (i = 0, len = o1.length; i < len; i++) {if (window.CP.shouldStopExecution(17)) break;
      result.push(o1[i]);
    }
    // RESULT = O2
    window.CP.exitedLoop(17);for (i = 0, len = o2.length; i < len; i++) {if (window.CP.shouldStopExecution(18)) break;
      if (result.indexOf(o2[i]) < 0) {
        result.push(o2[i]);
      }
    }window.CP.exitedLoop(18);
  } else if (typeof o1 == 'object') {
    let result = {};
    let o1Keys = Object.keys(o1);
    for (i = 0, len = o1Keys.length; i < len; i++) {if (window.CP.shouldStopExecution(19)) break;
      result[o1Keys[i]] = o1[o1Keys[i]];
    }window.CP.exitedLoop(19);
    let o2Keys = Object.keys(o2);
    for (i = 0, len = o2Keys.length; i < len; i++) {if (window.CP.shouldStopExecution(20)) break;
      result[o2Keys[i]] = o2[o2Keys[i]];
    }window.CP.exitedLoop(20);
  }
  return result;
}
function extend2(o1, o = []) {
  let result = o1;
  for (i = 0, len = o.length; i < len; i++) {if (window.CP.shouldStopExecution(21)) break;
    let result = extend(result, o[i]);
  }window.CP.exitedLoop(21);
  return result;
}