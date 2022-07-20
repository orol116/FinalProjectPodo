const searchKey = document.getElementById("search-key");


function show() {
    document.getElementById("introChange").style.display = "none";
    document.getElementById("reportBtn").style.display = "block";
    document.querySelector(".background").className = "background show";
    document.getElementById("report-text").innerText = "";
    document.getElementById("report-text").innerText = "신고할 내용을 입력해주세요.";
    document.getElementById("report").setAttribute("placeholder", "신고할 내용을 입력해주세요.");
    searchKey.style.display = "block";

  }

  function close() {
    document.querySelector(".background").className = "background";
  }

  function introShow(){
    document.getElementById("introChange").style.display = "block";
    document.getElementById("reportBtn").style.display = "none";
    document.querySelector(".background").className = "background show";
    document.getElementById("report-text").innerText = "";
    document.getElementById("report-text").innerText = "수정할 소개를 입력하세요.";
    document.getElementById("report").setAttribute("placeholder", "수정할 소개를 입력하세요.");
    searchKey.style.display = "none";
    document.getElementById("introChange").style.marginLeft = "350px";
  }
  
  
  document.querySelector("#user-intro-change").addEventListener("click", introShow);
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



  document.getElementById("introChange").addEventListener("click", function(){

    $.ajax({
        url :  contextPath + "/shop/myShop/introChange/intro",      
        data : {"report" : report.value},
    
        type : "GET", // 데이터 전달 방식 type

        success : function(result){
            
            alert("소개가 변경되었습니다.")
            location.reload();
        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });


  });