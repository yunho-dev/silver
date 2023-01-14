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
		width: 10%;
	}
	.resident{
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
                        <h3 class="card-title">입소자 조회</h3>
                        <p>비품 사용 예약을 할 입소자를 클릭해 주세요</p>
                    </div>
			       <div class="card-header" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
			           입소자 번호 : <input type="text" name="num" class="filter"> &nbsp;&nbsp;
			           입소자 이름 : <input type="text" name="name" class="filter"> &nbsp;&nbsp;
			           <button class="btn btn-secondary" onclick="search($(this))">검색</button>
					</div>
                        <!-- table hover -->
                        <div class="table-responsive">
                            <table class="table table-hover mb-0" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th>입소자 번호</th>
                                        <th>입소자 이름</th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                	<!-- 리스트가 들어갈 공간 -->
                                </tbody>
                            </table>
                        </div>
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
			url:'thingResidentList.do',
			data:{page:page},
			dataType:'JSON',
			success:function(data){
				drawList(data.list)
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function drawList(resiList){
		var content='';
		for(var i=0; i<resiList.length;i++){
			content +='<tr class="resiList" onclick="resiRow($(this))" style="cursor: pointer;">';
			content +='<td class="re_idx">'+resiList[i].re_idx+'</td>';
			content +='<td class="re_name">'+resiList[i].re_name+'</td>';
			content +='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);
	}
</script>
</html>