const notifyFocus = $(".notify-togle");
const notifyFocusList = $(".notify-togle-border");
let notifyFocusNum = 0;
notifyFocus.on('click', function (event) {
    let clickNotify = event.target;
    for (let i = 0; i < notifyFocusList.length; i++) {
        if (notifyFocusNum !== i) {
            if (clickNotify == notifyFocusList[i]) {
                notifyFocusList[i].classList.add("notify-togle-focus");
                notifyFocusList[notifyFocusNum].classList.remove("notify-togle-focus");
                notifyFocusNum = i;
            }
        }
    }
});