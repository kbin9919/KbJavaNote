const x = new Object();
x.name = "홍길동";
const result = x.hasOwnProperty("name");
console.log(result);
console.log(x instanceof Object);

const date = new Date();
console.log(date);



function showCurrentTime(){
  const divTag = document.querySelector("#div-time");
  divTag.innerText = new Date;
  console.log(new Date);
}

