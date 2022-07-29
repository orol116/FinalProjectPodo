function init(){
    /* $('.sellContents').show();
    $('.buyContents').hide(); */
    selectTradeCondition(1);
    
    let sellListBtn = document.getElementById("sellList");
    sellListBtn.classList.add("selected"); 

    let statusBtn = document.getElementById("whole");
    statusBtn.classList.add("selected");
}

// 구매/판매 내역
function selectTradeCondition(type){

    document.getElementsByClassName("sellContents")[0].innerHTML = "";

    console.log("버튼 타입(1:판매, 2:예약중, 3:판매중, 4:판매완료, 5:구매) : " + type);
    
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

                    /* overlay */
                    let overlayCard = document.createElement("span");
                    overlayCard.classList.add("overlayCard");

                    let overlayImg = document.createElement("img");
                    overlayImg.innerText = "판매완료";

                    let overlayTitle = document.createElement("p");
                    overlayTitle.classList.add("overlayTitle");
                    overlayTitle.innerText = "판매완료";
                    
                    thumb.append(overlayCard);
                    overlayCard.append(overlayTitle);

                    /* ------오버레이------- */

                    /* 판매-전체상태 */
                    if(type==1){
                        /* $(".overlayCard").hide();
                        $(".overlayTitle").hide();
                        */
                       if(type==2){
                            overlayTitle.innerText = "예약 중";
                       }
                       if(type==3){
                            overlayTitle.innerText = "판매 중";
                       }
                       if(type=4){
                            $(function() {
                                $('.overlayTitle').before('<img src="/podo/resources/images/transactionCompleted.png" class="overlay" />');
                            });
                       }    
                    }

                    /* 예약중 */
                    if(type==2){
                        /* const overlayTitle = document.getElementsByClassName('overlayTitle'); */
                        /* document.querySelector('.overlayTitle').id = 'overlayTitle'; */
                        /* $(function(){
                            $(".overlayCard").hide();
                            $(".overlayTitle").hide();
                            
                        }); */
                        overlayTitle.innerText = "예약 중";
                    }
                    
                    /* 판매중 */
                    if(type==3){
                        overlayTitle.innerText = "판매 중";
                    }
                    
                    /* 판매완료 */
                    if(type==4){
                        $(function() {
                            $('.overlayTitle').before('<img src="/podo/resources/images/transactionCompleted.png" class="overlay" />');
                        });
                    }
                    
                    /* 구매 */
                    if(type==5){
                        overlayTitle.innerText = "구매완료";
                    }
                    /* --------------------- */

                    
                    /* $(function() {
                        $('.overlayTitle').before('<img src="/podo/resources/images/transactionCompleted.png" class="overlay" />');
                    }); */

                    
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
    
    const category = document.querySelector('.category');

    function select(liEl, button2El){
        Array.from(liEl.children).forEach(
            v => v.classList.remove('selected')
        )
        if(button2El) button2El.classList.add('selected');
    }

    category.addEventListener('click', e => {
        const selected = e.target;
        select(category, selected);
        
    })

    /* 구매 버튼 클릭 시 nav 영역 none, block 처리 */
    const pCategory = document.getElementById('purchases-category');

    if(type==5){
        pCategory.style.display = 'none';
    }else{
        pCategory.style.display = 'block';
    }

    

        
    /* 판매, 구매 버튼 클릭시 색상 변경 */
    /* const category = document.querySelector('.category');

    function select(ulEl, liEl){
        Array.from(ulEl.children).forEach(
            v => v.classList.remove('selected')
        )
        if(liEl) liEl.classList.add('selected');
    }

    category.addEventListener('click', e => {
        const selected = e.target;
        select(category, selected);
        
    }) */

    

    /* -------------------------------------------------------- */

    /* 정렬 카테고리 버튼 클릭시 색상 변경 */
    // 클릭 : .clicked, 그외 : .cstatus
    const menuWrap = document.querySelector('.menu-wrap');
    
    function select(divEl, buttonEl){
        Array.from(divEl.children).forEach(
            v => v.classList.remove('selected')
        )
        if(buttonEl) buttonEl.classList.add('selected');
    }
   
    menuWrap.addEventListener('click', e => {
        const selected = e.target;
        select(menuWrap, selected);
    })

};


