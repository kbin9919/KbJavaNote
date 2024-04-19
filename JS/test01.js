const err = document.querySelector("input[name=pwd]");
err.addEventListener("focus", () => {
  const val = document.querySelector("input[name=id]");

  const x = document.querySelector("#target");
  x.innerText = "영문자 대/소문자 특수문자, 숫자 포함 8~32자";
});


const email = document.querySelector("input[name=email]");

email.addEventListener("focus", () => {
  const id = document.querySelector("input[name=id]");
  const pwd = document.querySelector("input[name=pwd]");
  const pwd2 = document.querySelector("input[name=pwd2]");
  if (id.value === "") {
    const xId = document.querySelector("#targetId");
    xId.innerText = "아이디를 먼저 입력하세요";
  }
  
  else if (pwd.value === "") {
    const xPwd = document.querySelector("#targetPwd");
    xPwd.innerText = "패스워드를 먼저 입력하세요";
  }
  else if (pwd2.value === "") {
    const xPwd2 = document.querySelector("#targetPwd2");
    xPwd2.innerText = "패스워드 확인을 먼저 입력하세요";
  }

  
});