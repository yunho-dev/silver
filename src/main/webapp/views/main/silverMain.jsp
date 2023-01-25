<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>은빛 우산</title>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
	<style>
	.my-custom-scrollbar {
position: relative;
height: 300px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

.jejugothic * { 
 font-family: 'Jeju Gothic', sans-serif;
}

div.card{
	font-family: Jeju Gothic;
}
	</style>
</head>
<body>
<%
int hope = (int)session.getAttribute("hope");
System.out.println(hope);
%>
    <div id="app">
	<c:set var = "power" scope = "session" value = "${hope}"/>
		<c:choose>
		<c:when test="${power == 1}">
			<jsp:include page="../adminsidebar.jsp"></jsp:include>
		</c:when>
		<c:when test="${power == 2}">
			<jsp:include page="../adminsidebar.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
		<jsp:include page="../sidebar.jsp"></jsp:include>
		</c:otherwise>
		</c:choose>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>	

            <div class="page-heading">
                <h3>내 프로필</h3>
            </div>
            <div class="page-content">
                <section class="row">
                                                         
                        <div class="card">
                            <div class="card-body py-4 px-5">
                                <div class="d-flex align-items-center">
                                    <div class="avatar avatar-xl">
                                    <c:if test="${not empty face}">
                                        <img src="/filephoto/${face}" style="width:100px; height: 100px;" alt="Face 1">
                                    </c:if>    
                                    <c:if test="${empty face}">
                                        <img src="/filephoto/noimage.png" style="width:100px; height: 100px;" 
                                        alt="Face 1">
                                    </c:if>  
                                    </div>
                                    <div class="ms-3 name">
                                        <h5 class="font-bold" style="margin-bottom: -4px;">${memberList.mem_name}</h5>
                                        <h6 class="text-muted mb-0">${memberList.mem_email}</h6>
                                        <h5 class="font-bold" style="margin-top: 10px; margin-bottom: 7px;">직책:${memberList.pos_name}</h5>
                                        <h5 class="font-bold">부서:${memberList.dept_name}</h5>

                                        <button class='btn btn-block btn-xl btn-light-primary font-bold mt-3'
                                        onclick="location.href='mypageList'">마이페이지이동</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h4>오늘 감염병 현황  총원:${totalResi}명 감염:${totalinfe}명</h4>                             
                            </div>
                             <div class="card-body">
                              <div id="chart-visitors-profile"></div>
                             </div>
                         </div>    
                         <div class="card">
                            <div class="card-header">                                
                                <h4>공지사항 리스트</h4>
                                <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                <table class="table table-bordered table-hover" style="text-align:center;">
                                	<thead>
                                		<tr class="table-secondary">
                                			<th scope="col">글번호</th>
                                			<th scope="col" class="col-md-6">제목</th>
                                			<th scope="col">작성자</th>
                                			<th scope="col">날짜</th>
                                		</tr>
                                	</thead>
                                	<tbody>
                                	  <c:forEach items="${noticeList}" var="list">
                                	  	<tr>
                                	  		<td>${list.bd_idx}</td>
                                	  		<td><a href="noticeDetail.do?page=board2&bd_idx=${list.bd_idx}">${list.bd_title}</a></td>
                                	  		<td>${list.mem_name}</td>
                                	  		<td class="timeSub">${list.bd_date}</td>
                                	 	</tr>
                                	  </c:forEach>
                                	</tbody>
                                </table>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h4>외출/외박 중인 입소자</h4>
                                <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                <table class="table table-bordered table-hover" style="text-align:center;">
                                	<thead>
                                		<tr class="table-secondary">
                                			<th scope="col">No.</th>
                                			<th scope="col">입소자</th>
                                			<th scope="col">성별</th>
                                			<th scope="col">등급</th>
                                			<th scope="col">상황실</th>
                                			<th scope="col">현황</th>
                                		</tr>
                                	</thead>
                                	<tbody>
                                	 <c:forEach items="${resiList}" var="list" varStatus="status">
                                	 	<tr>
                                	 		<td>${status.count}</td>
                                	 		<td>${list.re_name}</td>
                                	 		<td>${list.re_gender}</td>
                                	 		<td>${list.re_grade}</td>
                                	 		<td>${list.ro_name}</td>
                                	 		<td>${list.re_state}</td>
                                	 	</tr>
                                	 </c:forEach>
                                	</tbody>
                                	</table>
                                </div>
                            </div>
                            <div class="card-body">
                                <button class='btn btn-block btn-xl btn-light-primary font-bold mt-3'
                                onclick="location.href='resident?page=resident'">입소자 정보로 이동</button>
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
<!--     <script src="assets/js/pages/dashboard.js"></script> -->
    <script src="assets/js/main.js"></script>
</body>
<script>
var str=$(".timeSub").text();
var result=str.substr(0,11);
$(".timeSub").text(result);


var series1=Number("${totalResi}");
var series2=Number("${totalinfe}");
console.log(series2/series1 * 100);
console.log((series1-series2)/series1*100);

let optionsVisitorsProfile  = {
		series: [series2/series1 * 100,(series1-series2)/series1*100],
		labels: ['감염 입소자', '비감염 입소자'],
		colors: ['#435ebe','#55c6e8'],
		chart: {
			type: 'donut',
			width: '100%',
			height:'350px'
		},
		legend: {
			position: 'bottom'
		},
		plotOptions: {
			pie: {
				donut: {
					size: '30%'
				}
			}
		}
	}
	
var chartVisitorsProfile = new ApexCharts(document.getElementById('chart-visitors-profile'), optionsVisitorsProfile);
chartVisitorsProfile.render();

</script>
</html>