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