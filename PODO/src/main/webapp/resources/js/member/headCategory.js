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

(function(){
    location.href = contextPath;
    subCategoryName.forEach((target) => target.addEventListener("click", categoryFunction));
})();

/* const names = categoryName.target.getAttribute('id'); */

function categoryFunction(){    

    

    let mCategoryNo = this.getAttribute("id");

    mCategoryNo = mCategoryNo.replace("s-","");
    
         $.ajax({
            url : contextPath + "/selectCategory",  
            data : { "mCategoryNo" : mCategoryNo }, 
            type : "GET", 
            dataType : "JSON",

            success : function(itemList){ 
                
                if(document.getElementsByClassName("box")[0] != "") {
                    document.getElementsByClassName("frame")[0].innerHTML = "";
                }

                if (itemList != "") {

                    for (let item of itemList) {
                        console.log(item);
                        const box = document.createElement("div");
                        box.classList.add("box");

                        const title = document.createElement("a");
                        title.classList.add("title");
                        title.href = contextPath + "/board/detail/" + item.boardNo;

                        const image = document.createElement("div");
                        image.classList.add("image");

                        const img = document.createElement("img");
                        img.src = contextPath + "/resources/images/items/image1.jpg";
                        img.alt = "상품 이미지";

                        const title1 = document.createElement("div");
                        title1.classList.add("title1");

                        const title2 = document.createElement("div");
                        title2.classList.add("title2");
                        title2.innerText = item.boardTitle;

                        const name2 = document.createElement("div");
                        name2.classList.add("name2");

                        const price = document.createElement("div");
                        price.classList.add("price");
                        price.innerText = item.price + " 원";
                        
                        const time = document.createElement("div");
                        time.classList.add("time");
                        time.innerText = item.updateDate;

                        document.getElementsByClassName("frame")[0].append(box);

                        box.append(title);
                        title.append(image, title1);
                        image.append(img);
                        title1.append(title2, name2);
                        name2.append(price, time);
                    }
                    
                } else {
                    document.getElementsByClassName("frame")[0].innerText = "게시글이 존재하지 않습니다.";
                }

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



