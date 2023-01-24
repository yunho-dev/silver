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

<style>
#residentList {
	border-collapse: collapse;
	width: 100%;
	height: 700px;
}

#residentList thead {
	float: left;
	width: 500px;
}

#residentList tbody {
	overflow-y: auto;
	overflow-x: hidden;
	float: left;
	width: 500px;
	height: 600px;
	white-space: nowrap;
}

#residentList {
	text-align: center;
}

#residentList th {
	width: 60px;
	height: 40px;
	padding: 5px;
}
#residentDetail tr,th,td {
	width: 200px;
	height: 10px;
	padding: 5px;
	border-bottom: 1px solid #F6F6F6;
}

#residentList td {
	width: 60px;
	height: 50px;
	padding: 5px;
}

#nametd {
	width: 110px;
	height: 40px;
	color: blue;
	cursor: pointer;
}

#nameth {
	width: 110px;
	height: 40px;
}
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
         <!-- 여기 안에서 개발  -->
         
         
         <div>
         <form action="residentsearch.do" method="post">
				<select name="re_state">					
					<option value="입소중">입소중</option>
					<option value="외출">외출</option>
					<option value="외박">외박</option>
					<option value="입원중">입원중</option>
					<option value="퇴소">퇴소</option>
				</select>
		
		
			<input type="text" name="re_name">
         <button class="btn btn-primary">검색</button>
       </form>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 <a href="residentwriteForm.go" class="btn btn-primary">신규등록</a>	
          </div>
         
                         <!-- Basic Tables start -->
                         
                         
                <section class="section">
                  <div class="row" id="basic-table">
					<div class="col-12 col-md-6"  style="width:550px;">
						<div class="card">
							<div class="card-content">
								<div class="card-body">
									<!-- Table with outer spacing -->
									<div class="table-responsive">
										<table class="table table-lg"id="residentList">
											<thead class="thead-dark">
												<tr>
                                                    <th>번호</th>
													<th id="nameth" style="width:110px;">입소자</th>
													<th>성별</th>
													<th>나이</th>
													<th>등급</th>
													<th>생활실</th>
													<th>현황</th>
                                                </tr>
                                            </thead>
                                            
                                            <tbody >                                            
                                            	<c:forEach items="${resident}" var="rd">
													<tr>
														<td class="reIdx">${rd.re_idx}</td>
														<td id="nametd"><a onclick="ResidentDetaillistCall($(this))">${rd.re_name}</a></td>
														<td>${rd.re_gender}</td>
														<td>${rd.re_age}</td>
														<td>${rd.re_grade}</td>
														<td>${rd.ro_name}</td>
														<td>${rd.re_state}</td>														
													</tr>
												</c:forEach>
                                            </tbody>
                                                
                                                                                             
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                      
               


					<div class="col-12 col-md-6">
						<div class="card">

							<div class="card-content">
								<div class="card-body">
									  

								<form action="residentdetail" method="get"> 
									<div class="table-responsive">
										<div id="list">	
										</div>
									</div>
								</form>	


								</div>
								</div>							
							</div>
						</div>
					</div>
				</div>
		</div>
		</section>







	</div>
	</div>
	
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
 
 
</body>
<script>






var reIdx = 0;

function ResidentDetaillistCall(click) {
	reIdx = click.closest('tr').find('td.reIdx').text()
console.log(reIdx);
	$.ajax({
		type : 'get',
		url : 'residentdetail.go',
		data : {
			re_idx : reIdx
		},
		dataType : 'json',
		success : function(data) {
			console.log("ResidentDetaillist ajax");
			console.log(data);
			ResidentDetaildrawList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}


function ResidentDetaildrawList(residentdetail) {
	var content = '';
	console.log(residentdetail);

		
		content += '<table id="residentDetail" style="border-bottom: 1px solid #444444;">';
		content += '<tr><th>사진</th><td><img width="110px" height="140px" src="/filephoto/' + residentdetail.rd.fp_newFileName + '"/></td></tr>';
		content += '<tr><th>입소번호</th><td>' + residentdetail.rd.re_idx+ '</td></tr>';
		
		content += '<tr><th style="height: 10px;">입소자</th><td  style="height: 10px;">' + residentdetail.rd.re_name + '</td></tr>';
		content += '<tr><th>주민번호</th><td>' + residentdetail.rd.re_jumin + '</td></tr>';
		content += '<tr><th>성별</th><td>' + residentdetail.rd.re_gender + '</td></tr>';
		content += '<tr><th>휴대폰</th><td>' + residentdetail.rd.re_pnum + '</td></tr>';
		content += '<tr><th>입소일</th><td>' + residentdetail.rd.re_date.substring(0,10) + '</td></tr>';
		content += '<tr><th>주소</th><td>' + residentdetail.rd.re_addr + '</td></tr>';
		content += '<tr><th>상세주소</th><td>' + residentdetail.rd.re_daddr + '</td></tr>';
		content += '<tr><th>생활실</th><td>' + residentdetail.rd.ro_name + '</td></tr>';
		content += '<tr><th>등급</th><td>' + residentdetail.rd.re_grade + '</td></tr>';
		content += '<tr><th>현황</th><td>' + residentdetail.rd.re_state + '</td></tr>';		
		content += '<tr><th>주요질환</th><td>' + residentdetail.rd.re_sick + '</td></tr>';		
		content += '<tr><th>비고</th><td>' + residentdetail.rd.re_text + '</td></tr>';
		
			console.log(residentdetail.rdfile.length);
			console.log(residentdetail.rdfile[0].fp_newFileName);
			console.log(residentdetail.rdfile);
			console.log(residentdetail);


content += '<tr>'
content+='<th>첨부파일</th>';		
	for (var i = 0; i < residentdetail.rdfile.length; i++) {
		content += '<td><a href="resifileDownload.do?path=' + residentdetail.rdfile[i].fp_newFileName +'">'+residentdetail.rdfile[i].fp_oriFileName+ '</td>';
	} 
	 content += '</tr>';



		
		content += '</table>';
		content += '<a href="./residentupdateForm.go?re_idx='+residentdetail.rd.re_idx+'" class="btn btn-primary">수정</a>'

	$("#list").empty();
	$("#list").append(content);

}














</script>
</html>