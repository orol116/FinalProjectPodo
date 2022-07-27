function init(){
    /* $('.sellContents').show();
    $('.buyContents').hide(); */
    selectTradeCondition(1);
}

$("#buyList").click(function(){
    $("#.reserving").hide();
    $("#.selling").hide();
    $("#.selled").hide();
});



/* 판매 */
/* function showSellList(){
    $('.sellContents').show();
    $('.buyContents').hide();
} */

/* 구매 */
/* function showBuyList(){
    $('.buyContents').show();
    $('.sellContents').hide();
} */


// 구매/판매 내역
function selectTradeCondition(type){

    document.getElementsByClassName("sellContents")[0].innerHTML = "";

    console.log("버튼 타입(1:판매, 2:예약중, 3:판매중, 4:판매완료, 5:구매) : " + type);

    // 정렬 카테고리 버튼 클릭 효과
    /* if(type == 클릭){
        클릭 효과 css 적용 = 배경색보라
        나머지 배경색 x

        css 이미 있음
    } */

    $.ajax({
        url : contextPath + "/shop/myMall/selectList", 
        data : { "memberNo" : memberNo, 
                 /* "boardNo" : boardNo, */
                 "type" : type},
        dataType : "JSON",
        type : "GET", // 데이터 전달 방식 type

        success : function(itemList){
            

            console.log(itemList);

            console.log(itemList.boardNo);
            console.log(itemList.imageReName);

            let sellContents = document.getElementById("sellContents");

            /* 거래 내역 화면 구성 */
            let purchasesContents = document.createElement("div");
            purchasesContents.classList.add("purchases-contents");

            let content = document.createElement("div");
            content.classList.add("sellContents");
            
            purchasesContents.append(content);
            
            /* section 태그 */
            let section = document.createElement("section");
            section.classList.add("section-content")
            content.append(section);
            
            /* ul 태그 */
            let ul = document.createElement("ul");
            section.append(ul);
            
            if(itemList.length == 0){
                let div = document.createElement("div");
                content.append(div);

                let purchasesinfo = document.createElement("div");
                purchasesinfo.classList.add("purchases-info");
                purchasesinfo.innerText = "판매 내역이 없습니다.";
                div.append(purchasesinfo);
            }else{

                for(let i=0; i<itemList.length; i++){

                    /* li 태그 */
                    let iList = document.createElement("li");
                    iList.classList.add("fav-list");
                    ul.append(iList);
                    
                    /* 상품 이미지 div */
                    let thumb = document.createElement("div");
                    thumb.classList.add("thumb"); 
                    iList.append(thumb);
                    
                    /* 이미지 div태그 하위 img 태그 */
                    let itemImage = document.createElement("img");
                    itemImage.classList.add("item-image");
                    itemImage.src = contextPath + itemList[i].imageReName;
                    thumb.append(itemImage);
                    
                    /* 상품 정보 div */
                    // div : gdsInfo
                    let purchasesInfo = document.createElement("div");
                    purchasesInfo.classList.add("purchasesInfo");
                    iList.append(purchasesInfo);
                    
                    /* 상품 정보 p 태그 */
                    /* let itemInfo = document.createElement("div");
                    purchasesInfo.append(itemInfo); */
                    let p = document.createElement("p");
                    purchasesInfo.append(p);

                    /* 상품 정보 span 태그(제목, 가격, 등록일, 조회수) */
                    /* 제목 */
                    const spanName = document.createElement("span");
                    spanName.classList.add("spanName");
                    spanName.innerHTML = "제목 : " + itemList[i].boardTitle;
                    
                    
                    const spanPrice = document.createElement("span");
                    spanPrice.classList.add("spanPrice");
                    spanPrice.innerHTML = "가격 : " + itemList[i].price + " 원";
                    /* 가격 */
                    
                    
                    /* 등록일 */
                    const spanDate = document.createElement("span");
                    spanDate.classList.add("spanDate");
                    spanDate.innerHTML = "등록일 : " + itemList[i].updateDate;
                    
                    /* 조회수 */
                    const spanCount = document.createElement("span");
                    spanCount.classList.add("spanCount");
                    spanCount.innerHTML = "조회수 : " + itemList[i].readCount;
                    
                    
                    
                    p.append(spanName,spanPrice,spanDate,spanCount );
                    
                    
                    
                    sellContents.append(purchasesContents);
                }
                
                
                
            }
            
        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });
    
    var sellList = document.getElementById("sellList");
    var buyList = document.getElementById("sellList");

    var sellSelect = sellList.parentNode;
    var buySelect = buyList.parentNode;

    /* 구매 버튼 클릭 시 */
    if(type==5){
        $("#reserving").hide();
        $("#selling").hide();
        $("#selled").hide();

        sellSelect.classList.remove();
        buySelect.classList.add("selected");


        $(".category:nth-of-type(1)").classList.remove();
        $(".category:nth-of-type(2)").classList.add("selected");

    }else{
        $("#reserving").show();
        $("#selling").show();
        $("#selled").show();
    }

};


