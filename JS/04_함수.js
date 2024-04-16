
function f01(){
  console.log("f01 called...");
}

const f02 = function(){
  console.log("anontmous called...");
}

const f03 = () => {
  console.log("arrow function called...");
}

f01();
f02();
f03();

function f04(x){
  return x+1;
}
const f05 = function(x){
  return x+1;
}
const f06 = (x) => {return x+1}
//return만 존재할 경우 생략 가능
// const f7 = x => x+1;

let result01 = f04(10);
let result02 = f05(10);
let result03 = f06(10);

console.log(result01);
console.log(result02);
console.log(result03);

const printNum = function(x) {
  console.log(x);
  console.log(arguments);
}

printNum(100 , 200, 300);
//====================================
function getTen(){
  return printNum;
}

const result = getTen();
console.log(result);

result(777);

const calcResult = 3/0;
console.log(isFinite(calcResult));
const calcResult2 = 3/1;
console.log(isFinite(calcResult2));

console.log(isNaN(10)); // false
console.log(isNaN('hello')); //

let x = 10;
let y = 20;
let result1 = eval('x + y'); // result는 30
console.log(result1);