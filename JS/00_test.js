function sayHello() {
  alert("hello~~!");
}
let x = document.querySelector("#target");

function changeColor() {
  x.style.backgroundColor = "red";
  x.innerText = "JS";
}

function setBox() {
  const boxArr = document.querySelectorAll(".box");
  // boxArr[1].style.width = "100px";
  // boxArr[1].style.height = "100px";
  // boxArr[1].style.backgroundColor = "green";
  for(let i = 0; i < boxArr.length; i++){
    boxArr[i].style.width = "100px";
    boxArr[i].style.height = "100px";
    boxArr[i].style.backgroundColor = "green";
  }
}

function checkDup(){
  //유저가 입력한 아이디 가져오기
  const userIdTag = document.querySelector("#userId");
  console.log(userIdTag.value);
  userIdTag.ariaPlaceholder = "zzz바꿈.."
  userIdTag.value = "JS로 넣어주는 VALUE"
  // userIdTag.type = "checkBox"
  //중복인지 확인
}
