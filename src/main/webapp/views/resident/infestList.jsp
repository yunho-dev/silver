<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="assets/js/jquery.twbsPagination.js"></script>
<style></style>
</head>
<body>
 <div id="app">
      <jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
  
  <table class="table">
  <thead>
    <tr>
      <th scope="col">이름</th>
      <th scope="col">현재감염상태</th>
      <th scope="col">생년월일</th>
      <th scope="col">생활실</th>
    </tr>
  </thead>
  <tbody id="infestList">
  
  </tbody>
  	<tr>
		<td colspan="5" id="paging">
			<div>
				<nav aria-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
		</td>
		</tr>
</table>
<button type="button" class="btn btn-primary">검색</button>
</div>
</div>
<script>
var showPage = 1;
infestList(showPage);

function infestList(page){
	
	$.ajax({
		type:'get',
		url:'infestListCall',
		data:{page:page},
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data.list);
			
			$('#pagination').twbsPagination({
				startPage:1,
				totalPages:data.total,
				visiblePages: 5,
				onPageClick:function(e, page){
					console.log(e);
					console.log(page);
					
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
		content +='<tr>';
		content +='<td>'
		content +="<a href='reviewDetail?board_idx="+list[i].board_idx+"'>"+list[i].re_name+"</a>";
		content +='</td>';
		content +='<td>'+list[i].if_state+'</td>';
		content +='<td>'+list[i].re_jumin+'</td>';
		content +='<td>'+list[i].ro_name+'</td>';
	
		content +='</tr>';
	}
	
	$('#infestList').empty();
	$('#infestList').append(content);
}
</script>
</html>