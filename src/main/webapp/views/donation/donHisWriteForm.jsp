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
<style>

</style>
</head>
<body>
 <div id="app">
      <jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
   <div class="page-heading">
       <h3>후원금 히스토리 작성</h3>
   </div>
  <section class="row">
  	<div class="card">
  		<div class="card-body py-4 px-5">
  <form action="donWrite" method="post">
  <button  class="btn btn-primary">등록</button>     
  <table class="table">
  <thead>
    <tr>  
      <th scope="col" style="width:20%;">금액</th>
      <td>
      	<input type="text" name="dh_money" style="width: 100%;"/>	
      </td>
    </tr> 
    <tr>  
      <th scope="col" style="width:20%;">카테고리</th>
      <td>
      	<select name="dh_cate" onchange="changePart($(this))" style="width:200px;height:30px;font-size:12px;">
			<option value="" selected="selected" style="display: none;">선택</option>
			<option value="물품구매">물품구매</option>
			<option value="회식">회식</option>
			<option value="시설유지보수">시설유지보수</option>
			<option value="인건비">인건비</option>
			<option value="기타">기타</option>
		</select> 	
      </td>
    <tr>  
      <th scope="col" style="width:20%;">사용목적</th>
      <td>
      	<input type="text" name="dh_goal" style="width: 100%;"/>	
      </td>
    </tr> 
    <tr>  
      <th scope="col" style="width:20%;">사용날짜</th>
      <td>
      	<input type="text" name="dh_date" style="width: 100%;"/>	
      </td>
    </tr> 
    <tr>  
      <th scope="col" style="width:20%;">등록자</th>
      <td>
      	<input type="text" name="dh_write" style="width: 100%;"/>	
      </td>
    </tr>
    <tr>  
      <th scope="col" style="width:20%;">첨부파일</th>
      <td>
      	<input name="dh_Photo" class="form-control" type="file" id="formFile" accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)">	
      </td>
    </tr>
  </thead>
</table>
<input type="hidden" name="dh_idx" value="${dh_idx}">
</form>
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

<script>
function fileCheck(obj) {
	console.log(obj.value)
    pathpoint = obj.value.lastIndexOf('.');
    filepoint = obj.value.substring(pathpoint+1,obj.length);
    filetype = filepoint.toLowerCase();
    if(filetype!='jpg' && filetype!='gif' && filetype!='png' && filetype!='jpeg') {
        alert('1MB 이하의 이미지 파일만 선택할 수 있습니다. \n지원하는 형식 : jpg, jpeg, png, gif');
        obj.value = null;
        return false;
    }
}
</script>
</html>