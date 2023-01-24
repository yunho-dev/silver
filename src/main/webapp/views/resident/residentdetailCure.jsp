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

<style>
	#firstdata{
		width="500px"
		height="140px"
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
         <!-- 여기 안에서 개발  -->
         
 	<form action="residentdetailCure" method="get"> 
   <section class="section">   
      <div id="firstdata" class="table-responsive">
         <table class="table table-borderless mb-0">
         	<h5>치료</h5>
            <tr>
                <th>담당자</th>                                                   
                <td>${rd.co_write}</td>                                                   
            </tr>
            <tr>
                <th>시작시간</th>                                                   
                <td>${rd.co_start}</td>                                                   
            </tr>
            <tr>
                <th>끝난시간</th>                                                   
                <td>${rd.co_end}</td>                                                   
            </tr>
            <tr>
                <th>내용</th>                                                   
                <td>${rd.cu_content}</td>                                                   
            </tr>
            <tr>
                <th>특이사항</th>                                                   
                <td>${rd.co_event}</td>                                                   
            </tr>
            
                                        </table>
                                    </div>                                
                </section>
               <a href="residentCategory" class="btn btn-primary">리스트</a>			
               <a href="./residentupdateFormCure.go?re_idx=${rd.re_idx}" class="btn btn-primary">수정</a>
		</form>	
  		
  		
  		
  		
         
         
         
         

         
         
         
         
         
         
         
         
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