
// select 옵션 값 변경 시 제출
function Condition(){

    var update = document.getElementById("tradeCondition");

    // select element에서 선택된 option의 value가 저장됩니다
    var selectedValue = update.options[update.selectedIndex].value;

    // select element에서 선택된 option의 text가 저장된다.
    var selectedText = update.options[update.selectedIndex].text;

}
