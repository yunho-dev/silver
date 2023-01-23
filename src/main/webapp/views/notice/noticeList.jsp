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
				<h3>공지사항</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
						<input id="writebutton" type="button" class="btn btn-primary" value="공지사항 등록" style="margin-bottom:10px;"
						onclick='writeNotice()'>
							<div class="d-flex align-items-center">
								<table class="table table-bordered table-hover"
									style="text-align: center;">
									<thead>
										<tr>
											<th>글번호</th>
											<th class="col-md-6">제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="list">

									</tbody>
								</table>
							</div>
						</div>
						<div class="card-body py-4 px-5" style="margin:0 auto;">
							<div>
								<select id="select">
									<option value="title">제목</option>
									<option value="write">작성자</option>
								</select> <input type="text" name="seacontent" id="seacontent">
								<button id="search" type="button" class="btn btn-primary btn-sm" onclick="noticeSearch(page2)">검색</button>
							</div>
						</div>
						<div class="card-body py-4 px-5" style="margin:0 auto;">
							<div id="pagint">
								<div class="container">
									<nav aria-label="Page navigation" style="text-align: center;">
										<ul class="pagination" id="pagination"></ul>
									</nav>
								</div>
							</div>
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
var session='';
function writeNotice(){
	console.log('글쓰기 테스트');
	location.href='noticeWrite.do?page=board2';
}

var page = 1;
AjaxCall(page);
function AjaxCall(page) {
	$.ajax({
		type : 'get',
		url : 'notice/list.ajax',
		dataType : 'json',
		data : {
			"page" : page
		},
		success : function(data) {
			listCall(data.list);
			btnChk(data.sessionLevel);
			session=data.SessionID;
			$("#pagination").twbsPagination({
				startPage : 1 // 시작 페이지
				,totalPages : data.page_idx // 총 페이지 수
				,visiblePages : 4 // 기본으로 보여줄 페이지 수
				,onPageClick : function(e, page) { // 클릭했을때 실행 내용
					AjaxCall(page);
				}
			});
		},
		error : function(e) {
			console.log(e);
		}
	});

}

	var flag=true;
	var pageflag=true;
	var page2=1;
	var select_change=new Array();
	var chkPage=new Array();
	function noticeSearch(page2){
    	select_change.push($("#select").val());
    	if(flag){
        var select=$("#select").val();
        var seacontent=$("#seacontent").val();
    	flag=false;
    	if(seacontent == ""){
    		window.location.reload();
    	}
    	
    	$.ajax({
    		type:'get'
    		,url:'searchNotice'
    		,dataType:'json'
    		,data:{'select':select,'seacontent':seacontent,'page':page2}
    		,success:function(data){
    			listCall(data.list);
    			chkPage.push(data.page_idx);
    			if(chkPage.at(-2) != data.page_idx){
    				pageflag=true;
    			}
    			if(pageflag == true && $('.pagination').data("twbs-pagination")
    					|| select_change.at(-2) != $("#select").val()){
                    $('.pagination').twbsPagination('destroy');
                    pageflag=false;
                }
    			$("#pagination").twbsPagination({
    				startPage : 1 // 시작 페이지
    				,totalPages : data.page_idx // 총 페이지 수
    				,visiblePages : 4 // 기본으로 보여줄 페이지 수
    				,initiateStartPageClick:false
    				,onPageClick : function(e, page) { // 클릭했을때 실행 내용
    					noticeSearch(page);
    				}
    			});
    		}
    		,error:function(e){
    			console.log(e);
    		},complete:function(){
    			flag=true;
    		}
    	});
    	}
	}

	function listCall(list) {
		var content = '';
		console.log('세션 값'+session);
		for (var i = 0; i < list.length; i++) {
			content += "<tr>";
			content += "<td>" + list[i].bd_idx + "</td>";
			content += "<td id='detail'><a href='noticeDetail.do?page=board2&bd_idx="+list[i].bd_idx+"'>" + list[i].bd_title + "</td>";
			content += "<td>" + list[i].mem_name + "</td>";
			var date = new Date(list[i].bd_date);
			content += "<td>" + date.toLocaleDateString("ko-KR") + " "+ date.toLocaleTimeString("en-US", {hour12 : false}) + "</td>";
			content += "<td>"
			if(list[i].mem_id == session){
			content	+= "<button class='btn btn-primary btn-sm' onclick=location.href='noticeUpdate.do?page=board2&bd_idx="+list[i].bd_idx+"'>수정하기</button>"
			}
			content	+= "</td>";
			content += "</tr>";
		}
		$("#list").empty();
		$("#list").append(content);
	}
	
	
	function btnChk(chk){
		if(!(chk < 4)){
			$("#writebutton").css('display','none');
		}
	}
	
	
	
	
	
	
</script>
</html>