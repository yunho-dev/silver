<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
	<link rel="stylesheet" href="res/style.css" />
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
       <h3>감염병 관리 히스토리 수정</h3>
   </div>
 <section class="row">
  <div class="card">
  	<div class="card-body py-4 px-5">
  		<form action="infestHistoryUpdate" method="post">
  			<button  class="btn btn-primary" >수정</button>
  				<div class="d-flex align-items-center">     
  <table class="table table-bordered table-hover">
  <thead>
    <tr>  
      <th scope="col" style="width:20%;">작성자&nbsp;&nbsp;:</th>
      <td>
      	<input type="text" name="if_write" style="width: 100%;" value="${infest.if_write}"/>
      </td>
    </tr> 
    <tr>  
      <th scope="col" style="width:20%;">예방접종내역&nbsp;&nbsp;:</th>
      <td> 
      	<input type="text" name="if_jusa" style="width: 100%;" value="${infest.if_jusa}"/>	
      </td>
    <tr>  
      <th scope="col" style="width:20%;">감염병 명&nbsp;&nbsp;:</th>
      <td>
      	<input type="text" name="if_name" style="width: 100%;" value="${infest.if_name}"/>	
      </td>
    </tr>
    <tr>  
      <th scope="col" style="width:20%;">현재 감염 상태&nbsp;&nbsp;:</th>
      <td>
      	<input type="text" name="if_state" style="width: 100%;" value="${infest.if_state}"/>	
      </td>
    </tr>
    <tr>  
      <th scope="col" style="width:20%;">조치&nbsp;&nbsp;:</th>
      <td>
      	<input type="text" name="if_comment" style="width: 100%;" value="${infest.if_comment}"/>	
      </td>
    </tr>
  </thead>
</table>
<input type="hidden" name="re_idx" value="${infest.re_idx}">
<input type="hidden" name="if_idx" value="${infest.if_idx}">
</div>
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