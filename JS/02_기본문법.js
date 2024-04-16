//함수 외부에 만든 변수는 전역변수
let x = 20;
const y = 10;
function f01(){
  console.log(x);
  console.log(y);
}
f01();

let str = "123";
let num = parseInt(str);
console.log(typeof num);