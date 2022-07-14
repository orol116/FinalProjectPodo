const itemCategory = document.getElementById("item-list");
const reviewCategory = document.getElementById("review-category");

const reviewList = document.getElementById("reviews-area");
const itemList = document.getElementById("seller-items");



selectItemsList();
itemCategory.addEventListener("click", selectItemsList);

/* 상품 ajax */
function selectItemsList(){

    $.ajax({
        url : "selectItemsList",
        data : {"memberNo" : memberNo},
        type : "GET",
        dataType : "JSON",
        success : function(iList){
            console.log(iList);

            itemList.innerHTML = "";

            reviewList.style.display = "none";
            itemList.style.display = "block";

            if (iList == "") {
                const itembox = document.createElement("div");
                itembox.classList.add("box");
                
                itembox.innerText = "판매중인 상품이 없습니다.";

            reviewList.style.display = "none";
            itemList.style.display = "block";
            itembox.style.border = "none";
            
            itemList.style.fontSize = "20px";

                
                itemList.append(itembox);
            } else {

                for(let item of iList){
                
                    const itembox = document.createElement("div");
                    itembox.classList.add("box");

                    const mainTitle = document.createElement("a");
                    mainTitle.classList.add("title");

                    const imageArea = document.createElement("div");
                    imageArea.classList.add("image");

                    const itemImage = document.createElement("image");

                    const title1 = document.createElement("div");
                    title1.classList.add("title1")

                    const title2 = document.createElement("div");
                    title2.classList.add("title2");
                    title2.innerText = item.boardTitle;

                    const name2 = document.createElement("div");
                    name2.classList.add("name2");

                    const price = document.createElement("div");
                    price.classList.add("price");
                    price.innerText = item.price;

                    const time = document.createElement("div");
                    time.classList.add("time");
                    time.innerText = item.updateDate

                    name2.append(price, time);

                    title1.append(title2,name2 );

                    imageArea.append(itemImage);

                    mainTitle.append(imageArea, title1);

                    itembox.append(mainTitle);

                    itemList.append(itembox);
                    
                }
            }




        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }


    });

}


reviewCategory.addEventListener("click", reviewsList);



/* 후기 ajax */
function reviewsList(){

    $.ajax({
        url : "selectReviewsList",
        data : {"memberNo" : memberNo},
        type : "GET",
        dataType : "JSON",
        success : function(rList){
            console.log(rList);

            reviewList.innerHTML = "";
            itemList.innerHTML = "";
            reviewList.style.display = "flex";
            itemList.style.display = "none";


            if(rList == "") {
                reviewList.innerText = "내 후기가 없습니다.";
                
                
                reviewList.style.fontSize = "20px";
                reviewList.style.height = "320px";
                reviewList.style.padding = "30px 0 40px 0";
                

                
            } else {
                for(let review of rList){
                    
                    const reviewBox = document.createElement("section");
                    reviewBox.id = "user-reviews";

                    const reviewRow = document.createElement("div");
                    reviewRow.id = "reviews-top";

                    const writerImage = document.createElement("img");
                    writerImage.id = "reviews-image";

                    const writerName = document.createElement("div");
                    writerName.id = "reviews-user-nick";

                    const DTArea = document.createElement("div");
                    DTArea.id = "create-date-area";

                    const createDate = document.createElement("div");
                    createDate.id = "reviews-create-date";

                    DTArea.append(createDate);

                    reviewRow.append(writerImage, writerName, DTArea);

                    const shortReview = document.createElement("div");
                    shortReview.id = "reviews-shorts";
                    shortReview.innerText = review.reviewContent;

                    // const textReview = document.createElement("div");
                    // textReview.id = "reviews-user-text";

                    const footReview = document.createElement("div");
                    footReview.id = "reviews-footer";

                    const itemReview = document.createElement("div");
                    itemReview.id = "reviews-user-item";
                    itemReview.innerText = review.boardTitle;

                    const btnArea = document.createElement("div");
                    btnArea.id = "hideBtn-area";

                    const hideBtn = document.createElement("button");
                    hideBtn.id = "hideBtn";
                    hideBtn.innerText = "후기 숨기기";
                    

                    btnArea.append(hideBtn);
                    footReview.append(itemReview,btnArea);

                    reviewBox.append(reviewRow,shortReview, textReview,footReview);

                    
                    reviewList.append(reviewBox);
                }
            }




        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }


    });

}



