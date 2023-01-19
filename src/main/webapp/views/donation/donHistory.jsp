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
		
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>후원금 사용내역 조회</h3>
			</div>
				<button onclick="location.href='donHisWriteForm'" class="btn btn-primary" >글작성</button>
		    <!-- Hoverable rows start -->
		    <section class="sectionThingList">
		        <div class="row" id="table-hover-row">
		            <div class="col-12">
		                <div class="card" style="margin-bottom: 1%">
		                    <div class="card-header" id="filterHead" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
		                        카테고리 : <input type="text" name="th_name" class="filter"> &nbsp;&nbsp;
		                        
		                        후원날짜 : <input type="text" name="th_write" class="filter"> &nbsp;&nbsp;
		                        ~&nbsp;&nbsp;&nbsp; <input type="text" name="th_dona" class="filter"> &nbsp;&nbsp;
<!-- 		                        <button class="btn btn-secondary" onclick="search($(this))">검색</button> -->
		                        <button class="btn btn-secondary" onclick="search(page2)">검색</button>
		                    </div>
		                   <!-- table hover -->
		                   <div class="table-responsive">
		                       <table class="table table-hover mb-0" style="text-align: center;">
		                           <thead>
		                               <tr>
		                                   <th>순번</th>
		                                   <th>사용날짜</th>
		                                   <th>등록자</th>
		                                   <th>금액</th>
		                               </tr>
		                           </thead>
		                           <tbody id="donHistoryList">
		                           	<!-- 리스트가 들어가는 공간 -->
		                           </tbody>
		                       </table>
		                   </div>
							<ul class="pagination" id="pagination" style="margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px;"></ul>
					</div>
		                   
		                </div>
		            </div>
						
		    </section>
		    <footer>
	<div class="footer clearfix mb-0 text-muted">
		<div class="float-start">
			<p>2023 Final Project</p>
		</div>
	<div class="float-end">
		<p>
			Create With <span class="text-danger"><i
				class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">Gudi</a>
		</p>
	</div>
	</div>
</footer>
	    </div>
	</div>
    
     <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	 <script src="assets/js/bootstrap.bundle.min.js"></script>
	 <script src="assets/js/pages/dashboard.js"></script>
	 <script src="assets/js/main.js"></script>
</body>
<script>

var url=window.location.search.split('?do_idx=')[1];
console.log("idx 값 : "+url);

var showPage = 1;
donHistoryCall(showPage);


function donHistoryCall(page){
	
	$.ajax({
		type:'get',
		url:'donHistoryCall',
		data:{page:page},
		dataType:'json',
		success:function(data){
			//console.log(data);
			drawList(data.list);
			
			$('#pagination').twbsPagination({
				startPage:1,
				totalPages:data.total,
				visiblePages:5,
				onPageClick:function(e, page){
					//console.log(e);
					//console.log(page);
				donHistoryCall(page);	
				}
				
			});
		},
		error:function(e){
			console.log(e);
		}
	});
	
}
function drawList(list){
	var content = '';
	
	for (var i = 0; i < list.length; i++) {
		content +='<tr onclick=location.href="donHisUpdateForm?dh_idx='+list[i].dh_idx+'">';
		content +='<td>'+list[i].dh_idx+'</td>';
		content +='<td>'+list[i].dh_date+'</td>';
		content +='<td>'+list[i].dh_write+'</td>';
		content +='<td>'+list[i].dh_money+'</td>';
		content +='</tr>';
	}
	
	$('#donHistoryList').empty();
	$('#donHistoryList').append(content);
}
</script>
    