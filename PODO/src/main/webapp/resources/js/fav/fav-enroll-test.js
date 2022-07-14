/* 찜하기 버튼 클릭 시 이벤트 */
$(document).ready(function() {
    $('#prdct_like_dis').click(function(event) {
        event.preventDefault();
        // 비로그인 상태시 찜하기 버튼을 누르면
        if ("${mbr.mbr_id}" == "") {
            if (confirm("로그인 한 회원만 이용가능합니다. 로그인 하시겠습니까?")) {
                // 승낙하면 로그인 페이지로 이동
                location.href = '${pageContext.request.contextPath}/login';
            } else {
                // 거부하면 해당 페이지 새로고침
                location.reload();
            }
        // 로그인 상태시 찜하기 버튼을 누르면    
        } else {
            // 해당 멤버ID와 상품ID의 정보를 가져온다
            var mbr_id = "${mbr.mbr_id}";
            var prdct_id = "${prdct.prdct_id}";
            var board_id = "${prdct.board_id}";

            console.log("mbr_id: " + mbr_id);
            console.log("mbr_id type: " + (typeof mbr_id));
            console.log("prdct_id: " + prdct_id);
            console.log("prdct_id type: " + (typeof prdct_id));
            console.log("board_id: " + board_id);
            console.log("board_id type: " + (typeof board_id));

            var form = {
                mbr_id : mbr_id,
                prdct_id : prdct_id,
                board_id : board_id
            };

            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/prdct/{prdct_id}",
                cache : false,
                contentType : 'application/json; charset=utf-8',
                data : JSON.stringify(form),
                success : function(result) {
                    console.log(result);
                    if (result == "SUCCESS") {
                        console.log("찜 성공!")
                        if (confirm("해당 상품을 찜하셨습니다. 목록 페이지로 이동하시겠습니까?")) {
                            // 승낙하면 마이페이지의 찜하기 리스트로 이동
                            location.href = '${pageContext.request.contextPath}/member/mypage/like';
                        } else {
                            // 거부하면 해당 페이지 새로고침하여 찜한거 반영되게하기(HTTP의 속성 때문...)
                            location.reload();
                        }
                    }
                },
                error : function(e) {
                    console.log(e);
                    alert('찜할 수 없습니다.');
                    location.reload(); // 실패시 새로고침하기
                }
            })
        }
    });
});

/* 찜취소 버튼을 누를경우 이벤트 발생 */
$(document).ready(function() {
    $('#prdct_like_ena').click(function(event) {
        event.preventDefault();

        // FormData 객체 생성
        var formData = new FormData();

        // 정보를 가져와 FormData에 append 한다 
        var prdct_like_number = $('#prd_like_num').text();

        console.log("prdct_like_number: " + prdct_like_number);
        console.log("prdct_like_number: " + (typeof prdct_like_number));

        formData.append("prdct_like_number", prdct_like_number);

        $.ajax({
            type : 'DELETE', 
            url : $(this).attr("href"), 
            cache : false, 
            processData: false, 
            contentType: false, 
            data: formData, 
            success: function(result) {
                console.log(result);
                if (result == "SUCCESS") {
                    console.log("찜 취소 성공!")
                    alert('해당 상품을 찜 취소 하셨습니다.');
                    location.href = '${pageContext.request.contextPath}/prdct/${prdct.prdct_id}';
                }
            },
            error : function(e) {
                console.log(e);
                alert('찜 취소 할 수 없습니다.');
                location.reload(); // 실패시 새로고침하기
            }
        })
    });
});
