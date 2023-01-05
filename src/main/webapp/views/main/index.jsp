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

                       <li class="sidebar-item  active ">
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
                <a href="#" class='alaram'>
                	<img alt="" src="assets/images/logo/bell-fill.svg">
                	<span id="bell_count" style="vertical-align:super">1</span>
                </a>
                <a href="#" class='alaram'>/ 마이페이지 /</a>
                <a href="#" class='alaram'> 로그아웃 </a>
            </div>
            <div class="page-heading">
                <h3>내 프로필</h3>
            </div>
            <div class="page-content">
                <section class="row">
                                                         
                        <div class="card">
                            <div class="card-body py-4 px-5">
                                <div class="d-flex align-items-center">
                                    <div class="avatar avatar-xl">
                                        <img src="assets/images/faces/1.jpg" alt="Face 1">
                                    </div>
                                    <div class="ms-3 name">
                                        <h5 class="font-bold">오상민</h5>
                                        <h6 class="text-muted mb-0">@sangminOH</h6>
                                        
                                        <h5 class="font-bold">정보:</h5>
                                        <h5 class="font-bold">직책:</h5>
                                        <h5 class="font-bold">부서:</h5>

                                        <button class='btn btn-block btn-xl btn-light-primary font-bold mt-3'>마이페이지이동</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h4>오늘 감염병 현황  총원:n명 감염:n명</h4>                             
                            </div>
                             <div class="card-body">
                              <div id="chart-visitors-profile"></div>
                             </div>
                         </div>    
                         <div class="card">
                            <div class="card-header">                                
                                <h4>공지사항 리스트</h4>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h4>외출/외박 중인 입소자</h4>
                            </div>
                            <div class="card-body">
                                <button class='btn btn-block btn-xl btn-light-primary font-bold mt-3'>입소자 정보로 이동</button>
                            </div>
                        </div>
                    
                </section>
            </div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>2023 Final Project</p>
                    </div>
                    <div class="float-end">
                        <p>Create With <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                                href="http://ahmadsaugi.com">Gudi</a></p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendors/apexcharts/apexcharts.js"></script>
    <script src="assets/js/pages/dashboard.js"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>