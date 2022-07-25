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
        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });

};
