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
</style>
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
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>비품 관리 대장 조회</h3>
			</div>
			<!-- Table head options start -->
             <section class="section">
                 <div class="row" id="table-head">
                     <div class="col-12">
                         <div class="card" style="margin-bottom: 1%">
                             <div class="card-header" id="filterHead" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
		                        품명 : <input type="text" name="th_name" class="filter"> &nbsp;&nbsp;
		                        모델명 : <input type="text" name="th_model" class="filter"> &nbsp;&nbsp;
		                        구분 : <select name="th_part" id="selectPart">
		                        			<option value="" selected="selected">전체</option>
		                        			<option value="후원">후원</option>
		                        			<option value="렌탈">렌탈</option>
		                        			<option value="직접 구매">직접 구매</option>
		                        		</select> &nbsp;&nbsp;
		                        <button class="btn btn-secondary" onclick="search(page2)">검색</button>
		                    </div>
							<!-- table head dark -->
							<div class="table-responsive">
							    <table class="table mb-0" style="text-align: center;">
							        <thead class="thead-dark">
							            <tr>
							                <th>품명</th>
							                <th>모델명</th>
							                <th>구분</th>
							                <th>단가</th>
							                <th>수량</th>
							                <th>총 금액</th>
							            </tr>
							        </thead>
							        <tbody id="list">
							        	<!-- list가 들어갈 공간 -->
							        </tbody>
							    </table>
							</div>
							<ul class="pagination" id="pagination" style="margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px;"></ul>
                         </div>
                     </div>
                 </div>
             </section>
             <!-- Table head options end -->
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
			url:'getThingManageList.do',
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
	
	function drawList(manageList){
		var content='';
		for(var i=0; i<manageList.length;i++){
			content +='<tr>';
			content +='<td>'+manageList[i].it_name+'</td>';
			content +='<td>'+manageList[i].th_model+'</td>';
			content +='<td>'+manageList[i].th_part+'</td>';
			content +='<td>'+manageList[i].th_money.toLocaleString('ko-KR')+'&#8361;</td>';
			content +='<td>'+manageList[i].thCnt+'</td>';
			content +='<td>'+manageList[i].sumMoney.toLocaleString('ko-KR')+'&#8361;</td>';
			content +='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);
	}
	
	var flag=true;
	var pageflag=true;
	var page2=1;
	var select_change=new Array();
	var chkPage=new Array();
	function search(page2){
		var select=$("#selectPart").val();
		var thName = $('#filterHead input[name=th_name]').val();
		var thModel = $('#filterHead input[name=th_model]').val();
		var thPart = $('#filterHead select[name=th_part]').val();
		select_change.push($("#selectPart").val());
		if(flag){
	        var select=$("#selectPart").val();
	        flag=false;
			$.ajax({
				type:'GET',
				url:'getThingManageSearch.do',
				data:{'page':page2, thName:thName, thModel:thModel, thPart:thPart},
				dataType:'JSON',
				success:function(data){
					drawList(data.list);
					chkPage.push(data.total);
					if(chkPage.at(-2) != data.total){
	    				pageflag=true;
	    			}
					if(pageflag == true && $('.pagination').data("twbs-pagination")
	    					|| select_change.at(-2) != $("#selectPart").val()){
	                    $('.pagination').twbsPagination('destroy');
	                    pageflag=false;
	                }
					$("#pagination").twbsPagination({
	    				startPage : 1 // 시작 페이지
	    				,totalPages : data.total // 총 페이지 수
	    				,visiblePages : 5 // 기본으로 보여줄 페이지 수
	    				,onPageClick : function(e, page) { // 클릭했을때 실행 내용
	    					search(page);
	    				}
	    			});
				},
				error:function(e){
					console.log(e);
				},complete:function(){
	    			flag=true;
	    		}
			});
		}
	}
	
</script>
</html>