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
	#residentList{border-collapse:collapse; width:100%; height:700px;}
	#residentList thead{float:left; width:900px; }
	#residentList tbody{overflow-y:auto; overflow-x:hidden; float:left; width:900px; height:600px;white-space:nowrap;}
	.residentList{text-align: center;}
	th{ width:140px; height:70px;}
	td{ width:140px; height:68px;}
</style>

</head>
 <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
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
         
         
         
         <form action="residentsearch.do" method="post">
		<div class="option_re_state">
				<select name="re_state">					
					<option value="입소중">입소중</option>
					<option value="외출">외출</option>
					<option value="외박">외박</option>
					<option value="입원중">입원중</option>
					<option value="퇴소">퇴소</option>
				</select>
		</div>
		
		
		<div class="option_re_name">
			<input type="text" name="re_name">
		</div>
         <button class="btn btn-primary">검색</button>
       </form>
         
         
         
                         <!-- Basic Tables start -->
                         <a href="residentwriteForm.go" class="btn btn-primary">신규등록</a>	
                         
                         
                <section class="section">
                        <div class="col-12 col-md-6" style="width:62%;">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body"  id="residentList">
                                       
                                       
                                       
                                        <!-- Table with outer spacing -->
                                        <div class="table-responsive">
                                            <table class="table table-lg" id="residentList">
                                                
                                                
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>번호</th>
													<th>입소자</th>
													<th>성별</th>
													<th>나이</th>
													<th>등급</th>
													<th>생활실</th>
													<th>현황</th>
                                                </tr>
                                            </thead>
                                            
                                            <tbody >                                            
                                            	<c:forEach items="${resident}" var="rd">
													<tr>
														<td>${rd.re_idx}</td>
														<td><a href="residentdetail.go?re_idx=${rd.re_idx}">${rd.re_name}</a></td>
														<td>${rd.re_gender}</td>
														<td>${rd.re_age}</td>
														<td>${rd.re_grade}</td>
														<td>${rd.ro_name}</td>
														<td>${rd.re_state}</td>														
													</tr>
												</c:forEach>
                                            </tbody>
                                                
                                                                                             
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                      
                </section>
                <!-- Basic Tables end -->
         
         
       </div>
</div>
</body>
<script>


</script>
</html>