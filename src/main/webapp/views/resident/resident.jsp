<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">


</style>


</head>
 <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
<body>


<div id="app">
      <jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
         <!-- 여기 안에서 개발  -->
         
         
         
         

	<span id="firstspan">
		<div>
				<select id="re_state" name="re_state">					
					<option value="입소중">입소중</option>
					<option value="외출">외출</option>
					<option value="외박">외박</option>
					<option value="입원중">입원중</option>
					<option value="퇴소">퇴소</option>
				</select>
		</div>
		
		
		<%-- 
		<div>
				<select id="ro_name" name="ro_name">
					<option disabled selected>생활실</option>
					<option value="0">퇴소</option>
					<option value="1">입소중</option>
					<option value="2">외출</option>
					<option value="3">외박</option>
					<option value="4">입원중</option>
				</select>
		</div>		  
		--%>
		
		<div>
			<input type="input" id="re_name">
		</div>







         <input type="button" value="검색"
					onclick="location.href='javascript:submit();'" />
					
         <form action="resident" method="get">
	<table>
		<tr>
			<th>번호</th>
			<th>입소자</th>
			<th>성별</th>
			<th>나이</th>
			<th>등급</th>
			<th>생활실</th>
			<th>현황</th>					
		</tr>
		
		
		<c:forEach items="${resident}" var="rd">
			<tr>
			
				<th>${rd.re_idx}</th>
				<th><a href="detail?re_name=${rd.re_name}">${rd.re_name}</a></th>
				<th>${rd.re_gender}</th>
				<th>${rd.re_jumin}</th>
				<th>${rd.re_grade}</th>
				<th>${rd.ro_name}</th>
				<th>${rd.re_state}</th>
				
			</tr>
		</c:forEach>
	</table>

	</form>
     </span>
     
     <span>    
     

         <form action="resident" method="get">
	<table>
		
		
		<th>성별</th>
		<th>나이</th>
		<th>등급</th>
		<th>생활실</th>
		<th>현황</th>


		
		
		<c:forEach items="${resident}" var="rd">
			<tr>
			
				<th>번호</th><tr>${rd.re_idx}</tr>
				<th>입소자</th><tr><a href="detail?re_name=${rd.re_name}">${rd.re_name}</a></tr>
				<tr>${rd.re_gender}</tr>
				<tr>${rd.re_jumin}</tr>
				<tr>${rd.re_grade}</tr>
				<tr>${rd.ro_name}</tr>
				<tr>${rd.re_state}</tr>
				
			</tr>
		</c:forEach>
	</table>

	</form>


      </span>   
         
         
         
         
         
         
         

         
         
         
         
         
         
         
         
       </div>
</div>
</body>
<script>




</script>
</html>