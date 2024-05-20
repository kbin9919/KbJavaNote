const categoryFocus = document.querySelector(".midle-category");
const categoryFocusList = document.querySelectorAll(".midle-category>a");
let categoryFocusNum = 0;
categoryFocus.addEventListener('click', function categoryFocus(event){
    let clickCategory = event.target;
    for(let i =0; i<categoryFocusList.length; i++){
        if(clickCategory == categoryFocusList[i]){
            categoryFocusList[i].classList.add("category-focus");
            categoryFocusList[categoryFocusNum].classList.remove("category-focus");
            categoryFocusNum = i;
        }
    }
})

const tagFocus = document.querySelector(".tag");
const tagFocusList = document.querySelectorAll("td>a");
let tagFocusNum = 0;
tagFocus.addEventListener('click', function tagFocus(event){
    console.log(tagFocusNum);
    let clickTag = event.target;
    for(let i =0; i<tagFocusList.length; i++){
        if(clickTag == tagFocusList[i]){
            tagFocusList[i].classList.add("tag-focus");
            tagFocusList[tagFocusNum].classList.remove("tag-focus");
            tagFocusNum = i;
        }
    }
})
