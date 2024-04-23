//문자열만 다룰 수 있음
// localStorage.setItem("first", "사과");
// localStorage.setItem("second", "키위");
// localStorage.setItem("three", "배");

// const x = localStorage.getItem("first");
// console.log(x);

// const len = localStorage.length;
// console.log(len);

// localStorage.removeItem("second");

// localStorage.clear();

const btnTodoInsert = document.querySelector("#btn-todo-insert");
const btnTodoSelect = document.querySelector("#btn-todo-select");
const inputTag = document.querySelector("input[name=todo]");

localStorage.setItem("todo", JSON.stringify([]));

btnTodoInsert.addEventListener('click', function () {
  const todoListStr = localStorage.getItem("todo");
  const todoList = JSON.parse(todoListStr);
  todoList.push(inputTag.value);
  localStorage.setItem("todo", JSON.stringify(todoList));
  inputTag.value = "";
  const todoStr = localStorage.getItem("todo");

  const todoList2 = JSON.parse(todoStr);

  const todoListArea = document.querySelector('#todo-list-area');

  todoListArea.innerHTML = "";

  for (const x of todoList2) {
    const divTag = document.createElement('div');
    const todoText = document.createTextNode(x);
    divTag.appendChild(todoText);
    var checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    todoListArea.appendChild(divTag);
    todoListArea.appendChild(checkbox);
  }

});

//TODO select
btnTodoSelect.addEventListener("click", function () {

});
