<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style></style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<script src="assets/js/jquery.twbsPagination.js"></script>
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
			<div class="page-heading">
				<h3>결재 대기 결재함</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
							<div class="d-flex align-items-center">
							 <table class="table table-bordered table-hover" style="text-align: center;">
							 	<thead>
							 		<tr>
							 			<th>문서번호</th>
							 			<th class="col-md-4">제목</th>
							 			<th>결재양식</th>
							 			<th>기안자</th>
							 			<th>결재상태</th>
							 			<th></th>
							 		</tr>
							 	</thead>
								<tbody id="myPayMentList"></tbody>						 	
							 </table>
							</div>
						</div>
<!-- 						<div class="card-body py-4 px-5" style="margin:0 auto;"> -->
<!-- 							<div> -->
<!-- 								<select id="select"> -->
<!-- 									<option value="write">기안자</option> -->
<!-- 									<option value="title">제목</option> -->
<!-- 									<option value="payselect">결재양식</option> -->
<!-- 								</select> <input type="text" name="seacontent" id="seacontent"> -->
<!-- 								<button id="search" type="button" class="btn btn-primary btn-sm" onclick="">검색</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="card-body py-4 px-5" style="margin:0 auto;"> -->
<!-- 							<div id="pagint"> -->
<!-- 								<div class="container"> -->
<!-- 									<nav aria-label="Page navigation" style="text-align: center;"> -->
<!-- 										<ul class="pagination" id="pagination"></ul> -->
<!-- 									</nav> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</section>
			</div>
			
			<div class="modal fade" id="PayHistory" tabindex="-1" role="dialog" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog modal-lg">
			   <div class="modal-content">
			   	 <div class="modal-header">
			   	 	<h3>결재 로그</h3>
			   	 </div>
			   	  <div class="modal-body table-wrapper-scroll-y my-custom-scrollbar" style="margin: 0 auto">
			   	  	<table class="table table-bordered table-hover" style="margin: 0 auto">
			   	  		<thead>	
			   	  			<tr>
			   	  				<th>순번</th>
			   	  				<th>기안자</th>
			   	  				<th>IP</th>
			   	  				<th>결재 상태</th>
			   	  				<th>결재 라인</th>
			   	  				<th>시간</th>
			   	  			</tr>
			   	  		</thead>	
			   	  		<tbody id="PHLIST">
			   	  		</tbody>
			   	  	</table>
     			 </div>
     			 <div class="modal-footer">
     			 	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">닫기</button>
     			 </div>
			   </div>
			</div>
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
paymentCall();

var mem_id=''
function paymentCall(){
	$.ajax({
		type:'get'
		,url:'waitpayment.ajax'
		,dataType:'json'
		,success:function(data){
			console.log(data);
			mem_id=data.mem_id;
			paymentListCall(data.wait,mem_id);
		},error:function(e){
			console.log(e);
		}
	});
}

function paymentListCall(wait,mem_id){
	console.log(mem_id);
	var a=0;
	var content ='';
	for(var i=0;i<wait.length;i++){
		if(i > 1){
			a=i-1;
		}
		if (wait[i].pl_hp == mem_id) {
					content +="<tr>";
					content +="<td>"+wait[i].pm_idx+"</td>";
					content +="<td><a href='detailPayment.do?page=payment&pm_idx="+wait[i].pm_idx+"'>"+wait[i].pm_subject+"</a></td>";
					content +="<td>"+wait[i].pf_cate+"</td>";
					content +="<td>"+wait[i].mem_name+"</td>";
					content +="<td>"+wait[i].pm_state+"</td>";
					content +="<td><input type='button' class='btn btn-sm btn-primary' value='기록'";
					content +="data-bs-toggle='modal' data-bs-target='#PayHistory' onclick='PayHistoryCall("+wait[i].pm_idx+")'></td>";
					content +="</tr>";
	}
	$("#myPayMentList").empty();
	$("#myPayMentList").append(content);
}
}


function PayHistoryCall(pm_idx){
	console.log("IDX 값 : "+pm_idx);
	$.ajax({
		type:'get'
		,url:'PayHistory.ajax'
		,data:{'pm_idx':pm_idx}
		,dataType:'json'
		,success:function(data){
			console.log(data);
			PayHistoryCallList(data.hisList);
		},error:function(e){
			console.log(e);
		}
	});
}
function PayHistoryCallList(PHlist){
	var content ='';
	for(var i=0;i<PHlist.length;i++){
		content +='<tr>';
		content +='<td>'+PHlist[i].rowNum+'</td>';
		content +='<td>'+PHlist[i].ph_name+'</td>';
		content +='<td>'+PHlist[i].ph_ip+'</td>';
		content +='<td>'+PHlist[i].ph_state+'</td>';
		content +='<td>'+PHlist[i].mem_name+'['+PHlist[i].dept_name+']</td>';
		var date = new Date(PHlist[i].ph_date);
        content += "<td>" + date.toLocaleDateString("ko-KR") + " "+ date.toLocaleTimeString("en-US", {hour12 : false}) + "</td>";
		content +='</tr>';
	}
	$("#PHLIST").empty();
	$("#PHLIST").append(content);
}
	
</script>
</html>