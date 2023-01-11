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
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
		
<!-- 			<div class="col-12 col-md-6 order-md-1 order-last" style="background-color: #e9ecef"> -->
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
		                        구분 : <select name="th_part">
		                        			<option value="" selected="selected">전체</option>
		                        			<option value="후원">후원</option>
		                        			<option value="렌탈">렌탈</option>
		                        			<option value="직접 구매">직접 구매</option>
		                        		</select> &nbsp;&nbsp;
		                        상태 : <select name="th_state">
		                        			<option value="" selected="selected">전체</option>
		                        			<option value="사용">사용</option>
		                        			<option value="비사용">비사용</option>
		                        		</select> &nbsp;&nbsp;
		                        등록자 : <input type="text" name="th_write" class="filter"> &nbsp;&nbsp;
		                        후원자 : <input type="text" name="th_dona" class="filter"> &nbsp;&nbsp;
<!-- 		                        <button class="btn btn-secondary" onclick="search($(this))">검색</button> -->
		                        <button class="btn btn-secondary" onclick="search(page2)">검색</button>
		                    </div>
		                        <!-- table hover -->
		                        <div class="table-responsive">
		                            <table class="table table-hover mb-0">
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
		                        <div id="pagint">
			                        <div class="container" style="margin-left: auto; margin-right: auto;">
										<nav aria-label="Page navigation" style="text-align: center;">
											<ul class="pagination" id="pagination"></ul>
										</nav>
									</div>
		                        </div>
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
	var cateId;
	
	ListCall(showPage);
	
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
	
	function search(page2){
		console.log("페이지 : ", page2)
		thName = $('#filterHead input[name=th_name]').val();
		thWrite = $('#filterHead input[name=th_write').val();
		thSpon = $('#filterHead input[name=th_dona').val();
		thPart = $('#filterHead select[name=th_part]').val();
		thState = $('#filterHead select[name=th_state]').val();
		select_change.push($("select").val());
		if(flag){
	        var select=$("#select").val();
	        flag=false;
	        
		$.ajax({
			type:'GET',
			url:'getThingListSearch.do',
			data:{'page':page2, thName:thName, thWrite:thWrite, thSpon:thSpon, thPart:thPart, thState:thState},
			dataType:'JSON',
			success:function(data){
				drawList(data.list);
				if(pageflag == true && $('.pagination').data("twbs-pagination")
    					|| select_change.at(-2) != $("select").val()){
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
				$(".modal-body .left .th_name").text(data.detail.th_name);
				$(".modal-body .left .th_model").text(data.detail.th_model);
				$(".modal-body .left .th_money").text(data.detail.th_money);
				$(".modal-body .left .th_write").text(data.detail.th_write);
				$(".modal-body .right .th_part").text(data.detail.th_part);
				$(".modal-body .right .th_date").text(data.detail.th_date);
				$(".modal-body .right .th_state").text(data.detail.th_state);
				//후원자 체크
				if((data.detail.th_part!=null || data.detail.th_part!='') && data.detail.th_spon != '직접구매'){
					$(".modal-body .right .th_spon").text(data.detail.th_spon);
					$(".modal-body .right .hiddenSpon").css('display', 'block');
				}else{
					$(".modal-body .right .hiddenSpon").css('display', 'none');
				}
				var newFileName = data.detailPhoto;
				//사진 체크
				if(newFileName != null || newFileName == ''){
					$('.modal-body #nonPhoto').css('display', 'none');
					$('.modal-body .th_photo').css('display', 'block');
					$(".modal-body .th_photo").attr('src', '/filephoto/'+data.detailPhoto.fp_newFileName)
				}else{
					$('.modal-body #nonPhoto').css('display', 'block');
					$('.modal-body .th_photo').css('display', 'none');
				}
			},
			error:function(e){
				console.log(e);
			}
	    });
	    
	}

</script>
    