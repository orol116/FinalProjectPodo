var update = document.getElementById("tradeCondition");


// select 옵션 값 변경 시 제출
function tradeCondition(changeVal){
    
    var condition = $("#changeCondition > option:selected").attr("value");
    var boardNo = $("#changeCondition > option:selected").attr("value2");
    /* var indexNo = update[0].selectedIndex;

    console.log(indexNo);

    document.forms["tradeCondition"].submit();

    // // select element에서 선택된 option의 value가 저장됩니다
    // var selectedValue = update.options[update.selectedIndex].value;

    // // select element에서 선택된 option의 text가 저장된다.
    // var selectedText = update.options[update.selectedIndex].text; */

    $.ajax({
        url : contextPath + "/shop/main/tradeCondition",

        data : {"boardNo" : boardNo,
                "condition" : condition},

        type: "POST",

        success : function(result) {
            if (result > 0) {
                alert("상품 상태가 변경되었습니다.");
            } else {
                alert("상태 변경에 실패하였습니다.");
            }
        },

        error : function(){
            alert("에러 발생");
        }

    });

}



// 끌올 기능 ajax
function update(){

    $.ajax({
        url : "itemManage",
        data : {"updateDate":updateDate,
                "tradeContition" : tradeContition},
        type: "POST",
        success : function(result){
            if(update[2]||update[4]){
                alert("예약중/판매완료 상품은 UP하기를 이용할 수 없습니다.");
            }else{
                alert("해당 상품이 UP되었습니다.");
            }
            
        },
        error : function(){
            alert("UP 실패, 관리자에게 문의하세요.");
        }

    });

};
