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
   <div class="page-heading">
       <h3>후원금 사용내역 작성</h3>
   </div>
  <section class="row">
  	<div class="card">
  		<div class="card-body py-4 px-5">
  <form action="donWrite" method="post" enctype="multipart/form-data">
  <button  class="btn btn-primary" style="margin:4px; margin-bottom:20px; float: left; width: 70px;">등록</button>
  <button type="button" class="btn btn-secondary" style="margin:4px; margin-bottom:20px; float: left; width: 100px;"
							onclick="location.href='donHistory?page=donation'">뒤로가기</button>
	<div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">금액</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="dh_money"  id="dh_money" autofocus>
                         
    </div>     
	<div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">카테고리</span>
       <select name="dh_cate" onchange="changePart($(this))" style="width:200px;height:30px;font-size:12px;">
			<option value="" selected="selected" style="display: none;">선택</option>
			<option value="물품구매">물품구매</option>
			<option value="회식">회식</option>
			<option value="시설유지보수">시설유지보수</option>
			<option value="인건비">인건비</option>
			<option value="기타">기타</option>
		</select>                 
  </div>     
	<div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">사용목적</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="dh_goal"  id="dh_goal" autofocus>
                         
  </div>     
	<div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">사용날짜</span>
       <input type="date"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="dh_date"  id="dh_date" autofocus>
                         
  </div>     
	<div class="input-group mb-3">                                              
       <span class="input-group-text" id="basic-addon1">등록자</span>
       <input type="text"  class="form-control" aria-label="Username" 
		aria-describedby="basic-addon1" name="dh_write"  id="dh_write" autofocus>
                         
  </div>     
	<div class="input-group mb-3">                                              
       
       <input name="dh_Photo" class="form-control" type="file" id="formFile" accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)" multiple="multiple">                 
  </div>     
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
<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	 <script src="assets/js/bootstrap.bundle.min.js"></script>
	 <script src="assets/js/pages/dashboard.js"></script>
	 <script src="assets/js/main.js"></script>
</body>
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