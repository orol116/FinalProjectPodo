if (location.href == "http://localhost:8080/podo/main") { 
    history.pushState(null, null, "http://localhost:8080/podo")

    selectList2(mcNo);
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

  var mCategoryName; 

function categoryFunction(){   

    let mCategoryNo = this.getAttribute("id");
    mCategoryNo = mCategoryNo.replace("s-","");
    
     mCategoryName = this.getAttribute("name");

    if( document.getElementById("go-topBtn") == null){

        const form = document.createElement("form");
        form.setAttribute("action", contextPath+"/main");
        form.setAttribute("method", "post");
        form.style.display = "none";
        
        const input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", "mCategoryNo");
        input.setAttribute("value", mCategoryNo);

        const inputName = document.createElement("input");
        inputName.setAttribute("type", "hidden");
        inputName.setAttribute("name", "mCategoryName");
        inputName.setAttribute("value", mCategoryName);

        const footer = document.getElementsByTagName("footer")[0];

        
        form.append(input,inputName);
        
        footer.append(form);
        form.submit();
        

    }else{
        selectList2(mCategoryNo, mCategoryName);
    }
};
   

const categorySection = document.getElementById("categoryDelete-section"); // 카테고리 외 다른 section들
// const cHeader = document.getElementById("category-header-a"); // 카테고리제목
const itemsSection = document.getElementById("items-section");

function selectList2(mCategoryNo, mCategoryName){

    
    /* cHeader.innerText = mCategoryName; */

    $.ajax({
        url : contextPath + "/selectCategory",  
        data : { "mCategoryNo" : mCategoryNo },
        type : "GET", 
        dataType : "JSON",
 
        success : function(itemList){
            let frame;

            if (itemList.length != 0) {
                
                 categorySection.innerHTML = "";
                 itemsSection.innerHTML = "";
                 itemsSection.style.display = "block";
                
                categorySection.innerHTML = "";
                
                const categoryHeader = document.createElement("div");
                categoryHeader.classList.add = "categoryHeader";


                const cHeader = document.createElement("h2");
                cHeader.id = "category-header-a";
                cHeader.style.color = "black";
                categoryHeader.append(cHeader);
                itemsSection.append(categoryHeader);
                if(mCatName == ""){
                    cHeader.innerText = mCategoryName + "   카테고리 >";
                    
                }else{
                    cHeader.innerText = mCatName + "   카테고리 >";
                    mCatName = "";
                }


                for (let k = 0; k < itemList.length; k++) {

                    if(k % 5 == 0){
                        frame = document.createElement("div");
                        frame.classList.add("frame");
                        frame.style.marginTop = "20px";
                        document.getElementById("items-section").append(frame);
                        
                    }

                    const itembox = document.createElement("div");
                    itembox.classList.add("boxx");
                    itembox.style.width = "225.02px";
                    itembox.style.boxSizing = "border-box";
                    itembox.style.marginRight = "10.5px";
                    /* const boxNumber = 1;
                    boxNumber++; */

                    const mainTitle = document.createElement("a");
                    mainTitle.classList.add("title");
                    mainTitle.setAttribute('href',contextPath + '/board/detail/'+itemList[k].boardNo);
                    mainTitle.style.width = "230px";
                    const imageArea = document.createElement("div");
                    imageArea.classList.add("image");

                    const itemImage = document.createElement("img");
                    if(itemList[k].imageList[0] != null){
                        itemImage.setAttribute('src', contextPath+itemList[k].imageList[0].imageReName);
                    }else{
                        itemImage.setAttribute('src','resources/images/items/image1.jpg');
                    }
                    

                    const title1 = document.createElement("div");
                    title1.classList.add("title1");
                    title1.style.marginRight = "0";

                    const title2 = document.createElement("div");
                    title2.classList.add("title2");
                    title2.innerText = itemList[k].boardTitle;

                    const name2 = document.createElement("div");
                    name2.classList.add("name2");

                    const price = document.createElement("div");
                    price.classList.add("price");
                    price.innerText = itemList[k].price + "원";

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
                
            }else {

                itemsSection.style.display = "block";
                itemsSection.innerHTML = "";
                categorySection.innerHTML = "";
                frame = document.createElement("div");
                frame.classList.add("frame");

                frame.innerText = "게시글이 존재하지 않습니다. ";
                const categoryHeader = document.createElement("div");
                categoryHeader.classList.add = "categoryHeader";


                const cHeader = document.createElement("h2");
                cHeader.id = "category-header-a";
                cHeader.style.color = "black";
                categoryHeader.append(cHeader);
                itemsSection.append(categoryHeader);

                if(mCatName == ""){
                    cHeader.innerText = "   카테고리 >  " + mCategoryName;
                    
                }else{
                    cHeader.innerText = "   카테고리 >  " + mCatName ;
                    mCatName = "";
                }

                document.getElementById("items-section").append(frame);
                
            }
             /* document.getElementsByClassName("frame")[0].innerText = "게시글이 존재하지 않습니다.";  */
            /* console.log(mCategoryNo); */
            /* if(mainNameSpace != ""){
                nameSpace.innerHTML = "";
            } */
         
            
           
        },
 
        error : function(){ 
            console.log("에러 발생");
        }
    });  
}




