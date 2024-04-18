const x= document.querySelector("#result");
x.classList.add("box");
function addRed(){
  x.classList.add("red");
  x.classList.remove("blue");
  x.classList.remove("green");
}
function addBlue(){
  x.classList.add("blue");
  x.classList.remove("red");
  x.classList.remove("green");
}
function addGreen(){
  x.classList.add("green");
  x.classList.remove("red");
  x.classList.remove("blue");
}


function f01(){
  //요소노드 만들기
const x = document.createElement("h1");
//텍스트노드 만들기
const y = document.createTextNode('안녕~~');
//요쇼노드 하위에 텍스트노드 추가
x.appendChild(y);
console.log(x);

//직접 만든 노드를 화면에 부착
const bodyTag = document.querySelector("body");
bodyTag.appendChild(x);
}

function f02(){

  //요소 노드 만들기
  const imgTag = document.createElement('img');

  //속성 셋팅
  imgTag.setAttribute("src" , "../resources/img/abc.png");
  imgTag.setAttribute("art", "캐릭터 사진");
  imgTag.setAttribute("width", "100px");
  imgTag.setAttribute("height", "100px");

  //화면에 요소노드 부착하기
  const bodyTag = document.querySelector("#target");
  bodyTag.appendChild(imgTag);
}

function f03(){
  const target = document.querySelector("#target");
  const imgTag =  document.querySelector("img")
  target.removeChild(imgTag);
}