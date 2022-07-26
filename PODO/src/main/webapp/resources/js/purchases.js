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

            /* 거래 내역 화면 구성 */
            /* let purchasesContents = document.createElement("div");
            purchasesContents.classList.add("purchases-contents"); */

            /* 출력 할 div 영역 */
            let content = document.createElement("div");
            content.classList.add("sellContents");
            
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
                for(let i of itemList){
                    
                    /* li 태그 */
                    let li = document.createElement("li");
                    li.classList.add("fav-list");

                    /* 상품 이미지 div */
                    let thumb = document.createElement("div");
                    thumb.classList.add("thumb"); 
                    li.append(thumb);

                    if(i.length != null){
                        let itemImage = document.createElement("img");
                        itemImage.classList.add("item-image");
                        itemImage.src = contextPath + i.imageReName;
                        thumb.append(itemImage);
                    }

                    /* 상품 정보 div */
                    // div : gdsInfo
                    let purchasesInfo = document.createElement("div");
                    purchasesInfo.classList.add("purchasesInfo");

                    /* 상품 정보 p 태그 */
                    let p = document.createElement("p");
                    
                    /* 상품 정보 span 태그(제목, 가격, 등록일, 조회수) */
                    /* 제목 */
                    let span1 = document.createElement("span");
                    let span2 = document.createElement("span");
                    let span3 = document.createElement("span");
                    let span4 = document.createElement("span");

                    
                    span1.innerHTML = "제목" + i.boardTitle;
                    span2.innerHTML = "가격" + i.price;
                    span3.innerHTML = "등록일" + i.updateDate;
                    span4.innerHTML = "조회수" + i.readCount;

                    p.append(span1);
                    p.append(span2);
                    p.append(span3);
                    p.append(span4);

                    purchasesInfo.append(p);
                    li.append(purchasesInfo);
                    content.append(li);
                }
                
                let purchasesContents = document.createElement("div");
                purchasesContents.classList.add("purchases-contents");
             
                purchasesContents.append(content);
            }
            
        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });

};


