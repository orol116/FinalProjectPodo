<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PODO 상품관리</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member/itemManage.css">

    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <form action="itemManage" method="POST" name="itemManage" id="itemManage">

    <div class="top-menu">
        <nav id="mainMenu">
            <a href="${contextPath}/member/itemUpload">상품등록</a>
            <a href="${contextPath}/myShop/main">상품관리</a>
            <a href="#">구매/판매 내역</a>
        </nav>
    </div>
    <main>
    <div class="basic1">
        <section class="basic">
            <form class="search1" action="#" method="post" id="search">
                <input id="search2" type="text" placeholder="상품명을 입력해주세요.">
                <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </section>
        <div>
            <div>
                <select>
                    <option>10개씩</option>
                    <option>20개씩</option>
                    <option>30개씩</option>
                    <option>40개씩</option>
                    <option>50개씩</option>
                </select>
            </div>
        </div>
        <div>
            <div>
                <select>
                    <option>전체</option>
                    <option>판매 중</option>
                    <option>예약 중</option>
                    <option>판매완료</option>
                </select>
            </div>
        </div>
    </div>   
    <div>
        <table>
            <thead>
                <tr id="head">
                    <th>사진</th>
                    <th>판매상태</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>찜/댓글</th>
                    <th>최근수정일</th>
                    <th>기능</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <a><img src="${contextPath}/resources/images/items/image1.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>  

                <tr>
                    <td>
                        <a><img src="${contextPath}/resources/images/items/image2.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>    
                <tr>
                    <td>
                        <a><img src="${contextPath}/resources/images/items/image3.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>    
                <tr>
                    <td>
                        <a><img src="${contextPath}/resources/images/items/image4.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>    
                <tr>
                    <td>
                        <a><img src="${contextPath}/resources/images/items/image5.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>    
                
                
                
            </tbody>
        </table>
    </div>
 
    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a class="active" href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">&raquo;</a>
    </div>

    </form>
    </main>

      <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>
