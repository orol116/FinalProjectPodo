/* 
const category = document.getElementById("category-area");

document.getElementById("fa-bars").addEventListener("mouseover", function(){

    category.style.display = "flex";
    category.style.flexDirection = "row";

}); */

const category = document.getElementById("fa-bars");

area = document.getElementById("category-area");

category.addEventListener("mouseenter", function(){

    area.style.display = "flex";

});

area.addEventListener("mouseleave", function(){

    area.style.display = "none";

});