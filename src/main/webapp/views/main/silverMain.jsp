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
       	<jsp:include page="sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="upbar.jsp"></jsp:include>	

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