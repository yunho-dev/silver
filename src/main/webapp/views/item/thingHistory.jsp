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
	
	#checkAllView{
		vertical-align: -8px;
    	width: 30px;
    	height: 30px;
	}
</style>
<body>
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
			<div class="col-12 col-md-6 order-md-1 order-last" style="float:left;">
					<h3>비품 사용 내역 조회</h3>
			</div>
			<div style="float:right; margin-bottom: 5px;">
					 <a class="btn btn btn-primary" id="goBtn">사용내역조회</a>
					 <a href="thingBook.go" class="btn btn btn-secondary" id="goBtn">사용예약조회</a>
				</div><div style="clear:both;"></div>
			<!-- Table head options start -->
             <section class="section">
                 <div class="row" id="table-hover-row">
                     <div class="col-12">
                         <div class="card" style="margin-bottom: 1%">
                             <div class="card-header" id="filterHead" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
		                        품명 : <input type="text" name="th_name" class="filter"> &nbsp;&nbsp;
		                        모델명 : <input type="text" name="th_model" class="filter"> &nbsp;&nbsp;
		                        사용자 : <input type="text" name="his_name" class="filter"> &nbsp;&nbsp;
                                <label class="form-check-label" for="customColorCheck2">전체보기 : 
		                        	<input type="checkbox" id="checkAllView">
		                        </label> &nbsp;&nbsp;
		                        <button class="btn btn-secondary" onclick="search(page2)">검색</button>
		                    </div>
							<!-- table head dark -->
							<div class="table-responsive">
							    <table class="table table-hover mb-0" style="text-align: center;">
							        <thead class="thead-dark">
							            <tr>
							                <th>순번</th>
							                <th>품명</th>
							                <th>구분</th>
							                <th>사용자</th>
							                <th>대여한 날짜</th>
							                <th>반납 받은 날짜</th>
							                <th>상태</th>
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
             <jsp:include page="thingHistoryWrite.jsp"></jsp:include>
             <jsp:include page="thingHistoryDetail.jsp"></jsp:include>
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
			url:'getThingHistoryList.do',
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
	
	function drawList(historyList){
		var content='';
		for(var i=0; i<historyList.length;i++){
			var rentDate=new Date(historyList[i].his_rent);
			var returnDate=new Date(historyList[i].his_return);
			content +='<tr class="thHistoryRow" data-bs-toggle="modal" data-bs-target="#thingHistoryDetail" onclick="detail($(this))">';
			if(historyList[i].his_idx == 0){
				content +='<td class="his_idx">이력없음</td>';
			}else{
				content +='<td class="his_idx">'+historyList[i].his_idx+'</td>';
			}
			if(historyList[i].th_name == null){
				content +='<td>없음</td>';
			}else{
				content +='<td>'+historyList[i].th_name+'</td>';
			}
			content +='<td>'+historyList[i].th_part+'</td>';
			if(historyList[i].his_name == null){
				content +='<td>없음</td>';
			}else{
				content +='<td>'+historyList[i].his_name+'</td>';
			}
			if(historyList[i].his_rent == null){
				content +='<td>없음</td>';
			}else{
				content +='<td>'+rentDate.toLocaleDateString('ko-KR')+'</td>';
			}
			if(historyList[i].his_return == null){
				content +='<td>없음</td>';
			}else{
				content +='<td>'+returnDate.toLocaleDateString('ko-KR')+'</td>';
			}
			content +='<td>'+historyList[i].th_state+'</td>';
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
		thModel = $('#filterHead input[name=th_model]').val();
		hisName = $('#filterHead input[name=his_name]').val();
		checkAllView = '비사용중';
		if($('#filterHead #checkAllView').is(":checked")){
			checkAllView = '전체';
		}
		if(flag){
	        var select=$("#selectPart").val();
	        flag=false;
			$.ajax({
				type:'GET',
				url:'getThingHistorySearch.do',
				data:{'page':page2, thName:thName, thModel:thModel, hisName:hisName, checkAllView:checkAllView},
				dataType:'JSON',
				success:function(data){
					drawList(data.list);
					chkPage.push(data.total);
					if(chkPage.at(-2) != data.total){
	    				pageflag=true;
	    			}
					if(pageflag == true && $('.pagination').data("twbs-pagination")){
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
	
	function detail(listRow){
		var hisIdx = $(listRow).find('td.his_idx').text();
		var data = $(listRow).data('id');
	    $(".modal-body #hisIdx").html(data);
	    $.ajax({
	    	type:'GET',
			url:'getThingHistoryDetail.do',
			data:{hisIdx:hisIdx},
			dataType:'JSON',
			success:function(data){
				var noData = '';
				if(data.detail==null){
					$('.modal-body .noData').css('display', 'block')
					$(".modal-body .left #hisIdx").val(noData);
					$(".modal-body .left .th_name").text(noData);
					$(".modal-body .left .th_model").text(noData);
					$(".modal-body .left .th_money").text(noData);
					$(".modal-body .left .th_spon").text(noData);
					$(".modal-body .left .his_name").text(noData);
					$(".modal-body .left .his_goal").text(noData);
					$(".modal-body .right .th_part").text(noData);
					$(".modal-body .right .th_state").text(noData);
					$(".modal-body .right .th_date").text(noData);
					$(".modal-body .right .his_rent").text(noData);
					$(".modal-body .right .his_return").text(noData);
					$(".modal-body .right .his_write").text(noData);
					$(".modal-body .his_bigo").text(noData);
				}else{
					$('.modal-body .noData').css('display', 'none')
					$(".modal-body .left #hisIdx").val(data.detail.his_idx);
					$(".modal-body .left .th_name").text(data.detail.th_name);
					$(".modal-body .left .th_model").text(data.detail.th_model);
					$(".modal-body .left .th_money").text(data.detail.th_money);
					$(".modal-body .left .th_spon").text(data.detail.th_spon);
					$(".modal-body .left .his_name").text(data.detail.his_name);
					$(".modal-body .left .his_goal").text(data.detail.his_goal);
					$(".modal-body .right .th_part").text(data.detail.th_part);
					$(".modal-body .right .th_state").text(data.detail.th_state);
					$(".modal-body .right .th_date").text(data.detail.th_date);
					$(".modal-body .right .his_rent").text(data.detail.his_rent);
					$(".modal-body .right .his_return").text(data.detail.his_return);
					$(".modal-body .right .his_write").text(data.detail.his_write);
					$(".modal-body .his_bigo").text(data.detail.his_bigo);
				}
			},
			error:function(e){
				console.log(e);
			}
	    })
	}
	
	
</script>
</html>