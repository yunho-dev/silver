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
		width: 90px;
	}
	.thBookRow{
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
			<!-- 내용이 들어가는 공간 -->
			<div class="col-12 col-md-6 order-md-1 order-last" style="float:left;">
				<h3>비품 사용 예약 조회</h3>
			</div>
			<div style="float:right; margin-bottom: 5px;">
				<a href="thingHistory?page=item" class="btn btn btn-secondary" id="goBtn">사용내역조회</a>
				<a class="btn btn btn-primary" id="goBtn">사용예약조회</a>
			</div><div style="clear:both;"></div>
			<!-- Table head options start -->
             <section class="section">
                 <div class="row" id="table-hover-row">
                     <div class="col-12">
                         <div class="card" style="margin-bottom: 1%">
                             <div class="card-header" id="filterHead" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
		                        품명 : <input type="text" name="th_name" class="filter"> &nbsp;&nbsp;
		                        사용자 : <input type="text" name="user" class="filter"> &nbsp;&nbsp;
		                        예약 시작 날짜 : <input type="text" name="b_start" class="filter"> &nbsp;&nbsp;
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
							                <th>이용 시작일</th>
							                <th>이용 종료일</th>
							                <th>사용자</th>
							                <th>취소 여부</th>
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
		                   	<a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#thingBookWrite">등록하기</a>
						</div>
                     </div>
                 </div>
             </section>
             <!-- 모달 -->
             <jsp:include page="thingBookWrite.jsp"></jsp:include>
             <jsp:include page="thingBookDetail.jsp"></jsp:include>
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
	
	$(function() {
		//input을 datepicker로 선언
		$("#bookStart").datepicker({
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
		    ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		    ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		});
		
		$("#bookEnd").datepicker({
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
		    ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		    ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		});
		 $('#bookStart').datepicker('option','disabled',true); //datepicker 끔
		 $('#bookEnd').datepicker('option','disabled',true); //datepicker 끔
		
	});
	
	/** 
	 * 모달을 닫아주는 함수
	 * num 설명
	 * 1 : 비품 예약 등록 모달
	 * 2 : 비품 예약 취소 모달
	 */
	function closeModal(num){
		 switch (num) {
		case 1: // 차량 정보 등록 모달
			var $bStart = $('#writeForm input[name=bStart]');
			var $bEnd = $('#writeForm input[name=bEnd]');
			$('#thingBookWrite').modal('hide');
			$('#writeForm')[0].reset();
			$('#writeForm input[name=user]').attr('onclick','alert("사용자 구분을 먼저 선택해 주세요")')
			$bStart.attr('readonly', true)
			$bEnd.attr('readonly', true)
			$('#bookStart').datepicker('option','disabled',true); //datepicker 끔
			$('#bookEnd').datepicker('option','disabled',true); //datepicker 끔
			$bStart.attr('placeholder', '품명을 먼저 선택해 주세요')
			$bEnd.attr('placeholder', '품명을 먼저 선택해 주세요')
			break;
		case 2: // 비품 예약 취소 모달
			$('#thingBookCancel').modal('hide');
			$('#cancleForm')[0].reset();
			break;
		default:
			alert('모달을 닫는 중 알 수 없는 오류가 발생했습니다. \n다시 시도해 주세요');
		}
	}
	
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
			content +='<tr class="thBookRow" data-bs-toggle="modal" data-bs-target="#thingBookDetail" onclick="detail($(this))">';
			content +='<td class="cb_idx">'+bookList[i].cb_idx+'</td>';
			content +='<td>'+bookList[i].th_name+'</td>';
			content +='<td>'+startDate.toLocaleDateString('ko-KR')+'</td>';
			content +='<td>'+endDate.toLocaleDateString('ko-KR')+'</td>';
			if(bookList[i].re_name!=null){
				content +='<td>'+bookList[i].re_name+'</td>';
			}else{
				content +='<td style="color: blue;">'+bookList[i].mem_name+'</td>';
			}
			if(bookList[i].b_cancel == 1){
				content +='<td>취소 안 함</td>';
			}else{
				content +='<td style="color: red;">취소</td>';
			}
			content +='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);
	}
	
	var flag=true;
	var pageflag=true;
	var page2=1;
	var select_change=new Array();
	var select_change2=new Array();
	var chkPage=new Array();
	function search(page2){
		var thName = $('#filterHead input[name=th_name]').val();
		var userName = $('#filterHead input[name=user]').val();
		var bStart = $('#filterHead input[name=b_start]').val();
		var checkAllView = '비사용중';
		if($('#filterHead #checkAllView').is(":checked")){
			checkAllView = '전체';
		}
		if(flag){
			flag=false;
			$.ajax({
				type:'GET',
				url:'getThingBookSearch.do',
				data:{'page':page2, thName:thName, userName:userName, bStart:bStart, checkAllView:checkAllView},
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
					console.log(data)
				},complete:function(){
	    			flag=true;
	    		}
			});
		}
	}
	
	function detail(listRow){
		var cbIdx = $(listRow).find('td.cb_idx').text();
	    $.ajax({
	    	type:'GET',
			url:'getThingBookDetail.do',
			data:{cbIdx:cbIdx},
			dataType:'JSON',
			success:function(data){
				var startDate = new Date(data.detail.b_start)
				var endDate = new Date(data.detail.b_end)
				$("#thingBookDetail #cbIdx").val(data.detail.cb_idx);
				$("#thingBookDetail .th_name").text(data.detail.th_name);
				if(data.detail.mem_name == null){
					$("#thingBookDetail .b_name").text(data.detail.re_name);
				}else{
					$("#thingBookDetail .b_name").text(data.detail.mem_name);
				}
				$("#thingBookDetail .b_write").text(data.detail.b_write);
				$("#thingBookDetail .b_start").text(startDate.toLocaleDateString('ko-KR'));
				$("#thingBookDetail .b_end").text(endDate.toLocaleDateString('ko-KR'));
				if(data.detail.b_cancel == 1){
					$("#thingBookDetail #hideComent").css('display', 'none');
					$("#thingBookDetail .b_cancel").text('취소 안 함').css('color', 'blue');
					$('#bookCancel').css('display', 'inline-block')
				}else{
					$("#thingBookDetail .b_cancel").text('취소').css('color', 'red');
					$("#thingBookDetail #hideComent").css('display', 'block');
					$("#thingBookDetail .b_coment").text(data.detail.b_content);
					$('#bookCancel').css('display', 'none')
				}
			},
			error:function(e){
				console.log(e);
			}
	    });
	}
	
</script>
</html>