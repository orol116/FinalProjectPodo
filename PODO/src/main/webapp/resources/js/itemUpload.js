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
            preview[i].setAttribute("src",contextPath+"/resources/images/image.png");

            // input의 값을 "" 만들기
            inputImage[i].value = "";

            // deleteSet에 삭제된 이미지 레벨(i) 추가
            deleteSet.add(i);
        }

    });

}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(37.537187, 127.005476),
map: map
});

let dLat = "";
let dLon = "";


function sample5_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample5_address").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);

                    dLon = result.x;
                    dLat = result.y;

                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords);
                    
                }
            document.getElementById("dLon").value = dLon;
            document.getElementById("dLat").value = dLat;
            });
        }
    }).open();
}


document.getElementById('myPlace').addEventListener('click',()=>{

    $.ajax({
        url : contextPath + "/myPlace",  
        data : { "memberNo" : memberNo }, 
        type : "GET", 
        dataType : "JSON",
        success : function(myPlace){ 

            console.log(myPlace.myPlaceXY.dLon);
            console.log(myPlace.myPlaceXY.dLat);
            console.log(myPlace.myAddr);

            document.getElementById("dLon").value = myPlace.myPlaceXY.dLon;
            document.getElementById("dLat").value = myPlace.myPlaceXY.dLat;
            document.getElementById("sample5_address").value = myPlace.myAddr;

        },
        error: function(){
            console.log('내위치 불러오는 중에 문제 발생')
        }

    })
})






// 컨트롤러에서 데이터 받기
var LCategoryBtn = document.getElementsByClassName('category1-1')[0];
LCategoryBtn.addEventListener('click', McategoryList);

// var LCategoryBtn = document.getElementsByName("LCate");
// LCategoryBtn.forEach((a)=> a.addEventListener("click", McategoryList));


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

                button.innerHTML=mct.MCategoryName;
                button.classList.add("select2");
                
                button.setAttribute('type','button')
                button.setAttribute('id','m'+mct.MCategoryNo)
                // button.setAttribute('onclick','mCategoryClick()')
                button.setAttribute('name', 'MCate')

                li.append(button);
                document.getElementsByName("category2")[0].append(li);

                console.log(mct.MCategoryName)
                console.log(mct.MCategoryNo)

                var MCategoryBtn = document.getElementsByName("MCate");
                MCategoryBtn.forEach((target)=> target.addEventListener("click", mCategoryClick));

                function mCategoryClick(event){
    
                    document.getElementsByName("mCateValue")[0].value='';
                    // console.log(event.target) 
                    document.getElementsByName("mCateValue")[0].value =   event.target.getAttribute('id').substring(1);          
                    // console.log(document.getElementsByName("mCateValue")[0].value);
                    
                      /* 카테고리 선택 시 중분류 값 표기 */
                    $('#category5').text($(this).text());
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

     /* 카테고리 선택 시 대분류 값 표기 */
    $('.select').on('click', function(){
    $('#category4').text($(this).text()+' > ');

});

window.addEventListener('click', (e)=>{
    const target = e.target;
    const targetName = target.nodeName;
    if(targetName !== 'BUTTON'){return}

    if(target.classList.contains('.select2')){
        $('#category5').text($(this).text());
    console.log($('#category5').text($(this).text()))
    }
})


// 중분류 목록 조회
const selectList = document.getElementsByClassName("select");

for(let select of selectList){

    select.addEventListener("click", function(){
        document.getElementById("lCateValue").value = this.getAttribute("id");
    });
}

// // // 거래지역 선택 부분?!
// function none(){
// document.getElementsByClassName('placeResult').innerText = '지역설정안함';
// } 

function none(event) {
    const btnElement = document.getElementById('sample5_address');
    btnElement.innerText = '지역설정안함';
}


// 게시글 작성 유효성 검사
function writeValidate(){
    const images = document.getElementsByName("images")[0];
    const boardTitle = document.getElementsByName("boardTitle")[0];
    const placeResult = document.getElementsByName("placeResult")[0];
    const itemCondition = document.getElementsByName("itemCondition")[0];
    const deliveryMethod = document.getElementsByName("deliveryMethod")[0];
    const price = document.getElementsByName("price")[0];
    const boardContent = document.querySelector("[name='boardContent']");

    if(images.value.length == 0){
        alert("상품의 사진을 선택해주세요 :) ");
        images.value = "";
        images.focus();
        return false;
    }

    if(boardTitle.value.trim().length == 0){
        alert("상품명을 입력해주세요 :) ");
        boardTitle.value = "";
        boardTitle.focus();
        return false;
    }

   

    if(placeResult.value.length == 0){
        alert("선호 거래지역을 선택해주세요 :) ");
        placeResult.value = "";
        placeResult.focus();
        return false;
    }
    
    if(itemCondition.value.length == 0){
        alert("상품 상태를 선택해주세요 :) ");
        itemCondition.value = "";
        itemCondition.focus();
        return false;
    }

    if(deliveryMethod.value.length == 0){
        alert("배송방법을 선택해주세요 :) ");
        deliveryMethod.value = "";
        deliveryMethod.focus();
        return false;
    }

    if(price.value.trim().length == 0){
        alert("가격을 입력해주세요 :) ");
        price.value = "";
        price.focus();
        return false;
    }

    if(boardContent.value.trim().length == 0){
        alert("상품에 대해 설명해주세요 :) ");
        boardContent.value = "";
        boardContent.focus();
        return false;
    }
    

    // 제목, 내용이 유효한 경우
    // deleteList(input 태그)에 deleteSet(삭제된 이미지 레벨)을 추가
    // -> JS 배열 특징 사용
    //  --> JS 배열을 HTML요소 또는 console 에 출력하게 되는 경우 1,2,3 같은 문자열로 출력됨
    //      (배열 기호가 벗겨짐)

    // * Set -> Array로 변경 -> deleteList.value에 대입

    // Array.from(유사배열 | 컬렉션) : 유사배열 | 컬렉션을 배열로 변환해서 반환
    deleteList.value = Array.from(deleteSet);

    return true;
}