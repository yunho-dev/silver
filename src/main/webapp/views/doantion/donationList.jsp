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
				<h3>후원금 리스트</h3>
			</div>
		    <!-- Hoverable rows start -->
		    <section class="sectionThingList">
		        <div class="row" id="table-hover-row">
		            <div class="col-12">
		                <div class="card" style="margin-bottom: 1%">
		                    <div class="card-header" id="filterHead" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
		                        후원자 : <input type="text" name="th_name" class="filter"> &nbsp;&nbsp;
		                        
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
		                                   <th>날짜</th>
		                                   <th>후원자</th>
		                                   <th>등록자</th>
		                                   <th>금액</th>
		                               </tr>
		                           </thead>
		                           <tbody id="donationlist">
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
		    
		    <%-- <!-- 모달 -->
			<jsp:include page="detailThing.jsp"></jsp:include>
			<jsp:include page="writeThing.jsp"></jsp:include> --%>
			
	    </div>
	</div>
    
     <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	 <script src="assets/js/bootstrap.bundle.min.js"></script>
	 <script src="assets/js/pages/dashboard.js"></script>
	 <script src="assets/js/main.js"></script>
</body>
<script>

</script>
    