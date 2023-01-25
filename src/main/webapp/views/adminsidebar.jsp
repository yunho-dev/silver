<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>은빛 우산</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
</head>
<style>
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
</style>
<body>
<%
String var = (String)session.getAttribute("page");
String val = request.getParameter("page");
%>

        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="silverMain"><img src="assets/images/logo/logo.svg" style="width:100px;height:80px;" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu" style="font-family: NanumSquareNeo-Variable;">
                    <ul class="menu">
                        <li class="sidebar-title">MENU</li>


                        <li id="resident" class="sidebar-item  has-sub">
                            <a href="" class='sidebar-link'>
                            	<i class="bi bi-person-badge-fill"></i>
                                <span>입소자</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="resident?page=resident">• 입소자 정보</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="residentCategory?page=resident">• 입소자 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="programList?page=resident">• 입소자 프로그램</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="residentProgramGategory?page=resident">• 입소자 프로그램 카테고리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="infestList?page=resident">• 감염병</a>
                                </li>
                            </ul>
                        </li>

                        <li id="member"class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>             
                            	<i class="bi bi-person-badge-fill"></i>
                                <span>직원</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="adminmemberList?page=member">• 직원</a>
                                </li>                                
                                <li class="submenu-item ">
                                    <a href="memberOrgChart?page=member">• 조직도</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="memberGradeChange?page=member">• 직원 직책 변경</a>
                                </li>                                                                                                    
                            </ul>
                        </li>

                        <li id="payment" class="sidebar-item has-sub">
                            <a href="#" class='sidebar-link'>      
                            	<i class="bi bi-file-earmark-medical-fill"></i>                         
                                <span>결재</span>
                            </a>
                             <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="myPayForm?page=payment">• 결재 양식</a>
                                </li>                                
                                <li class="submenu-item ">
                                    <a href="selfPayment?page=payment">• 개인 결재함</a>
                                </li>     
                                <li class="submenu-item ">
                                    <a href="openPayment?page=payment">• 열람 가능 문서함</a>
                                </li>                                    
                                <li class="submenu-item ">
                                    <a href="waitPayment?page=payment">• 결재 대기 문서함</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="goingPayment?page=payment">• 결재 진행 문서함</a>
                                </li>   
                                <li class="submenu-item ">
                                    <a href="finishPayment?page=payment">• 결재 완료 문서함</a>
                                </li>
                            </ul>                             
                        </li>

                        <li id="mycal" class="sidebar-item ">
                            <a href="mycalList?page=mycal" class='sidebar-link'>
                            	<i class="bi bi-grid-fill"></i>
                                <span>개인 캘린더</span>
                            </a>                         
                        </li>

                        <li id="board1" class="sidebar-item  ">
                            <a href="nextList?page=board1" class='sidebar-link'>
                            	<i class="bi bi-grid-1x2-fill"></i>
                                <span>인수 인계</span>
                            </a>
                        </li>

                        <li id="board2" class="sidebar-item ">
                            <a href="noticeList?page=board2" class='sidebar-link'>
                            	<i class="bi bi-grid-1x2-fill"></i>
                                <span>공지사항</span>
                            </a>                            
                        </li>

                        <li id="item" class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                            	<i class="bi bi-basket-fill"></i>                          
                                <span>비품</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="thingManage?page=item">• 비품 관리 대장</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="thingList?page=item">• 비품 목록</a>
                                </li> 
                                <li class="submenu-item ">
                                    <a href="thingHistory?page=item">• 비품 사용 내역</a>
                                </li> 
                                <li class="submenu-item ">
                                    <a href="car?page=item">• 차량</a>
                                </li>                                                                                                
                            </ul>                            
                        </li>

                        <li id="donation" class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                            	<i class="bi bi-cash"></i>                                
                                <span>후원금</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="donation?page=donation">• 후원금</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="donHistory?page=donation">• 후원금 사용내역</a>
                                </li>                                                                                                
                            </ul>                              
                        </li>
 				</ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>


       
</body>
<script>
var page='${page.page}';
console.log(page);
if(page=='resident'){
   $("#resident").addClass('active');
}else if(page=='member'){
   $("#member").addClass('active');
}else if(page=='payment'){
   $("#payment").addClass('active');
}else if(page=='mycal'){
   $("#mycal").addClass('active');
}else if(page=='board1'){
   $("#board1").addClass('active');
}else if(page=='board2'){
   $("#board2").addClass('active');
}else if(page=='item'){
   $("#item").addClass('active');
}else if(page=='donation'){
   $("#donation").addClass('active');
}else{
   console.log('잘못된비교');
}
</script>
</html>