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
<body>
<%
String var = (String)session.getAttribute("page");
String val = request.getParameter("page");
%>
    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="index"><img src="assets/images/logo/logo.svg" style="width:100px;height:80px;" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">MENU</li>

                       <li class="sidebar-item ">
                            <a href="index?page=index" class='sidebar-link'>                           
                                <span>메인 페이지</span>
                            </a>
                        </li> 

                        <li id="resident" class="sidebar-item  has-sub">
                            <a href="" class='sidebar-link'>
                                <span>입소자</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="sessiontest?page=resident">• 입소자 정보</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="component-badge.html?page=resident">• 입소자 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="component-breadcrumb.html?page=resident">• 입소자 프로그램</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="component-breadcrumb.html?page=resident">• 입소자 프로그램 카테고리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="component-button.html?page=resident">• 감염병</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="component-card.html?page=resident">• 생활실 현황판</a>
                                </li>
                            </ul>
                        </li>

                        <li id="member"class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>             
                                <span>직원</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=member">• 직원</a>
                                </li>                                
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=member">• 조직도</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=member">• 직원 직책 변경</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=member">• 접근 권한 관리</a>
                                </li>                                                                                                    
                            </ul>
                        </li>

                        <li id="payment" class="sidebar-item has-sub">
                            <a href="#" class='sidebar-link'>                               
                                <span>결재</span>
                            </a>
                             <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=payment">• 결재 양식</a>
                                </li>                                
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=payment">• 개인 결제함</a>
                                </li> 
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=payment">• 열람 가능 문서함</a>
                                </li>                                     
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=payment">• 결제 대기 문서함</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=payment">• 결제 진행 문서함</a>
                                </li>   
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=payment">• 결제 완료 문서함</a>
                                </li>   
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=payment">• 결제 반려 문서함</a>
                                </li>                              
                            </ul>                             
                        </li>

                        <li id="mycal" class="sidebar-item ">
                            <a href="#?page=mycal" class='sidebar-link'>
                                <span>개인 캘린더</span>
                            </a>                         
                        </li>

                        <li id="board1" class="sidebar-item  ">
                            <a href="form-layout.html?page=board1" class='sidebar-link'>
                                <span>인수 인계</span>
                            </a>
                        </li>

                        <li id="board2" class="sidebar-item ">
                            <a href="#?page=board2" class='sidebar-link'>
                                <span>공지사항</span>
                            </a>                            
                        </li>

                        <li id="item" class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>                                
                                <span>비품</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=item">• 비품 관리 대장</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=item">• 비품 목록</a>
                                </li> 
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=item">• 비품 사용 내역</a>
                                </li> 
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.html?page=item">• 차량</a>
                                </li>                                                                                                
                            </ul>                            
                        </li>

                        <li id="donation" class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>                                
                                <span>후원금</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.htmlpage=donation">• 후원금</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="extra-component-avatar.htmlpage=donation">• 후원금 사용내역</a>
                                </li>                                                                                                
                            </ul>                              
                        </li>
 				</ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
                <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
            <div class="allpage-heading" style="text-align: right">
                <a href="#" class='alaram'>알림/</a>
                <a href="#" class='alaram'>마이페이지/</a>
                <a href="#" class='alaram'>로그아웃</a>
            </div>
        </div>
        </div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendors/apexcharts/apexcharts.js"></script>
    <script src="assets/js/pages/dashboard.js"></script>
    <script src="assets/js/main.js"></script>        
</body>
<script>

	  
 var page='${page}';
	   console.log(page);
	   if(page='resident'){
	      $("#resident").addClass('active');
	   }else if(page='member'){
		   $("#member").addClass('active');
	   }else if(page='payment'){
		   $("#payment").addClass('active');
	   }else if(page='mycal'){
		   $("#mycal").addClass('active');
	   }else if(page='board1'){
		   $("#board1").addClass('active');
	   }else if(page='board2'){
		   $("#board2").addClass('active');
	   }else if(page='item'){
		   $("#item").addClass('active');
	   }else if(page='donation'){
		   $("#donation").addClass('active');
	   }else{
		   console.log(e);
	   }
</script>
</html>