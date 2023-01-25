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
<style></style>
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
		       <h3>감염병 관리 히스토리</h3>
		   </div>
   				<div class="page-content">
   					<section class="row">
   						<div class="card" id="table">
   							<div style="float: left;">
   							<button onclick="goWirte()" class="btn btn-primary" style="margin:4px; float: left; width: 90px;">글작성</button>
   							<button type="button" class="btn btn-secondary" style="margin:4px; float: left; width: 100px;"
								onclick="location.href='infestList?page=resident'">뒤로가기</button>
   							</div>	
   								<div class="card-body py-4 px-5">
  									<div class="card" >
									  <table class="table">
										  <thead>
										    <tr>
										      <th>작성일</th>
										      <th>현재감염상태</th>
										      <th>예방접종내역</th>
										      <th>감염병 명</th>
										      <th>조치</th>
										      <th>작성자</th>
										    </tr>
										  </thead>
	  										<tbody id="infestHistoryList">
	  
	  										</tbody> 	
											</table>
											<div id="paging">
													<div >
														<nav>
															<ul class="pagination" id="pagination" style="padding-left:35%; margin-top: 10px; margin-bottom: 30px; text-align: center;"></ul>
														</nav>
												 	</div>
											</div>
										</div>
									</div>
								</div>
</section>
</div>
</div>
</div>
<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/pages/dashboard.js"></script>
<script src="assets/js/main.js"></script>
</body>
<script>
var url=window.location.search.split('?re_idx=')[1];
console.log("idx 값 : "+url);
var uri=window.location.search.split('?if_idx=')[2];
console.log("idx 값 : "+uri);
function goWirte(){
	location.href="infestHistoryWriteForm?re_idx="+url;
}

var showPage = 1;
infestListHistoryCall(showPage);

function infestListHistoryCall(page){
	
	$.ajax({
		type:'get',
		url:'infestListHistoryCall',
		data:{'page':page,'re_idx':url,'if_idx':uri},
		dataType:'json',
		success:function(data){
			//console.log(data);
			drawList(data.list);
			
			$('#pagination').twbsPagination({
				startPage:1,
				totalPages:data.total,
				visiblePages: 5,
				onPageClick:function(e, page){
					
					infestListHistoryCall(page);	
				}
				
			});
		},
		error:function(e){
			//console.log(e);
		}
	});
	
}

function drawList(list){
	var content = '';
	
	for (var i = 0; i < list.length; i++) {
		content +='<tr onclick=location.href="infestHistoryWriteUpdateForm?re_idx='+list[i].if_idx+'">';
		var date = new Date(list[i].if_date);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		content +='<td >'+year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2))+'</td>';
		content +='<td>'+list[i].if_state+'</td>';
		content +='<td>'+list[i].if_jusa+'</td>';
		content +='<td>'+list[i].if_name+'</td>';
		content +='<td>'+list[i].if_comment+'</td>';
		content +='<td>'+list[i].if_write+'</td>';
	
		content +='</tr>';
	}
	
	$('#infestHistoryList').empty();
	$('#infestHistoryList').append(content);
}
</script>
</html>