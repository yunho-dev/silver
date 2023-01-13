<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 은빛 우산 부트스트랩 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<script src="assets/js/jquery.twbsPagination.js"></script>
</head>
<style>
	.filter{
		width: 15%;
	}
	.thHistoryRow{
		cursor: pointer;
	}
	
	#goBtn{
		margin-top: 10px;
	}
</style>
<body>
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
			<!-- 내용이 들어가는 공간 -->
			<div class="col-12 col-md-6 order-md-1 order-last" style="float:left;">
				<h3>비품 사용 예약 조회</h3>
			</div>
			<div style="float:right; margin-bottom: 5px;">
				<a href="thingHistory" class="btn btn btn-secondary" id="goBtn">사용내역조회</a>
				<a class="btn btn btn-primary" id="goBtn">사용예약조회</a>
			</div><div style="clear:both;"></div>
			<!-- Table head options start -->
             <section class="section">
                 <div class="row" id="table-hover-row">
                     <div class="col-12">
                         <div class="card" style="margin-bottom: 1%">
                             <div class="card-header" id="filterHead" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
		                        품명 : <input type="text" name="th_name" class="filter"> &nbsp;&nbsp;
		                        사용자 : <input type="text" name="b_write" class="filter"> &nbsp;&nbsp;
		                        예약 시작 날짜 : <input type="text" name="b_start" class="filter"> &nbsp;&nbsp;
		                        <button class="btn btn-secondary" onclick="search(page2)">검색</button>
		                    </div>
							<!-- table head dark -->
							<div class="table-responsive">
							    <table class="table table-hover mb-0" style="text-align: center;">
							        <thead class="thead-dark">
							            <tr>
							                <th>순번</th>
							                <th>품명</th>
							                <th>이용 시작일</th>
							                <th>이용 종료일</th>
							                <th>예약자</th>
							            </tr>
							        </thead>
							        <tbody id="list">
							        	<!-- list가 들어갈 공간 -->
							        </tbody>
							    </table>
							</div>
							<ul class="pagination" id="pagination" style="margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px;"></ul>
                         </div>
						<div class="buttons" style="text-align: right; margin-right: 5%;">
		                   	<a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#thingHistoryWrite">등록하기</a>
						</div>
                     </div>
                 </div>
             </section>
             <!-- 모달 -->
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
</body>
<script>
	var showPage=1;
	
	ListCall(showPage);
	
	function ListCall(page){
		$.ajax({
			type:'GET',
			url:'getThingBook.do',
			data:{page:page},
			dataType:'JSON',
			success:function(data){
				drawList(data.list);
				$("#pagination").twbsPagination({
					startPage : 1, // 시작 페이지
					totalPages : data.total, // 총 페이지 수
					visiblePages : 5, // 기본으로 보여줄 페이지 수
					onPageClick : function(e, page) { // 클릭했을때 실행 내용
						ListCall(page)
					}
				});
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function drawList(bookList){
		var content='';
		for(var i=0; i<bookList.length;i++){
			var startDate=new Date(bookList[i].b_start);
			var endDate=new Date(bookList[i].b_end);
			content +='<tr class="thBookRow">';
			content +='<td class="cb_idx">'+bookList[i].cb_idx+'</td>';
			content +='<td>'+bookList[i].th_name+'</td>';
			content +='<td>'+startDate.toLocaleDateString('ko-KR')+'</td>';
			content +='<td>'+endDate.toLocaleDateString('ko-KR')+'</td>';
			content +='<td>'+bookList[i].b_write+'</td>';
			content +='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);
	}
	
	var flag=true;
	var pageflag=true;
	var page2=1;
	var chkPage=new Array();
	function search(page2){
		thName = $('#filterHead input[name=th_name]').val();
		bWrite = $('#filterHead input[name=b_write]').val();
		bStart = $('#filterHead input[name=b_start]').val();
		$.ajax({
			type:'GET',
			url:'getThingBookSearch.do',
			data:{'page':page2, thName:thName, bWrite:bWrite, bStart:bStart},
			dataType:'JSON',
			success:function(data){
				console.log(data)
			},
			error:function(e){
				console.log(data)
			}
		});
	}
	
	
</script>
</html>