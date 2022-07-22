if (location.href == "http://localhost:8080/podo/main") { 
    history.pushState(null, null, "http://localhost:8080/podo")

    selectList(mcNo);
}   


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
subCategoryName.forEach((target) => target.addEventListener("click", categoryFunction));
/* const names = categoryName.target.getAttribute('id'); */
/* function goBackFunction(){
    href
};
 */





function categoryFunction(){   

    let mCategoryNo = this.getAttribute("id");
    mCategoryNo = mCategoryNo.replace("s-","");

    if( document.getElementsByClassName("frame")[0] == undefined){

        const form = document.createElement("form");
        form.setAttribute("action", contextPath+"/main");
        form.setAttribute("method", "post");
        form.style.display = "none";
        
        const input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", "mCategoryNo");
        input.setAttribute("value", mCategoryNo);

        const footer = document.getElementsByTagName("footer")[0];
        
        form.append(input);
        footer.append(form);
        form.submit();

    }else{
        selectList(mCategoryNo)
    }
};
   



function selectList(mCategoryNo){
    $.ajax({
        url : contextPath + "/selectCategory",  
        data : { "mCategoryNo" : mCategoryNo }, 
        type : "GET", 
        dataType : "JSON",
 
        success : function(itemList){ 
            
            console.log(itemList);
            if (itemList.length != 0) {

                 document.getElementById("items-section").innerHTML = "";

                console.log("있음");
                console.log(mCategoryNo);
                
                let frame;
                for (let k = 0; k < itemList.length; k++) {

                    if(k % 5 == 0){
                        frame = document.createElement("div");
                        frame.classList.add("frame");
                        document.getElementById("items-section").append(frame);
                    }


                    const itembox = document.createElement("div");
                    itembox.classList.add("box");
                    /* const boxNumber = 1;
                    boxNumber++; */

                    const mainTitle = document.createElement("a");
                    mainTitle.classList.add("title");
                    mainTitle.setAttribute('href',contextPath + '/board/detail/'+itemList[k].boardNo);

                    const imageArea = document.createElement("div");
                    imageArea.classList.add("image");

                    const itemImage = document.createElement("img");
                    if(itemList[k].imageList[0] != null){
                        itemImage.setAttribute('src', contextPath+itemList[k].imageList[0].imageReName);
                    }else{
                        itemImage.setAttribute('src','resources/images/items/image1.jpg')
                    }
                    

                    const title1 = document.createElement("div");
                    title1.classList.add("title1");

                    const title2 = document.createElement("div");
                    title2.classList.add("title2");
                    title2.innerText = itemList[k].boardTitle;

                    const name2 = document.createElement("div");
                    name2.classList.add("name2");

                    const price = document.createElement("div");
                    price.classList.add("price");
                    price.innerText = itemList[k].price;

                    const time = document.createElement("div");
                    time.classList.add("time");
                    time.innerText = itemList[k].updateDate;

                    name2.append(price, time);

                    title1.append(title2, name2);

                    imageArea.append(itemImage);

                    mainTitle.append(imageArea, title1);

                    itembox.append(mainTitle);

                    frame.append(itembox);

                }
                
            } else {

                document.getElementById("items-section").innerHTML = "";
                frame = document.createElement("div");
                frame.classList.add("frame");
                frame.innerText = "게시글이 존재하지 않습니다아아아아아." +mCategoryNo ;
                

                document.getElementById("items-section").append(frame);
                console.log(mCategoryNo);
                
            }
             /* document.getElementsByClassName("frame")[0].innerText = "게시글이 존재하지 않습니다.";  */
            /* console.log(mCategoryNo); */
            
           
        },
 
        error : function(){ 
            console.log("에러 발생");
        }
    });  
}



/* 


for (var i = 0; i < categoryName.length; i++) {
    categoryName[i].addEventListener('click', categoryFuncion);
}
 */



