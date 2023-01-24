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
         
         
         
         
         
		
  <div class="card-body">
  
  	<a href="residentCure.go?re_idx=${rd.re_idx}" class="btn btn-primary">치료</a>
  	<a href="residentMedic.go?re_idx=${rd.re_idx}" class="btn btn-primary">약품</a>
  	<a href="residentVital.go?re_idx=${rd.re_idx}" class="btn btn-primary">바이탈</a>
 </div>
		
		
		
		
		
		<!-- Basic Tables start -->
                         
                         
                <section class="section">
                        <div class="col-12 col-md-6" style="width:62%;">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body"  id="residentList">
                                       
                                       
                                       
                                        <!-- Table with outer spacing -->
                                        <div class="table-responsive">
                                            <table class="table table-lg" id="residentCateList">
                                                
                                                
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>입소번호</th>
													<th>카테고리</th>
													<th>시작시간</th>
													<th>종료시간</th>
                                                </tr>
                                            </thead>
                                            <tbody id="list"></tbody>
                                            <!--
                                            <tbody >                                            
                                            	<c:forEach items="${residentCateDetail}" var="rd">
													<tr>
														<td>${rd.re_idx}</td>               
														<td><a href="residentCateDetail.go?re_idx=${rd.re_idx}">${rd.cc_name}</a></td>                     													
														<td>${rd.co_start}</td>                     													
														<td>${rd.co_end}</td>                     													
													</tr>
												</c:forEach>
                                            </tbody>
                                               --> 
                                                      
                                                      <tbody id="list"></tbody>                                       
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

<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
</body>
<script>






CateDetaillistCall();
function CateDetaillistCall(){
	$.ajax({
		type:'get',
		url:'residentCateDetail.go',
		dataType:'json',
		success:function(data){
			console.log(data);
			CateDetaildrawList(data.list);
		},
		errorerror:function(e){
			console.log(e);
		}
	});
}

function CateDetaildrawList(CateDetailList){
	console.log(CateDetailList);
	var content='';
	<!--
	CateDetailList.forEach(function(items) {
		content+='<tr>';
		content+='<td>'+item.re_idx+'</td>';
		content+='<td><a href="residentCateDetail.go?re_idx='+item.re_idx+'">'+item.cc_name+'</a></td>';
		content+='<td>'+item.co_start+'</td>';
		content+='<td>'+item.co_end+'</td>';
		content+='</tr>';
	});
	$("#list").empty();
	$("#list").append(content);	
-->

	for(var i=0; i<CateDetailList.length; i++){
		console.log(CateDetailList[i]);
		content+='<tr>';
		content+='<td>'+CateDetailList[i].re_idx+'</td>';
		content +='<td><a href="residentCateDetail.go?re_idx='+item.re_idx+'">'+CateDetailList[i].cc_name+'</a></td>';
		content+='<td>'+CateDetailList[i].co_start+'</td>';
		content+='<td>'+CateDetailList[i].co_end+'</td>';
		content+='<td>'+memberList[i].mem_state+'</td>';
		content+='</tr>';
	}
	
	$("#list").empty();
	$("#list").append(content);
	
}







</script>
</html>