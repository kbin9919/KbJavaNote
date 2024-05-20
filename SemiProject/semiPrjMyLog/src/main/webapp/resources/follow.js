const withFocus = $(".with-togle");
const withFocusList = $(".with-togle>a");
let withFocusNum = 0;
withFocus.on('click', function (event) {
    let clickwith = event.target;
    for (let i = 0; i < withFocusList.length; i++) {
        if (withFocusNum !== i) {
            if (clickwith == withFocusList[i]) {
                withFocusList[i].classList.add("with-focus");
                withFocusList[withFocusNum].classList.remove("with-focus");
                withFocusNum = i;
            }
        }
    }
});
const withFollowing = $("#with-following");
console.log(withFollowing);
withFollowing.hover(function () { withFollowing.text("언팔로우"); }
    , function () { withFollowing.text("팔로잉"); }
);