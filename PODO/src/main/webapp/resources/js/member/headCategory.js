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


var subCategoryName = document.querySelectorAll(".sub-category-name");

subCategoryName.forEach((target) => target.addEventListener("click",categoryFunction ));

/* const names = categoryName.target.getAttribute('id'); */

function categoryFunction(){

    let mCategoryNo = this.getAttribute("id");

    mCategoryNo = mCategoryNo.replace("s-","");
    
         $.ajax({
            url : "selectCategory",  
            data : { "mCategoryNo" : mCategoryNo }, 
            type : "GET", 
    
            success : function(){ 
                console.log(mCategoryNo);
                
            },
    
            error : function(){ 
                console.log("에러 발생");
            }
        });  
        
         
    };
    

/* 


for (var i = 0; i < categoryName.length; i++) {
    categoryName[i].addEventListener('click', categoryFuncion);
}
 */



