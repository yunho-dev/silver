<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>은빛 우산</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
		width: 10%;
	}
	.thingList{
		cursor: pointer;
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
				<h3>비품 목록 조회</h3>
			</div>
		    <!-- Hoverable rows start -->
		    <section class="sectionThingList">
		        <div class="row" id="table-hover-row">
		            <div class="col-12">
		                <div class="card" style="margin-bottom: 1%">
		                    <div class="card-header" id="filterHead" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
		                        품명 : <input type="text" name="th_name" class="filter"> &nbsp;&nbsp;
		                        구분 : <select name="th_part" id="selectPart">
		                        			<option value="" selected="selected">전체</option>
		                        			<option value="후원">후원</option>
		                        			<option value="렌탈">렌탈</option>
		                        			<option value="직접 구매">직접 구매</option>
		                        		</select> &nbsp;&nbsp;
		                        상태 : <select name="th_state" id="selectState">
		                        			<option value="" selected="selected">전체</option>
		                        			<option value="사용">사용중</option>
		                        			<option value="비사용">비사용중</option>
		                        			<option value="고장">고장</option>
		                        		</select> &nbsp;&nbsp;
		                        등록자 : <input type="text" name="th_write" class="filter"> &nbsp;&nbsp;
		                        후원자 : <input type="text" name="th_dona" class="filter"> &nbsp;&nbsp;
		                        <button class="btn btn-secondary" onclick="search(page2)">검색</button>
		                    </div>
		                   <!-- table hover -->
		                   <div class="table-responsive">
		                       <table class="table table-hover mb-0" style="text-align: center;">
		                           <thead>
		                               <tr>
		                                   <th>순번</th>
		                                   <th>품명</th>
		                                   <th>구분</th>
		                                   <th>취득일자</th>
		                                   <th>상태</th>
		                               </tr>
		                           </thead>
		                           <tbody id="list">
		                           	<!-- 리스트가 들어가는 공간 -->
		                           </tbody>
		                       </table>
		                   </div>
							<ul class="pagination" id="pagination" style="margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px;"></ul>
					</div>
		                   <div class="buttons" style="text-align: right; margin-right: 5%;">
		                   	<a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#writeThing">등록하기</a>
		                   </div>
		                </div>
		            </div>
						
		    </section>
		    <!-- Hoverable rows end -->
		    
		    <!-- 모달 -->
			<jsp:include page="detailThing.jsp"></jsp:include>
			<jsp:include page="writeThing.jsp"></jsp:include>
			
	    </div>
	</div>
    
     <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	 <script src="assets/js/bootstrap.bundle.min.js"></script>
	 <script src="assets/js/pages/dashboard.js"></script>
	 <script src="assets/js/main.js"></script>
</body>
<script>
	var showPage=1;
	var cateId; //category id
	
	ListCall(showPage);
	
	$(function() {
		//input을 datepicker로 선언
		$("#getDate").datepicker({
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
		$('#getDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		
		$("#modiDate").datepicker({
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
	
	/* input 콤마 */
	function inputNumberFormat(obj) {
		obj.value = comma(uncomma(obj.value));
	}
	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	}
	
	/** 
	 * 모달을 닫아주는 함수
	 * num 설명
	 * 1 : 비품 등록 모달
	 * 2 : 비품 수정 모달
	 */
	function closeModal(num){
		 switch (num) {
		case 1: // 비품 등록 모달
			$('#writeThing').modal('hide');
			$('#writeForm')[0].reset();
			break;
		case 2: // 비품 수정 모달
			$('#modifyThing').modal('hide');
			$('#updateForm')[0].reset();
			break;
		default:
			alert('모달을 닫는 중 알 수 없는 오류가 발생했습니다. \n다시 시도해 주세요');
		}
	}
	
	/* 파일 체크 */
	function fileCheck(obj) {
		var pathpoint = obj.val().lastIndexOf('.');
		var filepoint = obj.val().substring(pathpoint+1, obj.val().length);
		var filetype = filepoint.toLowerCase();
		var maxSize = 1024 * 1024;
		var fileSize = obj[0].files[0].size;
	    if((filetype!='jpg' && filetype!='gif' && filetype!='png' && filetype!='jpeg' && filetype!='jfif') || fileSize > maxSize) {
	        alert('1MB 이하의 이미지 파일만 선택할 수 있습니다. \n지원하는 형식 : jpg, jpeg, png, gif');
	        obj.val(null);
	        return false;
	    }
	}
	
	/* 카테고리 팝업 오픈 */
	function clickCate(clickCateId){
		cateId = clickCateId;
		var url = "itemCateList.go";
        var name = "itemCateList";
		var option = "width = 600, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option)
	}
	
	/* 자식 팝업에서 카테고리 선택 */
	function choiceCate(itIdx, itName){
		if(cateId == 'writeCate'){
			$('.writeRight input[name=thCateFake]').val(itName)
			$('.writeRight input[name=thCateReal]').val(itIdx)
		}else {
			$('.modifyRight input[name=thCateFake]').val(itName)
			$('.modifyRight input[name=thCateReal]').val(itIdx)
		}
	}
	
	function ListCall(page){
		$.ajax({
			type:'GET',
			url:'getThingList.do',
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
	
	function drawList(thingList){
		var content='';
		for(var i=0; i<thingList.length;i++){
			var date=new Date(thingList[i].th_date);
			content +='<tr class="thingList" data-bs-toggle="modal" data-bs-target="#detailThing" onclick="detail($(this))">';
			content +='<td class="th_idx">'+thingList[i].th_idx+'</td>';
			content +='<td>'+thingList[i].th_name+'</td>';
			content +='<td>'+thingList[i].th_part+'</td>';
			content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>';
			content +='<td>'+thingList[i].th_state+'</td>';
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
		var thWrite = $('#filterHead input[name=th_write').val();
		var thSpon = $('#filterHead input[name=th_dona').val();
		var thPart = $('#filterHead select[name=th_part]').val();
		var thState = $('#filterHead select[name=th_state]').val();
		select_change.push($("#selectPart").val());
		select_change2.push($("#selectState").val());
		if(flag){
	        var select=$("#selectPart").val();
	        flag=false;
			$.ajax({
				type:'GET',
				url:'getThingListSearch.do',
				data:{'page':page2, thName:thName, thWrite:thWrite, thSpon:thSpon, thPart:thPart, thState:thState},
				dataType:'JSON',
				success:function(data){
					drawList(data.list);
					chkPage.push(data.total);
	    			if(chkPage.at(-2) != data.total){
	    				pageflag=true;
	    			}
					if(pageflag == true && $('.pagination').data("twbs-pagination")
	    					|| select_change.at(-2) != $("#selectPart").val()
	    					|| select_change2.at(-2) != $("#selectState").val()){
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
		var thIdx = $(listRow).find('td.th_idx').text();
		$(listRow).attr('data-id', thIdx)
		var data = $(listRow).data('id');
	    $(".modal-body #thIdx").html(data);
	    
	    $.ajax({
	    	type:'GET',
			url:'getThingDetail.do',
			data:{thIdx:thIdx},
			dataType:'JSON',
			success:function(data){
				$("#detailThing .th_name").text(data.detail.th_name);
				$("#detailThing .th_model").text(data.detail.th_model);
				$("#detailThing .th_money").text(data.detail.th_money.toLocaleString('ko-KR'));
				$("#detailThing .th_write").text(data.detail.th_write);
				$("#detailThing .th_part").text(data.detail.th_part);
				$("#detailThing .th_date").text(data.detail.th_date);
				$("#detailThing .th_state").text(data.detail.th_state);
				//후원자 체크
				if((data.detail.th_part!=null || data.detail.th_part!='') && data.detail.th_spon != '직접구매'){
					$("#detailThing .th_spon").text(data.detail.th_spon);
					$("#detailThing .hiddenSpon").css('display', 'block');
				}else{
					$("#detailThing .hiddenSpon").css('display', 'none');
				}
				var newFileName = data.detailPhoto;
				//사진 체크
				if(newFileName != null || newFileName == ''){
					$('#detailThing #nonPhoto').css('display', 'none');
					$('#detailThing .th_photo').css('display', 'block');
					$("#detailThing .th_photo").attr('src', '/filephoto/'+data.detailPhoto.fp_newFileName)
				}else{
					$('#detailThing #nonPhoto').css('display', 'block');
					$('#detailThing .th_photo').css('display', 'none');
				}
			},
			error:function(e){
				console.log(e);
			}
	    });
	    
	}

</script>
    