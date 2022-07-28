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

  var mCategoryName; 

function categoryFunction(){   

    let mCategoryNo = this.getAttribute("id");
    mCategoryNo = mCategoryNo.replace("s-","");
    
     mCategoryName = this.getAttribute("name");

    if( document.getElementsByClassName("frame")[0] == undefined){

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
        selectList(mCategoryNo, mCategoryName);
    }
};

/* if(document.getElementById("mCategoryName-space") != null){

    
    categoryFunction;

} */
   



function selectList(mCategoryNo, mCategoryName){

    const nameSpace =  document.getElementById("categoryName-space");
    const nameSpace2 =  document.getElementById("categoryName-space2");

    if(nameSpace != ""){ // main화면에서 ajax로 가져올때 nameSpace 2개 생기는거 방지
    
    nameSpace.innerHTML = "";

    const nameArea = document.createElement("div");
    nameArea.id = "name-area";
    nameArea.innerText = mCategoryName;
    nameSpace.append(nameArea);
  
    }else{

    nameSpace.innerHTML = "";

    const nameArea = document.createElement("div");
    nameArea.id = "name-area";
    nameArea.innerText = mCategoryName;
    nameSpace.append(nameArea);
    } 

    $.ajax({
        url : contextPath + "/selectCategory",  
        data : { "mCategoryNo" : mCategoryNo }, 
        type : "GET", 
        dataType : "JSON",
 
        success : function(itemList){

            if (itemList.length != 0) {
                           

                 document.getElementById("items-section").innerHTML = "";
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
                frame.innerText = "게시글이 존재하지 않습니다." +mCategoryNo ;
                

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




