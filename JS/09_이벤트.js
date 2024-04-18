function f01(){
  console.log("111");
}
const btn02 = document.querySelector("#btn02");
btn02.onclick = f02;
function f02(){
  console.log("222");
}
const btn03 = document.querySelector("#btn03");
btn03.addEventListener('click', f03);
function f03(){
  console.log("333");
}

//이벤트가 발생한 요소에 접근하기.
const btn04 = document.querySelector("#btn04");
btn04.addEventListener("click", f04);

function f04(x){
  console.log(x.target);
}

const naverBnt = document.querySelector("#naver");
naverBnt.addEventListener("click", f05);
function f05(evt){
  evt.preventDefault();
}

// 이벤트 전파
const outer = document.querySelector("#outer");
outer.addEventListener("click", f06);

function f06(){
  console.log("f06 call..");
}
const div01 = document.querySelector("#div01").addEventListener("click", function(){console.log("div01 ~~")});
const div02 = document.querySelector("#div02").addEventListener("click", function(){console.log("div02 ~~")});
const div03 = document.querySelector("#div03").addEventListener("click", function(){console.log("div03 ~~")});


