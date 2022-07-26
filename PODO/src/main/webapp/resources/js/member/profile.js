const itemCategory = document.getElementById("item-list");
const reviewCategory = document.getElementById("review-category");

const reviewList = document.getElementById("reviews-area");
const itemList = document.getElementById("seller-items");

if (loginMemberNo == member2) {
    document.getElementById("user-intro-change").style.display = '';
    document.getElementById("item-report").style.display = 'none';
} else {
    document.getElementById("user-intro-change").style.display = 'none';
    document.getElementById("item-report").style.display = '';
}

selectItemsList();
itemCategory.addEventListener("click", selectItemsList);


function selectItemsList() {

    console.log(member2);

    $.ajax({
        url: contextPath + "/shop/selectItemsList/" + member2,
        type: "GET",
        dataType: "JSON",
        success: function (iList) {
            console.log(iList);

            itemList.innerHTML = "";

            reviewList.style.display = "none";
            itemList.style.display = "block";

            if (iList == "") {
                const itembox = document.createElement("div");
                itembox.classList.add("box");

                itembox.innerText = "등록된 상품이 없습니다.";

                reviewList.style.display = "none";
                itemList.style.display = "block";
                itembox.style.border = "none";

                itemList.style.fontSize = "20px";


                itemList.append(itembox);


            } else {

                let itemContainer;

                for (let k = 0; k < iList.length; k++) {

                    if(k % 4 == 0){
                        itemContainer = document.createElement("div");
                        itemContainer.classList.add("itemContainer");
                        itemContainer.style.display = "flex";

                        itemList.append(itemContainer);
                    }


                    const itembox = document.createElement("div");
                    itembox.classList.add("box");
                    itembox.style.margin = "10px 15px 10px 15px";
                    itembox.style.paddingLeft = "2px";
                    /* const boxNumber = 1;
                    boxNumber++; */

                    const mainTitle = document.createElement("a");
                    mainTitle.classList.add("title");
                    mainTitle.setAttribute('href',contextPath + '/board/detail/'+iList[k].boardNo);

                    const imageArea = document.createElement("div");
                    imageArea.classList.add("image");

                    const itemImage = document.createElement("img");
                    if(iList[k].imageList[0] != null){
                        itemImage.setAttribute('src', contextPath+iList[k].imageList[0].imageReName);
                    }else{
                        itemImage.setAttribute('src','resources/images/items/image1.jpg');
                    }

                    const title1 = document.createElement("div");
                    title1.classList.add("title1");

                    const title2 = document.createElement("div");
                    title2.classList.add("title2");
                    title2.innerText = iList[k].boardTitle;

                    const name2 = document.createElement("div");
                    name2.classList.add("name2");

                    const price = document.createElement("div");
                    price.classList.add("price");
                    price.innerText = iList[k].price;

                    const time = document.createElement("div");
                    time.classList.add("time");
                    time.innerText = iList[k].updateDate;

                    name2.append(price, time);

                    title1.append(title2, name2);

                    imageArea.append(itemImage);

                    mainTitle.append(imageArea, title1);

                    itembox.append(mainTitle);

                    itemContainer.append(itembox);

                }

            }

        },
        error: function (req, status, error) {
            console.log("에러 발생");
            console.log(req.responseText);
        }


    });

}


reviewCategory.addEventListener("click", reviewsList);



/* 후기 ajax */
function reviewsList() {

    $.ajax({
        url: contextPath + "/shop/selectReviewsList/" + member2,
        data: { "memberNo": member2 },
        type: "GET",
        dataType: "JSON",
        success: function (rList) {


            console.log(rList);

            reviewList.innerHTML = "";
            itemList.innerHTML = "";
            reviewList.style.display = "flex";
            itemList.style.display = "none";


            if (rList == "") {
                reviewList.innerText = "등록된 후기가 없습니다.";


                reviewList.style.fontSize = "20px";
                reviewList.style.height = "320px";
                reviewList.style.padding = "30px 0 40px 0";



            } else {
                for (let review of rList) {

                    const reviewBox = document.createElement("section");
                    reviewBox.id = "user-reviews";

                    const reviewRow = document.createElement("div");
                    reviewRow.id = "reviews-top";

                    const writerImage = document.createElement("img");
                    writerImage.id = "reviews-image";
                    if (review.memberProfile == null) writerImage.src = imageSrc;
                    else writerImage.src = review.memberProfile;

                    const writerName = document.createElement("div");
                    writerName.id = "reviews-user-nick";
                    writerName.innerText = review.memberNickname;

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
                    
                    footReview.append(itemReview);

                    reviewBox.append(reviewRow, shortReview, footReview);


                    reviewList.append(reviewBox);
                }
            }




        },
        error: function (req, status, error) {
            console.log("에러 발생");
            console.log(req.responseText);
        }


    });

}



