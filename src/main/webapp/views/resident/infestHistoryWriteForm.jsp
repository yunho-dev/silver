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
       <h3>감염병 관리 히스토리 작성</h3>
   </div>
   <div class="page-content">
  <section class="row">
  	<div class="card">
  		<div class="card-body py-4 px-5">
  <form action="infestHistoryWrite" method="post">
  <div>
  <button  class="btn btn-primary" style="margin:4px; margin-bottom:20px; float: left; width: 90px;">등록</button>   
  <button type="button" class="btn btn-secondary" style="margin:4px; margin-bottom:20px; float: left; width: 100px;"
							onclick="location.href='infestListHistory?re_idx=${re_idx}'">뒤로가기</button>  
  </div>
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">작성자</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="if_write"  id="if_write" autofocus>                  
  </div>						
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">예방접종내역</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="if_jusa"  id="if_jusa" autofocus>                  
  </div>						
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">감염병 명</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="if_name"  id="if_name" autofocus>                  
  </div>						
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">현재 감염 상태</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="if_state"  id="if_state" autofocus>                  
  </div>						
  <div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">조치</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="if_comment"  id="if_comment" autofocus>                  
  </div>						
  
<input type="hidden" name="re_idx" value="${re_idx}">
</form>
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