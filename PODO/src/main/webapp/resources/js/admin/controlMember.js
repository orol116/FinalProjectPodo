// 전체선택
function selectAll(selectAll){
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach((checkbox)=>{checkbox.checked=selectAll.checked})
};

(function(){
    const deleteBtn = document.getElementById("deleteBtn"); 

    if(deleteBtn != null){// 버튼이 화면에 존재할때
        deleteBtn.addEventListener("click", function(){


            return true;
        });
    }
})();


// 체크박스 선택 안됐을때, 
function ckBox() {
    if(!confirm("정말로 삭제 하시겠습니까?")){
        return false;
    }

const deleteBtn = document.getElementById("deleteBtn");
let memBoard = document.querySelectorAll("[name='memList']:checked");

let deleteNo = [];

// 작성글
if(document.querySelectorAll("[name='memList']").length != 0 ){
     if(memList.length == 0){
        alert("삭제할 글을 선택해주세요.");
        return false;
     }

    for(let b of memList){
        deleteNo.push( b.value );
    }
}
    document.getElementById("deleteNo").value = deleteNo.join(","); // 1,2,3
    
    return true;
  


}