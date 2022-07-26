/* 페이지 로드 시 판매 영역 보여주기 */
function init(){
    $('.sellContents').show();
    $('.buyContents').hide();
}

/* 판매 */
function showSellList(){
    $('.sellContents').show();
    $('.buyContents').hide();
}

/* 구매 */
function showBuyList(){
    $('.buyContents').show();
    $('.sellContents').hide();
}

var reviewCount = 0;

// 구매/판매 내역
function selectTradeCondition(type){

    $.ajax({
        url : contextPath + "/shop/myMall/selectList", 
        data : { "memberNo" : memberNo, 
                 "type" : type},
        
        type : "GET", // 데이터 전달 방식 type

        success : function(itemList){
            console.log(itemList);

            sellContents = document.getElementById("sellContents");
            

            /* 거래 내역 화면 구성 */
            let purchasesContents = document.createElement("div");
            purchasesContents.classList.add("purchases-contents");

            let content = document.createElement("div");
            content.classList.add("sellContents");
            purchasesContents.append(content);
            sellContents.append(purchasesContents);
            
            if(itemList.length == 0){
                let div = document.createElement("div");
                content.append(div);

                let purchasesinfo = document.createElement("div");
                purchasesinfo.classList.add("purchases-info");
                purchasesinfo.innerText = "판매 내역이 없습니다.";
                /* document.getElementsByClassName("sellContents").append(purchasesinfo); */
                div.append(purchasesinfo);
            }else{

            /* if(itemList.length != 0){ */
                for(let i=0; i<itemList.length; i++){
                    
                    /* li 태그 */
                    let iList = document.createElement("li");
                    iList.classList.add("fav-list");

                    /* 상품 이미지 div */
                    let thumb = document.createElement("div");
                    thumb.classList.add("thumb"); 
                    iList.append(thumb);

                        if(itemList.length != 0){
                            let itemImage = document.createElement("img");
                            itemImage.classList.add("item-image");
                            itemImage.setAttribute("src", 'resources/images/items/image1.jpg');
                            thumb.append(itemImage);
                        }

                    /* 상품 정보 div */
                    // div : gdsInfo
                    let purchasesInfo = document.createElement("div");
                    purchasesInfo.classList.add("purchasesInfo");
                    iList.append(purchasesInfo);

                    /* 상품 정보 p 태그 */
                    let itemInfo = document.createElement("div");
                    purchasesInfo.append(itemInfo);

                    /* 상품 정보 span 태그(제목, 가격, 등록일, 조회수) */
                    /* 제목 */
                    const spanName = document.createElement("span");
                    spanName.classList.add("spanName");
                    spanName.innerText = "제목 :" + itemList.boardTitle;
                    

                    const spanPrice = document.createElement("span");
                    spanPrice.classList.add("spanPrice");
                    spanPrice.innerText = "가격 : " + itemList[i].price;
                    /* 가격 */


                    /* 등록일 */
                    const spanDate = document.createElement("span");
                    spanDate.classList.add("spanDate");
                    spanDate.innerText = "등록일 : " + itemList[i].updateDate;

                    /* 조회수 */
                    const spanCount = document.createElement("span");
                    spanCount.classList.add("spanCount");
                    spanCount.innerText = "조회수 : " + itemList.readCount;
                    
                    itemInfo.append(spanName,spanPrice,spanDate,spanCount);

                    content.append(iList);
                }


            }

        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });

};


