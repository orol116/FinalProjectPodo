function show() {
    document.querySelector(".background").className = "background show";
  }

  function close() {
    document.querySelector(".background").className = "background";
  }


  const itemReport = document.querySelector("#item-report");

  if(itemReport != null){
    itemReport.addEventListener("click", show);
  }
 
  document.querySelector("#close").addEventListener("click", close);


  const report = document.getElementById("report");
  const searchKey = document.getElementById("search-key");

   document.getElementById("reportBtn").addEventListener("click", function(){

    console.log(searchKey.value);

    $.ajax({
        url : contextPath + "/report",      
        data : { "report" : report.value, "select" : searchKey.value, "memberNo" : memberNo},
        
        type : "GET", // 데이터 전달 방식 type

        success : function(result){
            alert("신고되었습니다.");
            location.reload();
        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });


  });


if(tradeCondition.value = "판매완료"){
  document.getElementById("item-image").classList.add("overlay");
}

  