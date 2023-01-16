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
    #WriteName {
    	font-weight: bolder;
    	font-size: large;
    }
    #plzCarChoice {
    	text-align: center;
    	margin-top: 17px;
    }
</style>
<body>
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
			<!-- Basic Tables start -->
                <section class="section">
                    <div class="row" id="basic-table">
                        <div class="col-12 col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title" style="float:left;">차량 등록 현황</h3>
                                    <a class="btn btn btn-primary" id="carResist" style="float:right;">차량 정보 등록</a>
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
                                                <tbody>
                                                	<c:forEach items="${list}" var="car">
														<tr onclick="showStory($(this))" style="cursor: pointer;">
															<td class="carIdx" style="display:none;">${car.car_idx}</td>
															<td>${car.car_state}</td>
															<td>${car.car_name}</td>
															<td class="carNum">${car.car_num}</td>
															<td>${car.car_type}</td>
															<td>${car.car_year}</td>
															<td>${car.car_part}</td>
															<td><a href="#" class="btn btn-sm btn-primary">수정</a></td>
														</tr>
													</c:forEach>
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
                                		<form id="writeForm">
                                			<div>
	                                			<h5 style="margin-bottom: 15px;">운행 등록</h5>
	                                			<div class="left">
	                                				<p class="writeArea"><span id="WriteName">운행일 : </span> 
														<input type="text" name="thName">
													</p><br>
													<p class="writeArea"><span id="WriteName">운행지역 : </span> 
														<input type="text" name="thName">
													</p><br>
													<p class="writeArea"><span id="WriteName">운행거리 : </span> 
														<input type="text" name="thName"><span id="WriteName">&nbsp;km</span>
													</p><br>
													<p class="writeArea"><span id="WriteName">운행목적 : </span> 
														<input type="text" name="thName">
													</p><br>
	                                			</div>
	                                			<div class="right">
	                                				<p class="writeArea"><span id="WriteName">운전자 : </span> 
														<input type="text" name="thName">
													</p><br>
	                                				<p class="writeArea"><span id="WriteName">주유량 : </span> 
														<input type="text" name="thName"><span id="WriteName">&nbsp;L</span>
													</p><br>
	                                				<p class="writeArea"><span id="WriteName">비고 : </span> 
														<textarea id="b_content"
															rows="3" style="resize: none;"></textarea>
													</p><br>
	                                			</div>
                                			</div>
                                			<div style="display:block;">
                                				<a href="#" class="btn btn-primary" style="text-align: center; float: right;">저장</a>
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
                                                    <th>순번</th>
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
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- 차량 운행 기록 끝 -->
                                    
                                    <!-- 차량 사용 예약 -->
                                    <div class="modal-body" id="driveBook" style="border: 1px solid; display: none;">
                                		<form id="writeForm">
                                			<div>
	                                			<h5 style="margin-bottom: 15px;">차량 사용 예약</h5>
	                                			<div class="left">
	                                				<p class="writeArea"><span id="WriteName">이용 시작 시간 : </span> 
														<input type="text" name="thName">
													</p><br>
	                                				<p class="writeArea"><span id="WriteName">사용자 : </span> 
														<input type="text" name="thName">
													</p>
	                                			</div>
	                                			<div class="right">
	                                				<p class="writeArea"><span id="WriteName">이용 끝날 시간 : </span> 
														<input type="text" name="thName">
													</p>
	                                			</div>
                                			</div>
                                			<div style="display:block;">
                                				<a href="#" class="btn btn-primary" style="text-align: center; float: right;">저장</a>
                                			</div>
                                		</form>
                                	</div>
                                    <!-- Table with no outer spacing -->
                                    <div class="table-responsive" id="driveBookList" style="display: none;">
                                    	<div class="card-header" >
		                                    <h4 class="card-title"><span class="plsCarNumBook"></span>사용 예약 기록</h4>
		                                </div>
                                        <table class="table mb-0 table-lg" style="white-space:nowrap;">
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
                                            </tbody>
                                        </table>
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
	var carNum;
	var carIdx;
	var btnId = 'carHis';
	
	function driveHistoryDo(historyBtn, id) {
		btnId = id;
		$('#carBook').removeClass("btn btn btn-primary")
		$('#carBook').addClass("btn btn btn-secondary")
		historyBtn.removeClass("btn btn btn-secondary")
		historyBtn.addClass("btn btn btn-primary")
		if(carIdx != null && btnId == 'carHis'){
			getHistoryList();
		}
	}
	
	function driveBookDo(bookBtn, id) {
		btnId = id;
		$('#carHis').removeClass("btn btn btn-primary")
		$('#carHis').addClass("btn btn btn-secondary")
		bookBtn.removeClass("btn btn btn-secondary")
		bookBtn.addClass("btn btn btn-primary")
		if(carIdx != null && btnId == 'carBook'){
			getCarBookList();
		}
	}
	
	function showStory(elem){
		carIdx = elem.find('td.carIdx').text();
		carNum = elem.find('td.carNum').text();
		if(btnId === 'carHis'){
			getHistoryList();
		}else{
			getCarBookList();
		}
		
	}
	
	function getHistoryList(){
		$('#plzCarChoice').css('display', 'none');
		$('#driveBook').css('display', 'none');
		$('#driveBookList').css('display', 'none');
		$('#driveHistory').css('display', 'inline-block');
		$('#driveHistoryList').css('display', 'inline-block');
		$('#driveHistoryList .plsCarNum').text(carNum+'\u00A0');
		$.ajax({
			type:'GET',
			url:'getDriveHistory.do',
			data:{carIdx:carIdx, carNum:carNum},
			dataType:'JSON',
			success:function(data){
				drawHistoryList(data.list);
			},
			error:function(e){
				console.log(e)
			}
		});
	}
	function drawHistoryList(historyList){
		var content='';
		for(var i=0; i<historyList.length;i++){
			var date=new Date(historyList[i].chis_date);
			content +='<tr>';
			content +='<td class="chis_idx">'+historyList[i].chis_idx+'</td>';
			content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>';
			content +='<td>'+historyList[i].chis_driver+'</td>';
			content +='<td>'+historyList[i].chis_place+'</td>';
			content +='<td>'+historyList[i].chis_reason+'</td>';
			content +='<td>'+historyList[i].chis_km+'</td>';
			content +='<td>'+historyList[i].chis_liter+'</td>';
			content +='<td>'+historyList[i].chis_bigo+'</td>';
			content +='<td><a href="#" class="btn btn-sm btn-primary">수정</a></td>';
			content +='</tr>';
		}
		$('#historyList').empty();
		$('#historyList').append(content);
	}
	
	function getCarBookList(){
		$('#plzCarChoice').css('display', 'none');
		$('#driveHistory').css('display', 'none');
		$('#driveHistoryList').css('display', 'none');
		$('#driveBook').css('display', 'inline-block');
		$('#driveBookList').css('display', 'inline-block');
		$('#driveBookList .plsCarNumBook').text(carNum+'\u00A0');
		$.ajax({
			type:'GET',
			url:'getCarBookList.do',
			data:{carIdx:carIdx, carNum:carNum},
			dataType:'JSON',
			success:function(data){
				drawBookList(data.list);
			},
			error:function(e){
				console.log(e)
			}
		});
	}
	
	function drawBookList(bookList){
		var content='';
		for(var i=0; i<bookList.length;i++){
			var startDate=new Date(bookList[i].b_start);
			var endDate=new Date(bookList[i].b_end);
			content +='<tr>';
			content +='<td class="chis_idx">'+bookList[i].cb_idx+'</td>';
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
		$('#bookList').empty();
		$('#bookList').append(content);
	}

</script>
</html>