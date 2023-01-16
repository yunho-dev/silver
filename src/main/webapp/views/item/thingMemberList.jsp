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
		width: 90px;
	}
	.member{
		cursor: pointer;
	}
</style>
<body>
	<!-- Hoverable rows start -->
    <section class="section">
        <div class="row" id="table-hover-row">
            <div class="col-12">
                <div class="card">
                	<div class="card-header" style="padding-bottom: 0px; padding-top: 20px;">
                        <h3 class="card-title">직원 조회</h3>
                        <p>비품 사용 예약을 할 직원을 클릭해 주세요</p>
                    </div>
			       <div class="card-header" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
			           사번 : <input type="text" name="num" class="filter"> &nbsp;&nbsp;
			           직원 이름 : <input type="text" name="name" class="filter"> &nbsp;&nbsp;
			           <button class="btn btn-secondary" onclick="search(page2)">검색</button>
					</div>
                        <!-- table hover -->
                        <div class="table-responsive">
                            <table class="table table-hover mb-0" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th>사번</th>
                                        <th>직원 이름</th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                	<!-- 리스트가 들어갈 공간 -->
                                </tbody>
                            </table>
                        </div>
                        <ul class="pagination" id="pagination" style="margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px;"></ul>
                    </div>
                </div>
            </div>
    </section>
    <!-- Hoverable rows end -->
</body>
<script>
	var showPage=1;
	ListCall(showPage);
	
	function ListCall(page){
		$.ajax({
			type:'GET',
			url:'thingMemberList.do',
			data:{page:page},
			dataType:'JSON',
			success:function(data){
				drawList(data.list)
				$("#pagination").twbsPagination({
					startPage : 1, // 시작 페이지
					totalPages : data.total, // 총 페이지 수
					visiblePages : 3, // 기본으로 보여줄 페이지 수
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
	
	function drawList(memList){
		var content='';
		for(var i=0; i<memList.length;i++){
			content +='<tr class="memList" onclick="memRow($(this))" style="cursor: pointer;">';
			content +='<td class="memId">'+memList[i].mem_id+'</td>';
			content +='<td class="memName">'+memList[i].mem_name+'</td>';
			content +='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);
	}
	
	function memRow(memRow){
		var memId = memRow.find('.memId').text();
		var memName = memRow.find('.memName').text();
		opener.choiceRow(memId, memName, 0);
		window.close()
	}
	
	var flag=true;
	var pageflag=true;
	var page2=1;
	var chkPage=new Array();
	function search(page2){
		var id = $('.section input[name=num]').val();
		var name = $('.section input[name=name]').val();
		if(flag){
			flag=false;
			$.ajax({
				type:'GET',
				url:'getThMemberSearch.do',
				data:{'page':page2, id:id, name:name},
				dataType:'JSON',
				success:function(data){
					drawList(data.list);
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
					console.log(e)
				},complete:function(){
	    			flag=true;
	    		}
			});
		}
	}
</script>
</html>