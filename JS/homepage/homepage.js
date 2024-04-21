let num = 0;
let settingNum = 0;



function backmode() {
    const backmodeButton = document.querySelector("#button");
    const backmodeTogle = document.querySelector("#button-togle");
    const body = document.querySelector("#body");
    num++;
    if (num % 2 == 0) {
        console.log("라이트모드");
        backmodeButton.classList.add("buttonWhite");
        backmodeTogle.classList.add("button-togleWhite");
        body.classList.add("body-white");
        backmodeButton.classList.remove("buttonDark");
        backmodeTogle.classList.remove("button-togleDark");
        body.classList.remove("body-dark");
    } else if (num % 2 != 0) {
        console.log("다크모드");
        backmodeButton.classList.add("buttonDark");
        backmodeTogle.classList.add("button-togleDark");
        body.classList.add("body-dark");
        backmodeButton.classList.remove("buttonWhite");
        backmodeTogle.classList.remove("button-togleWhite");
        body.classList.remove("body-white");
    }
}
window.onload = function () {
    const text1 = "Make a variety of games";
    const i1 = 0;
    const container1 = document.getElementById("text1");
    typeWriter(text1, i1, container1);

    setTimeout(function () {
        const text2 = "and enjoy them. Go!";
        const i2 = 0;
        const container2 = document.getElementById("text2");
        typeWriter(text2, i2, container2);
    }, 2000);

    setTimeout(function () {
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
        setTimeout(function () {
            typeWriter(text, i, container);
        }, 60); // 100밀리초마다 한 글자씩 출력
    }
}

function showPassword() {
    let passwordInput = document.getElementById("pwdText");
    let onOff = document.getElementById("off");
    if (passwordInput.type === "password") {
        onOff.textContent = "😳";
        passwordInput.type = "text";
        console.log("화면에 표시 on");
    } else {
        passwordInput.type = "password";
        onOff.textContent = "😎";
        console.log("화면에 표시 off");
    }
}
let mousemoveNum = 0;
function epectOn() {
    mousemoveNum++;

    let epect = document.querySelector("#epectT");
    if (mousemoveNum % 2 === 0) {
        epect.classList.add('epectOff');
        epect.classList.remove('epectOn');
        console.log("이펙트off");
        document.removeEventListener('mousemove', mouseMoveHandler);
        return;
    } else if (mousemoveNum % 2 !== 0) {
        console.log("이펙트on");
        epect.classList.add('epectOn');
        epect.classList.remove('epectOff');
        document.addEventListener('mousemove', mouseMoveHandler);
    }
}

function mouseMoveHandler(e) {
    let cursorTrail = document.getElementById('cursor-trail');
    let newX = e.pageX; /* 이미지의 가로 중앙을 마우스 위치에 맞춤 */
    let newY = e.pageY; /* 이미지의 세로 중앙을 마우스 위치에 맞춤 */
    let newCursor = document.createElement('div');
    newCursor.style.position = 'absolute';
    newCursor.style.width = '33px'; /* 이미지의 너비 */
    newCursor.style.height = '33px'; /* 이미지의 높이 */
    newCursor.style.backgroundImage = 'url("/resources/image/클릭모션.png")'; /* 사용할 이미지 */
    // newCursor.style.backgroundImage = 'url("/resources/image/free-icon-star-of-david-5331627.png")'; /* 사용할 이미지 */
    newCursor.style.backgroundSize = 'cover';
    newCursor.style.left = newX + 'px';
    newCursor.style.top = newY + 'px';
    cursorTrail.appendChild(newCursor);
    setTimeout(function () {
        cursorTrail.removeChild(newCursor);
    }, 1000); /* 잔상이 사라지는 시간 (1초) */
}

let clickNum = 0;

function clickOn() {
    clickNum++;
    if (clickNum % 2 === 0) {
        let clickT = document.querySelector("#clickT");
        clickT.classList.add('clickOff');
        clickT.classList.remove('clickOn');
        document.removeEventListener('click', clickEvent);
    } else if (clickNum % 2 !== 0) {
        clickT.classList.add('clickOn');
        clickT.classList.remove('clickOff');
        document.addEventListener('click', clickEvent);
    }
}

function clickEvent(e) {
    let cursorTrail = document.getElementById('clickE');
    let newX = e.pageX; /* 이미지의 가로 중앙을 마우스 위치에 맞춤 */
    let newY = e.pageY; /* 이미지의 세로 중앙을 마우스 위치에 맞춤 */
    let newCursor = document.createElement('div');
    newCursor.style.position = 'absolute';
    newCursor.style.width = '50px'; /* 이미지의 너비 */
    newCursor.style.height = '50px'; /* 이미지의 높이 */
    newCursor.style.backgroundImage = 'url("/resources/image/free-icon-star-of-david-5331627.png")'; /* 사용할 이미지 */
    // newCursor.style.backgroundImage = 'url("/resources/image/클릭모션.png")'; /* 사용할 이미지 */
    newCursor.style.backgroundSize = 'cover';
    newCursor.style.left = newX + 'px';
    newCursor.style.top = newY + 'px';
    cursorTrail.appendChild(newCursor);

    setTimeout(function () {
        cursorTrail.removeChild(newCursor);
    }, 400); /* 잔상이 사라지는 시간 (1초) */
}

const set = document.querySelector("#setting");
set.addEventListener('click', setting);
function setting() {
    const settingSell = document.querySelector("#settingSell");
    if (settingNum % 2 == 0) {
        settingSell.classList.remove("hidden");
        console.log("화면에 보이기");
    } else if (settingNum % 2 != 0) {
        settingSell.classList.add("hidden");
        console.log("화면에서 숨기기");
    }
    settingNum++;
}
