const category = document.getElementById("fa-bars");

area = document.getElementById("category-area");

category.addEventListener("mouseenter", function(){
    area.style.display = "flex";
});

area.addEventListener("mouseleave", function(){
    area.style.display = "none";
});



$(".category-name").on("mouseenter", function(){
    const LCategoryNo = $(this).attr("id");

    $(".sub-category-name").hide();
    $("." + LCategoryNo + "-sub").show();


});


var categoryName = document.querySelectorAll("#div-category>li");

categoryName.forEach((target) => target.addEventListener("click",categoryFuncion ));

/* const names = categoryName.target.getAttribute('id'); */

var categoryFuncion = function(){
    
/*     $.ajax({
        url : "selectCategory",  
        data : { "midNo" : midNo }, 
        type : "GET", 

        success : function(){ 
            console.log(midNo);
            
        },

        error : function(){ 
            console.log("에러 발생");
        }
    });  */
    
    console.log();
};






/* 


for (var i = 0; i < categoryName.length; i++) {
    categoryName[i].addEventListener('click', categoryFuncion);
}
 */



