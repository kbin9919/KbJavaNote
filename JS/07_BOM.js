function openTest(){
  window.open("https://www.naver.com", "abc", "width = 500, height = 500, resizable=no", "left=500", "bottom=500");
}

function timeoutTest(){
 timer01 = setTimeout(() => {alert("hello~~!");}, 3000);
}
function intervalTest(){
 timer02 = setInterval(() =>{console.log("2초 지남...");}, 2000);
}

function clearTimeoutTest(){
  clearTimeout(timer01);
}
function clearIntervalTest(){
  clearInterval(timer02);
}

function reloadT(){
  location.reload();
}
function hrefT(){
  console.log(location.href); // 현재 페이지의 URL을 출력
}
function assignT(){
  location.assign("https://www.naver.com");
}
function replaceT(){
  location.replace("https://www.naver.com");
}

function navigatorTest(){
  console.log(navigator);
}
function screenTest(){
  console.log(screen);
}

function backTest(){
  history.back();
}
function fowardTest(){
  history.forward();
}
function goTest(){
  history.go(-2); 
  history.go(3)
}