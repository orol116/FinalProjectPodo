
function show() {
  document.querySelector(".background").className = "background show";
}

function close() {
  document.querySelector(".background").className = "background";
}

document.querySelector("#show").addEventListener("click", show);
document.querySelector("#close").addEventListener("click", close);


const report = document.getElementById("ok");


document.getElementById("ok").addEventListener("click", function(){

  $.ajax({
      url : "inquire",      
      data : { "inquire" : inquire.value, "inquireNo" :inquire.no},
      
      type : "GET", // 데이터 전달 방식 type

      success : function(result){
          
          alert("문의가 취소되었습니다.")

      },
      
      error : function(req, status, error){
          console.log(req.responseText);
      } 
  });


});