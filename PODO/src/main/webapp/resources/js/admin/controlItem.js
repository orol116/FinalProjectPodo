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


// 삭제 버튼 누를 때
function ckBox() {
    if(!confirm("정말로 삭제 하시겠습니까?")){
        return false;
    }   

const deleteBtn = document.getElementById("deleteBtn");
let itemBoard = document.querySelectorAll("[name='itemList']:checked");

let deleteNo = [];

// 작성글

if(document.querySelectorAll("[name='itemList']").length != 0 ){


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



// 검색창에 이전 검색기록 반영하기
(function(){
    const select = document.getElementById("search-key");

    // const option = select.children;
    const option = document.querySelectorAll("#search-key > option");

    const input = document.getElementById("search-query");

    if(select != null){ // 검색창이 화면이 존재할 때에만 코드 적용

        // 현재 주소에서 쿼리스트링(파라미터) 얻어오기
        const params = new URL(location.href).searchParams;

        // 얻어온 파라미터 중 key, query만 변수에 저장
        const key = params.get("key");
        const query = params.get("query");

        // input에 query 값 대입
        input.value = query;

        // option을 반복 접근해서 value와 key가 같으면 selected 속성 추가
        for(let op of option){
            if(op.value == key ){
                op.selected = true;
            }
        }
    }

})();


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