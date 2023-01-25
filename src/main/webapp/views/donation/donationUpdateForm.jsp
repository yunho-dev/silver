<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="assets/js/jquery.twbsPagination.js"></script>
<style>

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
       <h3>후원금 리스트 수정</h3>
   </div>
  <section class="row">
  	<div class="card">
  		<div class="card-body py-4 px-5">
  <form action="donationUpdate" method="post">
  <div>
  <button  class="btn btn-primary" style="margin:4px; margin-bottom:20px; float: left; width: 70px;">수정</button>
  <button type="button" class="btn btn-secondary" style="margin:4px; margin-bottom:20px; float: left; width: 100px;"
							onclick="location.href='donation?page=donation'">뒤로가기</button> 
	</div>					    
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">날짜</span>
       <input type="date"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="do_date"  id="do_date" autofocus value="${donation.do_date}">
                         
  </div>
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">후원자</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="do_name"  id="do_name" autofocus value="${donation.do_name}">
                         
  </div>
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">후원목적</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="do_goal"  id="do_goal" autofocus value="${donation.do_goal}">
                         
  </div>
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">등록자</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="do_write"  id="do_write" autofocus value="${donation.do_write}">
                         
  </div>
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">금액</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="do_money"  id="do_money" autofocus value="${donation.do_money}">
                         
  </div>     
  
<input type="hidden" name="do_idx" value="${donation.do_idx}">
</form>
</div>
</div>
</section>
<footer>
	<div class="footer clearfix mb-0 text-muted">
		<div class="float-start">
			<p>2023 Final Project</p>
		</div>
	<div class="float-end">
		<p>
			Create With <span class="text-danger"><i
				class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">Gudi</a>
		</p>
	</div>
	</div>
</footer>
</div>
</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	 <script src="assets/js/bootstrap.bundle.min.js"></script>
	 <script src="assets/js/pages/dashboard.js"></script>
	 <script src="assets/js/main.js"></script>
</body>
<script>

</script>
</html>