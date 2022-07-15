// 미리보기 관련 요소 모두 얻어오기
// -> 동일한 개수의 요소가 존재함 == 인덱스가 일치함
const inputImage = document.getElementsByClassName("inputImage");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");

// 게시글 수정 시 삭제된 이미지의 레벨(위치)를 저장할 input 요소
const deleteList = document.getElementById("deleteList");

// 게시글 수정 시 삭제된 이미지의 레벨(위치)를 기록해둘 Set 생성
const deleteSet = new Set(); // 순서 X, 중복 허용 X (여러번 클릭 시 중복 값 저장 방지)


for(let i=0 ; i<inputImage.length ; i++){

    // 파일이 선택 되었을 때의 동작
    inputImage[i].addEventListener("change", function(){

        if(this.files[0] != undefined){ // 파일이 선택 되었을 때
            const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
            reader.readAsDataURL(this.files[0]);
            // 지정된 파일을 읽음 -> result에 저장(URL 포함) -> URL을 이용해서 이미지 볼 수 있음

            reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
                // e.tartget == redaer
                // e.target.result == 읽어들인 이미지의 URL
                // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
                preview[i].setAttribute("src", e.target.result);

                // 이미지가 성공적으로 불러와졌을 때
                // deleteSet에서 해당 레벨을 제거(삭제 목록에서 제외)
                deleteSet.delete(i);
            }
      
        } else { // 파일이 선택되지 않았을 때 (취소)
            preview[i].removeAttribute("src"); // src 속성 제거
        }
    });



    // 미리보기 삭제 버튼(x)이 클릭 되었을 때의 동작
    deleteImage[i].addEventListener("click", function(){

        // 미리보기가 존재하는 경우에만 (이전에 추가된 이미지가 있을 때만 X버튼 동작)
        if( preview[i].getAttribute("src")  !=  "" ){

            // 미리보기 삭제
            preview[i].removeAttribute("src");

            // input의 값을 "" 만들기
            inputImage[i].value = "";

            // deleteSet에 삭제된 이미지 레벨(i) 추가
            deleteSet.add(i);
        }

    });

}





// 컨트롤러에서 데이터 받기

   

var LCategoryBtn = document.getElementsByName("LCate");

// LCategoryBtn.forEach((target)=> target.addEventListener("click",(target)=>{

//         McategoryList
//         console.log(target.id)
//      }
//     )
// );


LCategoryBtn.forEach((target)=> target.addEventListener("click", McategoryList));



function McategoryList(event){
    
    $.ajax({
        url : contextPath + "/mCategory",  
        data : { "lCategoryNo" : event.target.getAttribute('id') }, 
        type : "GET", 
        dataType : "JSON",
    
        success : function(mCategoryList){ 
            
            document.getElementsByName("category2")[0].innerHTML="";

            for(let mct of mCategoryList){

                const li = document.createElement("li");
                const button =document.createElement("button");

                button.innerHTML=mct.MCategoryName
                button.classList.add("select2");
                
                button.setAttribute('type','button')
                button.setAttribute('id','m'+mct.MCategoryNo)
                button.setAttribute('onclick','mCategoryClick()')
                button.setAttribute('name', 'MCate')

                li.append(button);
                document.getElementsByName("category2")[0].append(li);

                // console.log(mct.MCategoryName)
                // console.log(mct.MCategoryNo)

                var MCategoryBtn = document.getElementsByName("MCate");
                MCategoryBtn.forEach((target)=> target.addEventListener("click", mCategoryClick));

                function mCategoryClick(event){
    
                    document.getElementsByName("mCateValue")[0].value="";
                    console.log(event.target)
                    document.getElementsByName("mCateValue")[0].value = event.target.getAttribute('id');          
                    console.log(document.getElementsByName("mCateValue")[0].value);
                }
                
            }
            
            document.getElementsByName("mCateValue")[0].value = '';
            document.getElementsByName("lCateValue")[0].value='';
            document.getElementsByName("lCateValue")[0].value=event.target.getAttribute('id');

        },
        
        error : function(){ 
            console.log("에러 발생");
        }
        
    })
}








  /* 카테고리 선택 시 값 가져오기 */

$('.select').on('click', function(){
  $('#category4').text($(this).text());
});
$('.select2').on('click', function(){
    $("#category5").html(MCateValue.value);

  });



 
