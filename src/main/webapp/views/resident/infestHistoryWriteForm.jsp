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
 <div id="app">
      <jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
   <div class="page-heading">
       <h3>감염병 관리 히스토리 작성</h3>
   </div>
 
  <button onclick="location.href='infestListHistory'" class="btn btn-primary" style="float: right; ">등록</button>     
  <form action="infestHistoryWrite" method="POST">
  <table class="table">
  <thead>
    <tr>
      <th scope="col">작성일</th>
      <td>
      	<input type="text" name="date"/>	
      </td>
    </tr>
    
    <tr>  
      <th scope="col">작성자</th>
      <td>
      	<input type="text" name="write"/>	
      </td>
    </tr> 
    <tr>  
      <th scope="col">예방접종내역</th>
      <td>
      	<input type="text" name="jusa"/>	
      </td>
    <tr>  
      <th scope="col">감염병 명</th>
      <td>
      	<input type="text" name="name"/>	
      </td>
    </tr>
    <tr>  
      <th scope="col">현재 감염 상태</th>
      <td>
      	<input type="text" name="state"/>	
      </td>
    </tr>
    <tr>  
      <th scope="col">조치</th>
      <td>
      	<input type="text" name="comment"/>	
      </td>
    </tr>
  </thead>
</table>
</form>
</div>
</div>

<script>

</script>
</html>