var naver_id_login = new naver_id_login("7CM27UMDND6X1zZ8Ekqr","http://kh-classa.xyz:10000/podo/member/loginNaver/");
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

setTimeout(() => {
    if(naver_id_login.getProfileData('email') != null){

        location.href='../selectNaver?email='+naver_id_login.getProfileData('email');
        
    }else{
        alert("네이버 로그인이 되지 않았습니다.");
        location.href = '../../../podo'
    }
}, 1000);

