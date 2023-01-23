<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>은빛 우산</title>


<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">

<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon">

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
				<h3>생활실 현황판</h3>

				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#roomInsert">생활실 등록</button>
				<!-- <a href="#" class="btn btn-primary">생활실 등록</a> -->
			</div>
			
<!-- 			<div> -->
				
<!-- 					<div> -->
<!-- 						<p>1층</p> -->
<%-- 						<c:forEach items="${roomList}" var="room"> --%>
<%-- 							<c:if test="${room.ro_floor eq '1' }"> --%>
<%-- 								<p>${room.ro_name}<span>${room.re_name}</span></p> --%>
<%-- 							</c:if> --%>
<%-- 						</c:forEach> --%>
<!-- 					</div> -->

<!-- 			</div> -->

			<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        Accordion Item #1
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Accordion Item #3
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div>
			
	

			<!-- Table head options start -->
			<section class="section">
				<div class="row" id="table-head">
					<div class="col-12">
						<div class="card">


							<!-- 생활실 등록시 추가 되어야 할 생활실 양식(?) -->
							 
							<div class="card-header">
								<h4 class="card-title">1층</h4>

								<div class="card-content row" id="appendroomtable">
									
<!-- 									div 에 id 주고 추가 눌렀을 경우 ajax로 -->
<!-- 									<div class="table-responsive col-md-3"> -->

<!-- 										<table class="table mb-0"> -->
<!-- 											<thead class="thead-dark"> -->
<!-- 												<tr> -->
<!-- 													<th id="roomName">101호<span -->
<!-- 														style="font-size: x-small;">담당자:홍길동</span></th> -->
<!-- 													ro_name은 호실이름 -->
<!-- 												</tr> -->
<!-- 											</thead> -->

<!-- 											<tbody> -->
<%-- 												<c:forEach items="${roomList}" var="resident"> --%>
<!-- 													<tr> -->
<%-- 														<td class="text-bold-500">${resident.re_name} --%>
<!-- 															<button type="button" class="btn btn-primary btn-sm" -->
<!-- 																data-bs-toggle="modal" data-bs-target="#delresdient" -->
<!-- 																style="float: right;">삭제</button> -->
<!-- 														</td> -->
<!-- 													</tr> -->
<%-- 												</c:forEach> --%>
<!-- 											</tbody> -->

