function init(){
    $('.sellContents').show();
    $('.buyContents').hide();
}

function showSellList(){
    $('.sellContents').show();
    $('.buyContents').hide();
}

function showBuyList(){
    $('.buyContents').show();
    $('.sellContents').hide();
}

// 구매/판매 내역
function selectTradeCondition(type){

    $.ajax({
        url : contextPath + "/shop/myMall/selectList", 
        data : { "memberNo" : memberNo, 
                 "type" : type},
        
        type : "GET", // 데이터 전달 방식 type

        success : function(itemList){
            console.log(itemList);

            /* 거래 내역 화면 구성 */

            if(itemList.length == 0){
                let purchasesinfo = document.createElement("div");
                purchasesinfo.classList.add("purchases-info");
                purchasesinfo.innerText = "판매 내역이 없습니다.";
            }

            if(itemList.length != 0){
                for(let i=0; i<itemList.length; i++){
                    
                    /* li 태그 */
                    let iList = document.createElement("li");
                    iList.classList.add("fav-list");

                    /* 상품 이미지 div */
                    let history = document.createElement("div");
                    history.classList.add("history"); 

                    if(itemList.length != null){
                        let itemImage = document.createElement("img");
                        itemImage.classList.add("item-image");
                    }

                    /* 상품 정보 div */
                    let productSummaryCard = document.createElement("div");
                    productSummaryCard.classList.add("productSummaryCard");

                    /* 상품 정보 p 태그 */
                    let p = document.createElement("p");
                    productSummaryCard.append(p);

                    /* 상품 정보 span 태그(제목, 가격, 등록일, 조회수) */

                    /* 제목 */
                    let span = document.createElement("span");
                    span.innerText = "제목";
                    span.append(itemList.boardTitle);
                    span.innerText = "";

                    /* span.prepend("<span>제목</span>")
                    span.setAttribute(itemList.boardTitle); */


                    /* 가격 */
                    span.innerText = "가격";
                    span.append(itemList.price + "원");
                    span.innerText = "";

                    /* 등록일 */
                    span.innerText = "등록일";
                    span.append(itemList.updateDate);
                    span.innerText = "";

                    /* 조회수 */
                    span.innerText = "조회수";
                    span.append(itemList.readCount);
                    span.innerText = "";

                    /* 삭제 버튼 div 영역 */
                    let del = document.createElement("div");
                    del.classList.add("delete");

                    /* 삭제 버튼 */
                    let delBtn = document.createElement("button");
                    delBtn.classList.add("delete-btn");
                    del.append(delBtn);
                }


            }

        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });

};


