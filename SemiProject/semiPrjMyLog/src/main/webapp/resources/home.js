let num = 0;
function me01(){
    const menu1 = document.querySelector("#menu1");
    const menu2 = document.querySelector("#menu2");
    const menu3 = document.querySelector("#menu3");
    if (num % 2 == 0) {
        menu1.classList.remove("menu");
        menu2.classList.remove("menu");
        menu3.classList.remove("menu");
        console.log("화면에 보이기");
    } else if (num % 2 != 0) {
        menu1.classList.add("menu");
        menu2.classList.add("menu");
        menu3.classList.add("menu");
        console.log("화면에서 숨기기");
    }
    num++;
}