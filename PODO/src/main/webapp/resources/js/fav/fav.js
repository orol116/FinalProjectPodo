$(".btn-wishlist").click(function() {
    alert("찜 목록에 추가되었습니다.");
});

var memberNo = $("#memberNo").val();
var loginMember = $("#loginMember").val();

$(".btn-cart").click(function() {
    
    $.ajax({
        
        type : "post",
        url : "/member/favorites/" + memberNo,
        data : {
            memberNo : memberNo
        },
        dataType : "text",
        success : function(result) {
            
            if (result.trim() == 'add_success') {
                var check = confirm("찜 목록에 등록되었습니다.");
                if (check) {
                    location.assign("/" + loginMember);
                }
            } else if (result.trim() == 'already_existed') {
                alert("이미 찜 목록에 추가된 상품입니다.");
            }
        }
    });
});