<!-- 											<tfoot> -->
<!-- 												<tr> -->
<!-- 													<td> -->
<!-- 														<button type="button" class="btn btn-primary" -->
<!-- 															data-bs-toggle="modal" data-bs-target="#roomUpdate"> -->
<!-- 															생활실수정</button> -->
<!-- 														<button type="button" class="btn btn-primary" -->
<!-- 															data-bs-toggle="modal" data-bs-target="#addresdient"> -->
<!-- 															입소자추가</button> -->
<!-- 													</td> -->
<!-- 												</tr> -->
<!-- 												<tr> -->
<!-- 													<td> -->
<!-- 														<p>6/6</p> -->
<!-- 													</td> -->
<!-- 												</tr> -->
<!-- 											</tfoot> -->
<!-- 										</table> -->
<!-- 									</div> -->
									
									
									
								</div>
							</div>
							
							
							<hr>
							<!-- 밑에는 2층-->



							<div class="card-header">
								<h4 class="card-title">2층</h4>

								<div class="card-content row">

									<div class="table-responsive col-md-3">
										<!-- div 에 id 주고 추가 눌렀을 경우 ajax로-->
										<table class="table mb-0">
											<thead class="thead-dark">
												<tr>
													<th>진달래실&nbsp&nbsp<span style="font-size: x-small;">담당자:홍길동</span></th>

												</tr>
											</thead>

											<tbody>
												<tr>
													<td class="text-bold-500">김아무개</td>
												</tr>
												<tr>
													<td class="text-bold-500">이아무개</td>
												</tr>
												<tr>
													<td class="text-bold-500">박아무개</td>
												</tr>
												<tr>
													<td class="text-bold-500">최아무개</td>
												</tr>
												<tr>
													<td class="text-bold-500">민아무개</td>
												</tr>
											</tbody>

											<tfoot>
												<tr>
													<td>
														<button type="button" class="btn btn-primary"
															data-bs-toggle="modal" data-bs-target="#roomUpdate">
															생활실 수정</button>
													</td>
													<td>
														<p>6/6</p>
													</td>
												</tr>
											</tfoot>
										</table>
									</div>



								</div>


							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Table head options end -->




			<!-- 생활실 등록 Modal -->
			<div class="modal fade" id="roomInsert" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">생활실 등록</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<section class="section">
								<div class="card">


									<div class="card-header">
										<h4 class="card-title">Basic Inputs</h4>
									</div>

									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="floor">층</label> <input type="text"
														class="form-control" id="floor" placeholder="층을 입력해주세요">
													<p>
														<small class="text-muted">ex)3 *숫자만입력*</small>
												</div>

												<div class="form-group">
													<label for="roomName">호실명</label>
													<input type="text" class="form-control" id="inroomName"
														placeholder="생활실명을 입력해주세요">
													<p>
														<small class="text-muted">ex)해바라기실</small>
												</div>

												<div class="form-group">
													<label for="Total">정원</label> <input type="text" id="Total"
														class="form-control" placeholder="정원을 입력해주세요">
													<p>
														<small class="text-muted">ex)6 *숫자만입력*</small>
													</p>
												</div>

												<div class="form-group">
													<label for="damdang">담당자</label>
													<fieldset class="form-group">
														<select class="form-select" id="damdangSelect">
															<c:forEach items="${memList}" var="member">
																<option value="${member.mem_name}">${member.mem_name}</option>
															</c:forEach>
														</select>
													</fieldset>


													<!-- <button type="button" id="damdang" class="form-control" data-bs-toggle="dropdown" aria-expanded="false" style="text-align:left";>
                                                            담당자를 선택해주세요
                                                            </button>
                                                            <ul class="dropdown-menu">
                                                              <li><a class="dropdown-item active" href="#">홍길동</a></li>
                                                              <li><a class="dropdown-item" href="#">놀부</a></li>
                                                              <li><a class="dropdown-item" href="#">흥부</a></li>
                                                            </ul> -->
												</div>
											</div>

										</div>
									</div>
								</div>
							</section>
							<!--text 입력창-->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="save(floor,inroomName,Total,damdangSelect)">저장</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>

						</div>
					</div>
				</div>
			</div>
			<!-- 생활실 등록 Modal END-->


			<!-- 생활실 수정 Modal-->
			<div class="modal fade" id="roomUpdate" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">생활실 수정</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<section class="section">
								<div class="card">


									<div class="card-header">
										<h4 class="card-title">Basic Inputs</h4>
									</div>

									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="floor">층</label> <input type="text"
														class="form-control" id="upfloor" placeholder="층을 입력해주세요">
													<p>
														<small class="text-muted">ex)3 *숫자만입력*</small>
												</div>

												<div class="form-group">
													<label for="roomName">호실명</label>
													<!-- <small class="text-muted">eg.<i>someone@example.com</i></small> -->
													<input type="text" class="form-control" id="uproomName"
														placeholder="생활실명을 입력해주세요">
													<p>
														<small class="text-muted">ex)해바라기실</small>
												</div>

												<div class="form-group">
													<label for="Total">정원</label> <input type="text" id="Total"
														class="form-control" placeholder="정원을 입력해주세요">
													<p>
														<small class="text-muted">ex)6 *숫자만입력*</small>
													</p>
												</div>

												<div class="form-group">
													<label for="damdang">담당자</label>
													<button type="button" id="damdang" class="form-control"
														data-bs-toggle="dropdown" aria-expanded="false"
														style="text-align: left";>담당자를 선택해주세요</button>
													<ul class="dropdown-menu">
														<li><a class="dropdown-item active" href="#">홍길동</a></li>
														<li><a class="dropdown-item" href="#">놀부</a></li>
														<li><a class="dropdown-item" href="#">흥부</a></li>
													</ul>
												</div>
											</div>

										</div>
									</div>
								</div>
							</section>
							<!--text 입력창-->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">저장</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 생활실 수정 Modal END-->



			<!--footer-->
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
			<!--footer-->
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
</body>

<script>


