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
<!-- datePicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
			<div class="col-12 col-md-6 order-md-1 order-last" style="float:left;">
					<h3>비품 사용 내역 조회</h3>
			</div>
			<div style="float:right; margin-bottom: 5px;">
					 <a class="btn btn btn-primary" id="goBtn">사용내역조회</a>
					 <a href="thingBook.go?page=item" class="btn btn btn-secondary" id="goBtn">사용예약조회</a>
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
	
	/** 
	 * 모달을 닫아주는 함수
	 * num 설명
	 * 1 : 비품 사용 내역 등록 모달
	 * 2 : 비품 사용 내역 수정 모달
	 */
	function closeModal(num){
		 switch (num) {
		case 1: // 비품 사용 내역 등록 모달
			$('#thingHistoryWrite').modal('hide');
			$('#writeForm')[0].reset();
			$('#writeRentDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			break;
		case 2: // 비품 사용 내역 수정 모달
			$('#thingHistoryModify').modal('hide');
			$('#updateForm')[0].reset();
			break;
		default:
			alert('모달을 닫는 중 알 수 없는 오류가 발생했습니다. \n다시 시도해 주세요');
		}
	}
	
	$(function() {
		$("#writeRentDate").datepicker({
		    dateFormat: 'yy-mm-dd' //달력 날짜 형태
		    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		    ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
		    ,changeYear: true //option값 년 선택 가능
		    ,changeMonth: true //option값  월 선택 가능                
		    ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
		    ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
		    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
		    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
		    ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		    ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		});
		//초기값을 오늘 날짜
		$('#writeRentDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		
		$("#modiRentDate").datepicker({
		    dateFormat: 'yy-mm-dd' //달력 날짜 형태
		    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		    ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
		    ,changeYear: true //option값 년 선택 가능
		    ,changeMonth: true //option값  월 선택 가능                
		    ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
		    ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
		    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
		    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
		    ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		    ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		});
		
		$("#modiReturnDate").datepicker({
		    dateFormat: 'yy-mm-dd' //달력 날짜 형태
		    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		    ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
		    ,changeYear: true //option값 년 선택 가능
		    ,changeMonth: true //option값  월 선택 가능
		    ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
		    ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
		    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
		    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
		    ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		    ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		});
		
	});
	
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
			if(historyList[i].his_return == null || historyList[i].his_return == '1900-01-01'){
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
		var thName = $('#filterHead input[name=th_name]').val();
		var thModel = $('#filterHead input[name=th_model]').val();
		var hisName = $('#filterHead input[name=his_name]').val();
		var checkAllView = '비사용중';
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
					$('#thingHistoryDetail .noData').css('display', 'block')
					$("#thingHistoryDetail #hisIdx").val(noData);
					$("#thingHistoryDetail .th_name").text(noData);
					$("#thingHistoryDetail .th_model").text(noData);
					$("#thingHistoryDetail .th_money").text(noData);
					$("#thingHistoryDetail .th_spon").text(noData);
					$("#thingHistoryDetail .his_name").text(noData);
					$("#thingHistoryDetail .his_goal").text(noData);
					$("#thingHistoryDetail .th_part").text(noData);
					$("#thingHistoryDetail .th_state").text(noData);
					$("#thingHistoryDetail .th_date").text(noData);
					$("#thingHistoryDetail .his_rent").text(noData);
					$("#thingHistoryDetail .his_return").text(noData);
					$("#thingHistoryDetail .his_write").text(noData);
					$("#thingHistoryDetail .his_bigo").text(noData);
				}else{
					$('#thingHistoryDetail .noData').css('display', 'none')
					$("#thingHistoryDetail #hisIdx").val(data.detail.his_idx);
					$("#thingHistoryDetail .th_name").text(data.detail.th_name);
					$("#thingHistoryDetail .th_model").text(data.detail.th_model);
					$("#thingHistoryDetail .th_money").text(data.detail.th_money.toLocaleString('ko-KR')+'￦');
					$("#thingHistoryDetail .th_spon").text(data.detail.th_spon);
					$("#thingHistoryDetail .his_name").text(data.detail.his_name);
					$("#thingHistoryDetail .his_goal").text(data.detail.his_goal);
					$("#thingHistoryDetail .th_part").text(data.detail.th_part);
					$("#thingHistoryDetail .th_state").text(data.detail.th_state);
					$("#thingHistoryDetail .th_date").text(data.detail.th_date);
					$("#thingHistoryDetail .his_rent").text(data.detail.his_rent);
					if(data.detail.his_return == '1900-01-01'){
						$("#thingHistoryDetail .his_return").text('없음');
					}else{
						$("#thingHistoryDetail .his_return").text(data.detail.his_return);
					}
					$("#thingHistoryDetail .his_write").text(data.detail.his_write);
					$("#thingHistoryDetail .his_bigo").text(data.detail.his_bigo);
				}
			},
			error:function(e){
				console.log(e);
			}
	    })
	}
	
	
</script>
</html>