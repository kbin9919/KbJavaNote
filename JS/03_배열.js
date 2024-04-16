let x = [];
x[0] = '사과';
x[1] = 3.14;
x[2] = 10;
x[3] = true;
console.log(x);

let arr = ["aaa","bbb","ccc","ddd"];
let result1 = arr.indexOf('bbb');
console.log(result1);

let arr1 = [1, 2, 3];
let arr2 = [4, 5, 6];
let combinedArray = arr1.concat(arr2); // [1, 2, 3, 4, 5, 6]
console.log(combinedArray);

let arr3 = ["Hello", "world", "!"];
let result = arr3.join(" "); // "Hello world !"
console.log(result);

let arr4 = [1, 2, 3];
arr4.reverse(); // [3, 2, 1]
console.log(arr4);

let arr5 = [3, 1, 2];
arr5.sort(); // [1, 2, 3]
console.log(arr5);

let arr6 = [1, 2];
arr6.push(3, 4); // [1, 2, 3, 4]
console.log(arr6);

let arr7 = [1, 2, 3];
let lastElement = arr7.pop(); // 3, arr는 이제 [1, 2]
console.log(arr7);

let arr8 = [1, 2, 3];
let firstElement = arr8.shift(); // 1, arr는 이제 [2, 3]
console.log(arr8);

let arr9 = [2, 3];
let nweArr = arr9.unshift(0, 1); // [0, 1, 2, 3]
console.log(arr9);

let arr10 = [1, 2, 3, 4, 5];
let newArr = arr10.slice(1, 3); // [2, 3], arr은 그대로 [1, 2, 3, 4, 5]
console.log(newArr);

let arr11 = [1, 2, 3, 4, 5];
arr11.splice(2, 1, 'a', 'b'); // [3], arr은 이제 [1, 2, 'a', 'b', 4, 5]
console.log(arr11);
