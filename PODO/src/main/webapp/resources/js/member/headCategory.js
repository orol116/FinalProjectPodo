
const categoryList = document.getElementById("fa-bars");

const area = document.getElementById("category-area");

categoryList.addEventListener("mouseenter", function(){

    area.style.display = "flex";

});

area.addEventListener("mouseleave", function(){

    area.style.display = "none";

});