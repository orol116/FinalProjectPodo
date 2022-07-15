function show() {
    document.querySelector(".background").className = "background show";
  }

  function close() {
    document.querySelector(".background").className = "background";
  }

  document.querySelector("#item-report").addEventListener("click", show);
  document.querySelector("#close").addEventListener("click", close);


  const report = document.getElementById("report");

  document.getElementById("reportBtn").addEventListener("click", function(){

    $.ajax({
        url : "report",      
        data : { "memberNo" : loginMemberNo, "report" : report.value},
        
        type : "GET", // 데이터 전달 방식 type

        success : function(result){
            
            alert("신고되었습니다.")

        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });


  });