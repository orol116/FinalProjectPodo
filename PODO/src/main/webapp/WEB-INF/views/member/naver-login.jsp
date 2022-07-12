<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <title>login</title>
</head>


<body>


    <script type="text/javascript">
        var naver_id_login = new naver_id_login("7CM27UMDND6X1zZ8Ekqr","http://127.0.0.1:8081/podo/member/loginNaver");
        // 접근 토큰 값 출력
        // alert(naver_id_login.oauthParams.access_token);
        // 네이버 사용자 프로필 조회
        naver_id_login.get_naver_userprofile("naverSignInCallback()");
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

        
        function naverSignInCallback() {
            alert(naver_id_login.getProfileData('email'));
            alert(naver_id_login.getProfileData('nickname'));
            alert(naver_id_login.getProfileData('birthday'));
        }

        // 철회 주소 : https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=7CM27UMDND6X1zZ8Ekqr&client_secret=MGPSHIVxZq&access_token=AAAANwHHZOMJtrEflNK9nzET46tWNBXRXPxd34kM8XLT0gNfIpKPiaEEx0ppEPFPr5PTx9Rr7Sa_-iIj1p7UCj8tDBk&service_provider=NAVER
       const contextPath = "${contextPath}";

        $.ajax({
            url:contextPath+"/login",
            type: "POST",
            data:{"memberEmail":naver_id_login.getProfileData('email')},
            success : function(){

            },
            error: function(){

            }

        })
    </script>
</body>
</html>