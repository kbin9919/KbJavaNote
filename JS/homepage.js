let num = 0;
let showPwdNum =0;
function backmode(){
    const backmodeButton = document.querySelector("#button");
    const backmodeTogle = document.querySelector("#button-togle");
    const body = document.querySelector("#body");
    num++;
    if(num % 2 ==0){
        console.log("라이트모드");
        backmodeButton.classList.add("buttonWhite");
        backmodeTogle.classList.add("button-togleWhite");
        body.classList.add("body-white");
        backmodeButton.classList.remove("buttonDark");
        backmodeTogle.classList.remove("button-togleDark");
        body.classList.remove("body-dark");
    }else if(num % 2 !=0){
        console.log("다크모드");
        backmodeButton.classList.add("buttonDark");
        backmodeTogle.classList.add("button-togleDark");
        body.classList.add("body-dark");
        backmodeButton.classList.remove("buttonWhite");
        backmodeTogle.classList.remove("button-togleWhite");
        body.classList.remove("body-white");
    }
}
window.onload = function() {
    const text1 = "Make a variety of games";
    const i1 = 0;
    const container1 = document.getElementById("text1");
    typeWriter(text1, i1, container1);

    setTimeout(function() {
        const text2 = "and enjoy them. Go!";
    const i2 = 0;
    const container2 = document.getElementById("text2");
    typeWriter(text2, i2, container2);
    }, 2000);
    
    setTimeout(function() {
    const text3 = "It's more fun with a friend.";
    const i3 = 0;
    const container3 = document.getElementById("plusText");
    typeWriter(text3, i3, container3);
    }, 3500);
    
};
function typeWriter(text, i, container) {
    if (i < text.length) {
        container.innerHTML += text.charAt(i);
        i++;
        setTimeout(function() {
            typeWriter(text, i, container);
        }, 60); // 100밀리초마다 한 글자씩 출력
    }
}
function showPassword(){
    showPwdNum++;
    if(showPwdNum % 2 === 0){
        console.log("비밀번호 비표시");
        let showPwd = document.querySelector("#pwdText");
        
    }
    else if(showPwdNum % 2 !== 0){
        console.log("표시");

    }
}