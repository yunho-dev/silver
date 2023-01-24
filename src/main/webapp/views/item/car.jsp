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
<!-- dateTimePicker -->
<link rel="stylesheet" href="assets/css/jquery.datetimepicker.min.css" />
<script src="assets/js/jquery.datetimepicker.full.min.js"></script>
</head>
<style>
	table{
		text-align: center;
	}
	div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
    div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
    }
    div.regiBottom{
    	display: inline-block;
    	width: 100%;
    	text-align: center;
    }
    #WriteName {
    	font-weight: bolder;
    	font-size: large;
    }
    #plzCarChoice {
    	text-align: center;
    	margin-top: 17px;
    }
    #detailName{
    	font-weight: bolder;
    	font-size: large;
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
			<!-- Basic Tables start -->
                <section class="section">
                    <div class="row" id="basic-table">
                        <div class="col-12 col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title" style="float:left;">차량 등록 현황</h3>
                                    <a class="btn btn btn-primary" id="carResistBtn" data-bs-toggle="modal" data-bs-target="#carResist" style="float:right;">차량 정보 등록</a>
                                </div>
                                <div class="card-content">
                                        <!-- Table with outer spacing -->
                                        <div class="table-responsive" style="height:700px; overflow:auto">
                                            <table class="table table-hover mb-0">
                                                <thead style="white-space:nowrap;">
                                                    <tr>
                                                        <th>상태</th>
                                                        <th>차량명</th>
                                                        <th>차량번호</th>
                                                        <th>차종</th>
                                                        <th>연식</th>
                                                        <th>구분</th>
                                                        <th>처리</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="carList"> 
                                                <!-- 리스트 들어갈 공간 -->
                                                </tbody>
                                            </table>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="card" >
                                <div class="card-header" style="float:left; background-color: #e1f3ed;">
								 	<a class="btn btn btn-primary" id="carHis" onclick='driveHistoryDo($(this), this.id)'>운행기록</a>
								 	<a class="btn btn btn-secondary" id="carBook" onclick='driveBookDo($(this), this.id)'>사용예약</a>
                                </div>
                                	<div id="plzCarChoice">
                                		<p>&lt;&lt; 차량을 선택해 주세요 &gt;&gt;</p>
                                	</div>
                                	<!-- 차량 운행 기록 -->
                                	<div class="modal-body" id="driveHistory" style="border: 1px solid; display: none;">
                                		<form id="historyWrite">
                                			<div>
	                                			<h5 style="margin-bottom: 15px;"><span class="plsCarNum"></span>운행 등록</h5>
	                                			<div class="left">
	                                				<p class="writeArea" ><span id="WriteName">운행일 </span> 
														&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="chisDate" id="chisDate" autocomplete="off">
													</p><br>
													<p class="writeArea"><span id="WriteName">운행지역 </span> 
														<input type="text" name="chisPlace">
													</p><br>
													<p class="writeArea"><span id="WriteName">운행거리 </span> 
														<input type="text" name="chisKm" style="width: 150px;"><span id="WriteName">&nbsp;km</span>
													</p><br>
													<p class="writeArea"><span id="WriteName">운행목적 </span> 
														<input type="text" name="chisReason">
													</p><br>
	                                			</div>
	                                			<div class="right">
	                                				<p class="writeArea"><span id="WriteName">운전자 </span> 
														<input type="text" name="chisDriver">
													</p><br>
	                                				<p class="writeArea"><span id="WriteName">주유량 </span> 
														<input type="text" name="chisLiter"><span id="WriteName">&nbsp;L</span>
													</p><br>
	                                				<p class="writeArea">
	                                				<span id="WriteName">비고 </span><br>
													<textarea id="chisBigo" name="chisBigo"
														rows="3" style="resize: none; width: 100%;"></textarea>
													</p><br>
	                                			</div>
                                			</div>
                                			<div class="regiBottom">
                                				<a id="cHisResist" class="btn btn-primary">저장</a>
                                			</div>
                                		</form>
                                	</div>
                                    <!-- Table with no outer spacing -->
                                    <div class="table-responsive" id="driveHistoryList" style="display: none;">
                                    	<div class="card-header" >
		                                    <h4 class="card-title"><span class="plsCarNum"></span>운행 기록</h4>
		                                </div>
                                        <table class="table mb-0 table-lg" style="white-space:nowrap;">
                                            <thead>
                                                <tr>
                                                    <th>운행일</th>
                                                    <th>운전자</th>
                                                    <th>운행 지역</th>
                                                    <th>운행 목적</th>
                                                    <th>거리</th>
                                                    <th>주유량</th>
                                                    <th>비고</th>
                                                    <th>처리</th>
                                                </tr>
                                            </thead>
                                            <tbody id="historyList">
                                            	<!-- 리스트가 들어가는 공간 -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <ul class="pagination1" id="pagination1" style="margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px;"></ul>
                                    <!-- 차량 운행 기록 끝 -->
                                    
                                    <!-- 차량 사용 예약 -->
                                    <div class="modal-body" id="driveBook" style="border: 1px solid; display: none;">
                                		<form id="bookWrite">
                                			<div>
	                                			<h5 style="margin-bottom: 15px;"><span class="plsCarNumBook"></span>차량 사용 예약</h5>
	                                			<div class="left">
	                                				<p class="writeArea"><span id="WriteName">이용 시작 시간 : </span> 
														<input type="text" name="bStart" id="bDateStart" onchange="dateCheck()" autocomplete="off">
													</p><br>
													<p class="writeArea"><span id="WriteName">사용자 : </span> <br>
														<input type="text" name="bMem" id="selectMember" readonly="readonly" style="cursor: pointer;" placeholder="클릭해 주세요">
														<input type="hidden" name="bMemId" readonly="readonly">
													</p><br>
	                                			</div>
	                                			<div class="right">
	                                				<p class="writeArea"><span id="WriteName">이용 끝날 시간 : </span> 
														<input type="text" name="bEnd" id="bDateEnd" onchange="dateCheck()" autocomplete="off" >
													</p><br>
	                                			</div>
	                                			<div style="width: 100%; float: left; text-align: center;">
	                                				<p class="writeArea">
	                                					<span id="dateCheck" style="color: #B1B1B1; font-size: large;"></span> 
													</p><br>
	                                			</div>
                                			</div>
                                			<div class="regiBottom">
                                				<a id="carBookResistBtn" class="btn btn-primary">저장</a>
                                			</div>
                                		</form>
                                	</div>
                                    <!-- Table with no outer spacing -->
                                    <div class="table-responsive" id="driveBookList" style="display: none;">
                                    	<div class="card-header" >
		                                    <h4 class="card-title"><span class="plsCarNumBook"></span>사용 예약 기록</h4>
		                                </div>
                                        <table class="table table-hover mb-lg" style="white-space:nowrap; cursor: pointer;">
                                            <thead>
                                                <tr>
                                                    <th>순번</th>
                                                    <th>이용 시작 시간</th>
                                                    <th>이용 끝날 시간</th>
                                                    <th>사용자</th>
                                                    <th>취소 여부</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bookList">
                                            	<!-- 리스트가 들어가는 공간 -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <ul class="pagination2" id="pagination2" style="margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px; display: none;"></ul>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Tables end -->
                <!-- 모달 -->
                <jsp:include page="carResist.jsp"></jsp:include>
                <jsp:include page="carModify.jsp"></jsp:include>
                <jsp:include page="carHistoryModify.jsp"></jsp:include>
                <jsp:include page="carBookDetail.jsp"></jsp:include>
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
</body>
<script>
	var showPage=1;
	var carNum;
	var carIdx;
	var btnId = 'carHis';
	const dateRegex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	const dateTimeRegex = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])$/; // 날짜+시간+분
	const numRegex = /^[0-9]+$/; //숫자만
	const yearCheck =  /^[0-9]{4,4}$/; //숫자 4자리만
	carListCall();
	
	function carListCall(){
		$.ajax({
			type:'GET',
			url:'getCarList.do',
			dataType:'JSON',
			success:function(data){
				carDrawList(data.list);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function carDrawList(carList){
		var content='';
		for(var i=0; i<carList.length;i++){
			content +='<tr style="cursor: pointer;" onclick="showStory($(this))">';
			content +='<td class="carIdx" style="display:none;">'+carList[i].car_idx+'</td>';
			content +='<td>'+carList[i].car_state+'</td>';
			content +='<td>'+carList[i].car_name+'</td>';
			content +='<td class="carNum">'+carList[i].car_num+'</td>';
			content +='<td>'+carList[i].car_type+'</td>';
			content +='<td>'+carList[i].car_year+'</td>';
			content +='<td>'+carList[i].car_part+'</td>';
			content +='<td><a class="btn btn-sm btn-primary" onclick="carModifyInfo($(this))" data-bs-toggle="modal" data-bs-target="#carModify">수정</a></td>';
			content +='</tr>';
		}
		$('#carList').empty();
		$('#carList').append(content);
	}
	
	jQuery.datetimepicker.setLocale('kr');
	$(function() {
	       //input을 datepicker로 선언
	       $("#chisDate").datepicker({
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
	       $('#chisDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	       
	       $("#chisDateModify").datepicker({
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
	       
	       $("#bDateStart").datetimepicker({
				timepicker: true,
				lang: 'ko',
				format: 'Y-m-d H:i',
				scrollMonth: false,
				scrollInput: false,
				minDate : "today"
	       });
	       
	       $("#bDateEnd").datetimepicker({
				timepicker: true,
				lang: 'ko',
				format: 'Y-m-d H:i',
				scrollMonth: false,
				scrollInput: false,
				minDate : "today"
	       });
	   });
	
	function dateCheck() {
		var $bStart = $('#driveBook input[name=bStart]');
		var $bEnd = $('#driveBook input[name=bEnd]');
		var $dateCheck = $('#driveBook #dateCheck')
		if($bStart.val().match(dateTimeRegex) != null && $bEnd.val().match(dateTimeRegex) != null){
			$.ajax({
				type:'GET',
				url:'carBookRealTimeCheck.do',
				data:{carIdx:carIdx, bStart:$bStart.val(), bEnd:$bEnd.val()},
				dataType:'JSON',
				success:function(data){
					$('#dateCheck').css('display', 'inline-block');
					if(data.check === 0){
						$dateCheck.text('중복된 예약 날짜가 없습니다.')
						$dateCheck.css('color', 'green')
					}else{
						$dateCheck.text('중복된 예약 날짜가 '+data.check+'개 있습니다.')
						$dateCheck.css('color', 'red')
					}
				},
				error:function(e){
					console.log(data)
				}
			});
		}
	}
	
	/** 
	 * 모달을 닫아주는 함수
	 * num 설명
	 * 1 : 차량 정보 등록 모달
	 * 2 : 차량 정보 수정 모달
	 * 3 : 차량 운행 기록 수정 모달
	 * 4 : 차량 예약 취소 모달
	 */
	function closeModal(num){
		 switch (num) {
		case 1: // 차량 정보 등록 모달
			$('#carResist').modal('hide');
			$('#carResistForm')[0].reset();
			break;
		case 2: // 차량 정보 수정 모달
			$('#carModify').modal('hide');
			$('#carModfyForm')[0].reset();
			break;
		case 3: // 차량 운행 기록 수정 모달
			$('#carHisotryModifyModal').modal('hide');
			$('#carHistoryModfyForm')[0].reset();
			break;
		case 4: // 차량 예약 취소 모달
			$('#carBookCancel').modal('hide');
			$('#cancleForm')[0].reset();
			break;
		default:
			alert('모달을 닫는 중 알 수 없는 오류가 발생했습니다. \n다시 시도해 주세요');
		}
	}
	
	function driveHistoryDo(historyBtn, id) {
		btnId = id;
		$('#carBook').removeClass("btn btn btn-primary")
		$('#carBook').addClass("btn btn btn-secondary")
		historyBtn.removeClass("btn btn btn-secondary")
		historyBtn.addClass("btn btn btn-primary")
		if(carIdx != null && btnId == 'carHis'){
			flag2=true;
			pageflag2=true;
			showPage=1;
			chkPage2=new Array();
			getHistoryList(showPage);
		}
	}
	
	function driveBookDo(bookBtn, id) {
		btnId = id;
		$('#carHis').removeClass("btn btn btn-primary")
		$('#carHis').addClass("btn btn btn-secondary")
		bookBtn.removeClass("btn btn btn-secondary")
		bookBtn.addClass("btn btn btn-primary")
		if(carIdx != null && btnId == 'carBook'){
			flag=true;
			pageflag=true;
			page2=1;
			chkPage=new Array();
			getCarBookList(showPage);
		}
	}
	
	function showStory(rowClick){
		carIdx = rowClick.find('td.carIdx').text();
		carNum = rowClick.find('td.carNum').text();
		if(btnId === 'carHis'){
			 $('.pagination1').twbsPagination('destroy');
			getHistoryList(showPage);
		}else{
			 $('.pagination2').twbsPagination('destroy');
			getCarBookList(showPage);
		}
		
	}
	
	var flag2=true;
	var pageflag2=true;
	var chkPage2=new Array();
	function getHistoryList(page){
		$('#pagination1').css('display', 'inline-flex')
		$('#pagination2').css('display', 'none')
		$('#plzCarChoice').css('display', 'none');
		$('#driveBook').css('display', 'none');
		$('#driveBookList').css('display', 'none');
		$('#driveHistory').css('display', 'inline-block');
		$('#driveHistoryList').css('display', 'inline-block');
		$('#driveHistory .plsCarNum').text(carNum+'\u00A0');
		$('#driveHistoryList .plsCarNum').text(carNum+'\u00A0');
		if(flag2){
	        var select=$("#selectPart").val();
	        flag2=false;
			$.ajax({
				type:'GET',
				url:'getDriveHistory.do',
				data:{carIdx:carIdx, carNum:carNum, page:page},
				dataType:'JSON',
				success:function(data){
					drawHistoryList(data.list);
					chkPage2.push(data.total);
	    			if(chkPage2.at(-2) != data.total){
	    				pageflag2=true;
	    			}
					if(pageflag2 == true && $('.pagination2').data("twbs-pagination")){
	                    $('.pagination2').twbsPagination('destroy');
	                    pageflag2=false;
	                }
					$("#pagination1").twbsPagination({
						startPage : 1, // 시작 페이지
						totalPages : data.total, // 총 페이지 수
						visiblePages : 5, // 기본으로 보여줄 페이지 수
						onPageClick : function(e, page) { // 클릭했을때 실행 내용
							getHistoryList(page)
						}
					});
				},
				error:function(e){
					console.log(e)
				},complete:function(){
	    			flag2=true;
	    		}
			});
		}
	}
	function drawHistoryList(historyList){
		var content='';
		if(historyList.length != 0){
			for(var i=0; i<historyList.length;i++){
				content +='<tr>';
				var date=new Date(historyList[i].chis_date);
				content +='<td class="chis_idx" style="display: none;">'+historyList[i].chis_idx+'</td>';
				content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>';
				content +='<td>'+historyList[i].chis_driver+'</td>';
				content +='<td>'+historyList[i].chis_place+'</td>';
				content +='<td>'+historyList[i].chis_reason+'</td>';
				content +='<td>'+historyList[i].chis_km+'km</td>';
				content +='<td>'+historyList[i].chis_liter+'L</td>';
				content +='<td>'+historyList[i].chis_bigo+'</td>';
				content +='<td><a class="btn btn-sm btn-primary" id="carHisotryModifyBtn" onclick="carHistoryModifyInfo($(this))" data-bs-toggle="modal" data-bs-target="#carHisotryModifyModal">수정</a></td>';
				content +='</tr>';
			}
		}else{
			content +='<tr>';
			content +='<td colspan="8">등록된 운행 기록이 없습니다.</td>';
			content +='</tr>';
		}
		$('#historyList').empty();
		$('#historyList').append(content);
	}
	
	var flag=true;
	var pageflag=true;
	var page2=1;
	var chkPage=new Array();
	function getCarBookList(page2){
		$('#pagination1').css('display', 'none')
		$('#pagination2').css('display', 'inline-flex')
		$('#plzCarChoice').css('display', 'none');
		$('#driveHistory').css('display', 'none');
		$('#driveHistoryList').css('display', 'none');
		$('#driveBook').css('display', 'inline-block');
		$('#driveBookList').css('display', 'inline-block');
		$('#driveBook .plsCarNumBook').text(carNum+'\u00A0');
		$('#driveBookList .plsCarNumBook').text(carNum+'\u00A0');
		if(flag){
	        var select=$("#selectPart").val();
	        flag=false;
			$.ajax({
				type:'GET',
				url:'getCarBookList.do',
				data:{carIdx:carIdx, carNum:carNum, 'page':page2},
				dataType:'JSON',
				success:function(data){
					drawBookList(data.list);
					chkPage.push(data.total);
	    			if(chkPage.at(-2) != data.total){
	    				pageflag=true;
	    			}
	    			if(pageflag == true && $('.pagination1').data("twbs-pagination")){
	                    $('.pagination1').twbsPagination('destroy');
	                    pageflag=false;
	                }
	    			$("#pagination2").twbsPagination({
	    				startPage : 1 // 시작 페이지
	    				,totalPages : data.total // 총 페이지 수
	    				,visiblePages : 5 // 기본으로 보여줄 페이지 수
	    				,onPageClick : function(e, page) { // 클릭했을때 실행 내용
	    					getCarBookList(page);
	    				}
	    			});
				},
				error:function(e){
					console.log(e)
				},complete:function(){
	    			flag=true;
	    		}
			});
		}
	}
	
	function drawBookList(bookList){
		var content='';
		if(bookList.length != 0){
			for(var i=0; i<bookList.length;i++){
				var startDate=new Date(bookList[i].b_start);
				var endDate=new Date(bookList[i].b_end);
				content +='<tr style="height: 57px;" onclick="carBookDetail($(this))" data-bs-toggle="modal" data-bs-target="#carBookDetail">';
				content +='<td class="cb_idx">'+bookList[i].cb_idx+'</td>';
				content +='<td>'+startDate.toLocaleString('ko-KR')+'</td>';
				content +='<td>'+endDate.toLocaleString('ko-KR')+'</td>';
				content +='<td>'+bookList[i].mem_name+'</td>';
				if(bookList[i].b_cancel == 1){
					content +='<td>취소 안 함</td>';
				}else{
					content +='<td style="color: red;">취소</td>';
				}
				
				content +='</tr>';
			}
		}else{
			content +='<tr>';
			content +='<td colspan="5">등록된 예약이 없습니다.</td>';
			content +='</tr>';
		}//end of if
		$('#bookList').empty();
		$('#bookList').append(content);
	}
	
	$('#cHisResist').click(function(){
		var $chisDate = $('#driveHistory input[name=chisDate]');
		var $chisPlace = $('#driveHistory input[name=chisPlace]');
		var $chisKm = $('#driveHistory input[name=chisKm]');
		var $chisReason = $('#driveHistory input[name=chisReason]');
		var $chisDriver = $('#driveHistory input[name=chisDriver]');
		var $chisLiter = $('#driveHistory input[name=chisLiter]');
		var $chisBigo = $('#driveHistory #chisBigo');
		
		if($chisDate.val().match(dateRegex) == null){
			alert('운행일을 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08')
			$chisDate.focus();
		}else if($chisPlace.val()==''){
			alert("운행지역을 입력해 주세요");
			$chisPlace.focus();
		}else if($chisKm.val()==''){
			alert("운행거리를 입력해 주세요");
			$chisKm.focus();
		}else if($chisKm.val().match(numRegex) == null){
			alert("운행거리는 숫자만 입력해 주세요");
			$chisKm.focus();
		}else if($chisReason.val()==''){
			alert("운행목적을 입력해 주세요");
			$chisReason.focus();
		}else if($chisDriver.val()==''){
			alert("운전자를 입력해 주세요");
			$chisDriver.focus();
		}else if($chisLiter.val() != '' && $chisLiter.val().match(numRegex) == null){
			alert("주유량은 숫자만 입력해 주세요");
			$chisLiter.focus();
		}else{
			var formData = new FormData();
			$('#historyWrite input').each(function(){
				var key = $(this).attr('name');
				var key2 = $chisBigo.attr('name');
				var key3 = 'carIdx';
				var key4 = 'carNum';
				formData.append(key, $(this).val())
				formData.append(key2, $chisBigo.val())
				formData.append(key3, carIdx)
				formData.append(key4, carNum)
			})
			$.ajax({
				type:'POST',
				url:'carHistoryResist.do',
				processData:false, // 객체를 문자열로 바꾸지 않음
				contentType:false, // 컨텐트 타입을 객체로 함
				data: formData,
				success:function(data){
					console.log(data)
					if(data.finish == 1){
						alert('등록 완료')
						$("#historyWrite")[0].reset();
						$('#chisDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
						getHistoryList(showPage);
					}else{
						alert('서버와 통신은 했으나 데이터 전송중 문제가 발생했습니다. \n다시 시도해 주세요. \n현상이 지속되면 새로고침 후 진행해 주세요')
					}
				},
				error:function(e){
					console.log(e)
				}
			});
		}
	})
	
	/* 차량 정보 수정 input 박스에 정보 불러오는 함수 */
	function carModifyInfo(carModifyBtn){
		carIdx = carModifyBtn.closest('tr').find('td.carIdx').text();
		carNum = carModifyBtn.closest('tr').find('td.carNum').text();
		$.ajax({
			type:'GET',
			url:'getCarInfo.do',
			data:{carIdx:carIdx, carNum:carNum},
			dataType:'JSON',
			success:function(data){
				$('#carModify #carModfyForm input[name=carIdx]').val(data.result.car_idx);
				$('#carModify #carModfyForm input[name=carName]').val(data.result.car_name);
				$('#carModify #carModfyForm input[name=carNum]').val(data.result.car_num);
				$('#carModify #carModfyForm input[name=carType]').val(data.result.car_type);
				$('#carModify #carModfyForm select[name=carState]').val(data.result.car_state).attr('selected', 'selected');
				$('#carModify #carModfyForm select[name=carPart]').val(data.result.car_part).attr('selected', 'selected');
				$('#carModify #carModfyForm input[name=carYear]').val(data.result.car_year);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function carHistoryModifyInfo(carHistoryModifyBtn){
		chisIdx = carHistoryModifyBtn.closest('tr').find('td.chis_idx').text();
		$.ajax({
			type:'GET',
			url:'getDriveHistoryModifyInfo.do',
			data:{chisIdx:chisIdx, carNum:carNum},
			dataType:'JSON',
			success:function(data){
				$('#carHisotryModifyModal #carHistoryModfyForm input[name=chisIdx]').val(data.result.chis_idx);
				$('#carHisotryModifyModal #carHistoryModfyForm input[name=chisDate]').val(data.result.chis_date);
				$('#carHisotryModifyModal #carHistoryModfyForm input[name=chisPlace]').val(data.result.chis_place);
				$('#carHisotryModifyModal #carHistoryModfyForm input[name=chisKm]').val(data.result.chis_km);
				$('#carHisotryModifyModal #carHistoryModfyForm input[name=chisReason]').val(data.result.chis_reason);
				$('#carHisotryModifyModal #carHistoryModfyForm input[name=chisDriver]').val(data.result.chis_driver);
				$('#carHisotryModifyModal #carHistoryModfyForm input[name=chisLiter]').val(data.result.chis_liter);
				
				if(data.result.chis_bigo === '없음'){
					$('#carHisotryModifyModal #carHistoryModfyForm textarea[name=chisBigo]').val('');
				}else{
					$('#carHisotryModifyModal #carHistoryModfyForm textarea[name=chisBigo]').val(data.result.chis_bigo);
				}
			},
			error:function(e){
				console.log(data)
			}
		});
	}
	
	/* 차량 예약 팝업 요청 */
	$('#selectMember').click(function(){
		var url = "thingMemberList.go";
        var name = "MemberList";
		var option = "width = 500, height = 500, top = 100, left = 500, location = no"
		window.open(url, name, option)
	})
	
	function choiceRow(idx, name, judge){
		$('#driveBook input[name=bMem]').val(name)
		$('#driveBook input[name=bMemId]').val(idx)
	}
	
	/* 차량 예약 */
	$('#carBookResistBtn').click(function(){
		$bStart = $('#driveBook input[name=bStart]');
		$bEnd = $('#driveBook input[name=bEnd]');
		$bMem = $('#driveBook input[name=bMem]');
		$bMemId = $('#driveBook input[name=bMemId]');
		
		if($bStart.val().match(dateTimeRegex) == null){
			alert('예약 시작 날짜를 형식에 맞게 입력해 주세요 \n형식 : yyyy-MM-dd hh:mm:ss\n예)2023-01-08 09:13:00')
		}else if($bEnd.val().match(dateTimeRegex) == null){
			alert('예약 끝날 날짜를 형식에 맞게 입력해 주세요 \n형식 : yyyy-MM-dd hh:mm:ss\n예)2023-01-08 09:13:00')
		}else if($bMemId.val() == ''){
			alert('사용자를 선택해 주세요');
		}else{
			var formData = new FormData();
			$('#bookWrite input').each(function(){
				var key = $(this).attr('name');
				var key2 = 'carIdx';
				var key3 = 'carNum';
				formData.append(key, $(this).val())
				formData.append(key2, carIdx)
				formData.append(key3, carNum)
			})
			
			$.ajax({
				type:'POST',
				url:'carBookResist.do',
				processData:false, // 객체를 문자열로 바꾸지 않음
				contentType:false, // 컨텐트 타입을 객체로 함
				data: formData,
				success:function(data){
					if(data.check > 0){
						alert('시간이 겹치는 예약이 '+data.check+'건 있습니다. \n예약 시간을 바꿔서 다시 시도해 주세요')
					}
					if(data.check == 0 && data.finish == 1){
						alert('예약이 등록되었습니다.')
						$("#bookWrite")[0].reset();
						getCarBookList(page2);
						$('#dateCheck').text('');
						$('#dateCheck').css('display', 'none');
					}
					if(data.finish > 1){
						alert('서버와 통신은 했으나 데이터 전송중 문제가 발생했습니다. \n다시 시도해 주세요. \n현상이 지속되면 새로고침 후 진행해 주세요')
					}
				},
				error:function(e){
					console.log(e)
				}
			});
		}
		
	});
	
	/* 예약 상세보기 */
	function carBookDetail(bookListRow){
		var cbIdx = bookListRow.find('td.cb_idx').text();
		$.ajax({
			type:'GET',
			url:'getCarBookDetail.do',
			data:{cbIdx:cbIdx, carNum:carNum},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				var startDate = new Date(data.detail.b_start)
				var endDate = new Date(data.detail.b_end)
				$("#carBookDetail #cbIdx").val(data.detail.cb_idx);
				$("#carBookDetail .b_start").text(startDate.toLocaleString('ko-KR'));
				$("#carBookDetail .b_writer").text(data.detail.b_write);
				$("#carBookDetail .b_end").text(endDate.toLocaleString('ko-KR'));
				$("#carBookDetail .bMem").text(data.detail.mem_name);
				if(data.detail.b_cancel == 1){
					$("#carBookDetail #hideComent").css('display', 'none');
					$("#carBookDetail .b_cancel").text('취소 안 함').css('color', 'blue');
					$('#bookCancel').css('display', 'inline-block')
				}else{
					$("#carBookDetail .b_cancel").text('취소').css('color', 'red');
					$("#carBookDetail #hideComent").css('display', 'block');
					$("#carBookDetail .b_coment").text(data.detail.b_content);
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