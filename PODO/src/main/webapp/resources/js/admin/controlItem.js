// 전체선택
function selectAll(selectAll){
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach((checkbox)=>{checkbox.checked=selectAll.checked})
};

// 삭제 버튼 누를 때
(function(){
    const deleteBtn = document.getElementById("deleteBtn"); 

    if(deleteBtn != null){// 버튼이 화면에 존재할때
        deleteBtn.addEventListener("click", function(){

            return true;
        });
    }
})();

// form onsubmit return
function ckBox() {
   
const deleteBtn = document.getElementById("deleteBtn");
let itemBoard = document.querySelectorAll("[name='itemList']:checked");

let deleteNo = [];

// 작성글

if(document.querySelectorAll("[name='itemList']").length != 0 ){

     if(!confirm("정말로 삭제 하시겠습니까?")){
        return false;
    }

    // 체크박스 선택 안됐을때, 
    if(document.querySelectorAll("[name='itemList']:checked").length == 0){
        alert("삭제할 상품을 선택해주세요.");
        return false;
     }

    for(let b of memList){
        deleteNo.push( b.value );
    }
}
    document.getElementById("deleteNo").value = deleteNo.join(","); // 1,2,3
    
    return true;
  


}

// 검색 유효성 검사(검색어를 입력 했는지 확인)
function searchValidate(){

    const query = document.getElementById("search-query");

    if(query.value.trim().length == 0){ // 미작성
        query.value = ""; // 빈칸
        query.focus();

        return false;
    }

    return true;
}