roomlistCall();

        console.log("check1");
        
        /*생활실등록->등록버튼*/
       		
        function save(floor,inroomName,Total,damdangSelect){
        	console.log("check");
        	var floor = $('#floor').val();
        	var inroomName = $('#inroomName').val();
        	var Total = $('#Total').val();
        	//var $damdangSelect = $('#roomInsert input[id=damdangSelect]');
        	var damdangSelect =$("#damdangSelect").val();
//         	console.log(floor);
//         	console.log(inroomName);
//         	console.log(Total);
//         	console.log(damdangSelect);
        
        	console.log("check2");
        	
	        	if(floor==''){
	        		alert("층을 입력해주세요");

	        	}else if(inroomName==''){
	        		alert("호실명을 입력해주세요");

	        	}else if(Total==''){
	        		alert("정원을 입력해주세요");

	        	}else{
	        		console.log("check3");

 	        		$.ajax({
 	        			type:'GET',
 	        			url:'roomWrite',
 	         			data:{'floor':floor,'inroomName':inroomName,'Total':Total,'damdangSelect':damdangSelect},
 	        			dataType:'JSON',
 	        			success:function(data){
 	        				console.log(data);
 	        				console.log(data.success);
 	        				alert("성공");
 	        				if(data.success>0){
 	        					
 	        					showroomdrawList(floor,inroomName,Total,damdangSelect);//1-1등록 성공시 drawList
 	        					
 	        					$('#roomInsert').modal('hide');//이걸해줘야 저장시 modal 창이 닫히더라고					 	        					
 	        				}
 	        			},
 	        			error:function(e){
 	        				console.log(e);
 	        				alert("실패");
 	        			}
 	        		});
	        	}
        }
        
        
        
        
        //카테고리 눌렀을때 리스트 보여주는 ajax
        function roomlistCall(){
        	
        	$.ajax({
        		type:'GET',
        	    url:'roomlistCall.do',
        	    data:{},
        	    datatype:'JSON',
        	    success:function(data){
        	    	console.log(data);
        	    	showroomdrawList(data.roomlistCall);//리스트 그려젔고residentdrawList(data.roomlistCall)
        	    	//alert("서엉공");
        	    },
        	    error:function(e){
        	    	console.log(e);
        	    	alert("실패");
        	    }
        		
        	});
        }
        
        
        
        //생활실등록 테이블 추가됨
        function showroomdrawList(list){
        	//console.log(floor,inroomName,Total,damdangSelect);
        	//$('#appendroomtable').append(floor,inroomName,Total,damdangSelect);
        	var content='';
        	for(var i=0;i<list.length;i++){
        		content+='<div class="accordion" id="accordionExample">';
        	    content+='<div class="accordion-item">';
        	    content+='<h2 class="accordion-header" id="headingOne">';

        	    content+='<thead class="thead-dark">';
        	    
        	    content+='<table class="table mb-0">';

        	    content+='<button class="accordion-button col-md-3" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" id="roomName">'+list[i].ro_name+'</button>';
        	    
        	    content+='</table>';
        	    
        	    content+='</thead>';

        	    content+='</h2>';

        	    content+='<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">';
        	    content+='<div class="accordion-body col-md-3">';

        	    content+='<tbody>';
        	    content+='<tr>';
        	    content+='<td class="text-bold-500">';
        	    
        	    content+='<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#delresdient" style="float: right;">'+"삭제"+'</button>';
        	    content+='</td>';
        	    content+='</tr>';
        	    content+='</tbody>';
        	    content+='<tfoot>';
        	    content+='<tr>';
        	    content+='<td>';
        	    content+='<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomUpdate">'+"생활실수정"+'</button>';
        	    content+='</td>';
        	    content+='</tr>';
        	    content+='<tr>';
        	    content+='</tr>';
        	    content+='</tfoot>';

        	    content+='</div>';
        	    content+='</div>';


        	    content+='</div>';
        	    content+='</div>';


        	    content+='</div>';
        	    content+='</div>';
        	}
        	$('#appendroomtable').append(content);
        	
        	

        }
        
        /*
        var content='';
        	for(var i=0;i<list.length;i++){
        	content+='<div class="table-responsive col-md-3">';
        	content+='<table class="table mb-0">';
        	content+='<thead class="thead-dark">';
        	content+='<th id="roomName">'+list[i].ro_name+'</th>';
        	content+='</thead>';
        	content+='<tbody>';
        	content+='<tr>';
        	content+='<td class="text-bold-500">';
        	//
        	content+='<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#delresdient" style="float: right;">'+"삭제"+'</button>';
        	content+='</td>';
        	content+='</tr>';
        	content+='</tbody>';
        	content+='<tfoot>';
        	content+='<tr>';
        	content+='<td>';
        	content+='<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomUpdate">'+"생활실수정"+'</button>';
        	content+='</td>';
        	content+='</tr>';
        	content+='<tr>';

        	content+='</tr>';
        	content+='</tfoot>';
        	content+='</table>';
        	content+='</div>';
        */
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//         //생활실등록 테이블 추가됨
//         function residentdrawList(floor,inroomName,Total,damdangSelect){
//         	//console.log(floor,inroomName,Total,damdangSelect);
//         	//$('#appendroomtable').append(floor,inroomName,Total,damdangSelect);
//         	var content='';
//         	content+='<div class="table-responsive col-md-3">';
//         	content+='<table class="table mb-0">';
//         	content+='<thead class="thead-dark">';
//         	content+='<th id="roomName">'+inroomName+'<span>'+damdangSelect+'</span>'+'</th>';
//         	content+='</thead>';
//         	content+='<tbody>';
//         	content+='<tr>';
//         	content+='<td class="text-bold-500">';
//         	//
//         	content+='<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#delresdient" style="float: right;">'+"삭제"+'</button>';
//         	content+='</td>';
//         	content+='</tr>';
//         	content+='</tbody>';
//         	content+='<tfoot>';
//         	content+='<tr>';
//         	content+='<td>';
//         	content+='<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomUpdate">'+"생활실수정"+'</button>';
//         	content+='<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addresdient">'+"입소자추가"+'</button>';
//         	content+='</td>';
//         	content+='</tr>';
//         	content+='<tr>';
//         	content+='<td>';
//         	content+='<p>'+Total+'</p>';
//         	content+='</td>';
//         	content+='</tr>';
//         	content+='</tfoot>';
//         	content+='</div>';
        	
//         	content+='<td>'+floor+'</td>';
        	
//         	content+='</table>';
//         	$('#appendroomtable').append(content);

//         }
        

        

        
        
        

   
</script>

</html>