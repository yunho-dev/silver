<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">



</head>
 <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
<body>


<div id="app">
      <jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
         <!-- 여기 안에서 개발  -->
         
         
         
         <form action="residentsearch.do" method="post">
		<div class="option_re_state">
				<select name="re_state">					
					<option value="입소중">입소중</option>
					<option value="외출">외출</option>
					<option value="외박">외박</option>
					<option value="입원중">입원중</option>
					<option value="퇴소">퇴소</option>
				</select>
		</div>
		
		
		<%-- 
		<div>
				<select id="ro_name" name="ro_name">
					<option disabled selected>생활실</option>
					<option value="0">퇴소</option>
				</select>
		</div>		  
		--%>
		
		<div class="option_re_name">
			<input type="text" name="re_name">
		</div>
         <button class="btn btn-primary">검색</button>
       </form>
         
         
         
         
         <!-- Table head options start -->
                <section class="section">
                    <div class="row" id="table-head">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Table head options</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <p>Similar to tables and dark tables, use the modifier classes <code
                                                class="highlighter-rouge">.thead-light</code> or <code
                                                class="highlighter-rouge">.thead-dark</code> to
                                            make <code class="highlighter-rouge">&lt;thead&gt;</code>s appear light or
                                            dark gray.
                                        </p>
                                    </div>
                                    <!-- table head dark -->
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>번호</th>
													<th>입소자</th>
													<th>성별</th>
													<th>나이</th>
													<th>등급</th>
													<th>생활실</th>
													<th>현황</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            
                                            
                                            
                                            	<c:forEach items="${resident}" var="rd">
													<tr>
														<td>${rd.re_idx}</td>
														<td><a href="residentdetail.go?re_idx=${rd.re_idx}">${rd.re_name}</a></th>
														<td>${rd.re_gender}</td>
														<td>${rd.re_jumin}</td>
														<td>${rd.re_grade}</td>
														<td>${rd.ro_name}</td>
														<td>${rd.re_state}</td>														
													</tr>
												</c:forEach>
                                            
                                            	</table>
													<a href="residentwriteForm.go" class="btn btn-primary">신규등록</a>		
												</form>
											     </span>
                                            
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Table head options end -->
         
         
         
         
         
         
         
         
         
         
         

         
         
         
         
         
         
         
         
       </div>
</div>
</body>
<script>


</script>
</html>