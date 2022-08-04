# Podo

<p align="center"><img src="https://user-images.githubusercontent.com/84611460/182775955-65ea5341-3e47-4869-8901-1e7a94b63036.png"></p>


# 기획 의도

- 번개장터와 당근마켓에서 영감을 얻어 로그인한 회원 및 가입된 회원들이 웹 페이지 내에서 채팅을 통하여 물건을 업로드 및 구매/판매가 가능한 페이지를 구현하였습니다.
<br><br>

# 프로젝트 소개

- "포도알" 이라는 요소를 만들어 회원가입 시 기본 5알이 제공되고 거래 후 좋은 후기를 받을 경우 5알이 지급되고, 나쁜 후기를 받았을 경우엔 3알이 차감됩니다.
- "포도알"은 회원의 신뢰도를 알 수 있고 이 포도알을 소모하여 판매 상품을 최상단으로 최신화할 수 있는 기능을 사용할 수 있습니다.
- 회원은 회원가입 시 동네를 설정(주소)을 할 수 있고 이 주소를 기준으로 2~10km까지 반경을 설정하여 범위 내에 있는 지역의 물건들만 조회할 수 있도록 하였습니다.
- 판매자는 판매 물건을 게시할 수 있고 구매자는 찜 기능을 이용하여 자신의 찜 리스트에 담아둘 수 있습니다.
- 구매자는 판매자에게 1:1 채팅을 할 수 있고 거래가 완료되면 판매자는 채팅방 내에서 판매 상품을 판매완료 처리할  수 있습니다.
- 구매자는 판매완료 처리가 되면 후기를 작성할 수 있습니다. 
<br><br>

# 유스케이스 다이어그램

<p align="center"><img src="https://user-images.githubusercontent.com/84611460/182777414-e4fda06a-908a-423a-bb3c-215f218c80b5.png"></p>

<br><br>


# DB 설계 (ERD)

<p align="center"><img src="https://user-images.githubusercontent.com/84611460/182777699-d6605f9f-2eb1-40e5-ae6c-1c2ab17e696e.png"></p>

<br><br>


# 사용 언어 및 개발 툴

### Back
<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> <img src="https://img.shields.io/badge/mybatis-black?style=for-the-badge&logo=mybatis&logoColor=white">  

### Front
<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> 

### tool & Environment
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/eclipse-blue?style=for-the-badge&logo=eclipse&logoColor=white"/> <img src="https://img.shields.io/badge/apachetomcat-yellow?style=for-the-badge&logo=apachetomcat&logoColor=black"/> 

### API
다음 우편번호 API, 카카오 지도 API
<br><br>


# 구현 기능

- 마이페이지(회원 정보 수정) 구현
- 내 판매글, 후기 조회, 판매자 정보 조회 구현
- 판매 상품 관리(판매상태 / 수정 / 삭제) 구현
- 1:1 채팅 기능 구현 (채팅 내에서 판매완료, 후기 작성 가능)

# 배운 점 & 아쉬운 점

- 이미지 업로드에서 문제가 있었습니다. DB에는 이미지 경로가 성공적으로 저장되었지만 프로젝트 내 폴더엔 업로드가 되지 않는 경우가 있었습니다. 구현 당시에 이미지 저장 경로를 잘못 설정하여 이미지가 넣어지지 않는 문제였는데 뒤늦게 발견하여 아쉬운 점이 있었습니다.
- 웹 소켓을 이용하여 1:1 채팅을 구현하였는데 1:1 채팅으로 설계했던 것이 단체 채팅으로 만들었던 점이 아쉬웠습니다. 판매글 상세조회에서 1:1 채팅을 누르면 채팅방이 생기면서 1:1 채팅을 할 수 있도록 만들었던 것인데 채팅방 내 인원 수를 따로 설정하지 않아서 인지 혹은 프로젝트 발표 당시 강의실 내 모든 컴퓨터가 ip가 동일하여 소켓이 동일 ip라 채팅 내용이 다보였던 것인지 여러명이 보내는 채팅이 같은 채팅방에서 읽히는 문제점이 있었습니다. 이 계기로 websocket에 대해서 좀 더 자세히 공부할 수 있는 계기가 되었던 것 같습니다.
