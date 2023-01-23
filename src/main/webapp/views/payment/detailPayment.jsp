<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
.my-custom-scrollbar {
position: relative;
height: 500px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
</style>
<!-- <link rel="stylesheet" href="richtexteditor/runtime/richtexteditor_content.css"> -->
<link rel="stylesheet" href="res/style.css" />
<link rel="stylesheet" href="richtexteditor/rte_theme_default.css" />
<script type="text/javascript" src="richtexteditor/rte.js"></script>
<script type="text/javascript"
		src='richtexteditor/plugins/all_plugins.js'></script>
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
			<div class="page-heading">
				<h3>결재 상세 보기</h3>
			</div>
			<div class="page-content">
				<section class="row">
				<form action="PayMentInsert.do" method="post" enctype="multipart/form-data">
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
							<div class="d-flex align-items-center">
							<div class="container">
							 <div class="row justify-content-between">
							<table class="table table-bordered table-hover row" style="width: 500px;">
								<tbody>
									<tr>
										<th>문서 번호</th>
										<td>
											${PayDto.pm_idx} 
										</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td >
											${PayDto.mem_name} 
										</td>
									</tr>
									<tr>
										<th>소속</th>
										<td >
											${PayDto.pm_dept} 
										</td>
									</tr>
									<tr>
										<th>결재 양식</th>
										<td>
											${PayDto.pf_cate} 
										</td>
									</tr>
									<c:if test="${PayDto.pf_cate eq '휴가'}">
									<tr id="vacationDropParent">
										<th>휴가 날짜</th>
										<td>
											${PayDto.ho_type}
										</td>
										
									</tr>
									<tr>
										<th>휴가 기간</th>
										<td>
										<c:set var="FirstTime" value="${PayDto.ho_start}"/>
										${fn:substring(FirstTime,0,16)}
										~ 
										<c:set var="SecondTime" value="${PayDto.ho_end}"/>
										${fn:substring(SecondTime,0,16)}
										</td>
									</tr>
									</c:if>
									<tr>
										<th>참조자</th>
										<td>
										<button type="button" class="btn btn-sm btn-primary" onclick="referCho()"
										data-bs-toggle="modal" data-bs-target="#referChoList">참조자</button>
										</td>
									</tr>
									<tr>
										<th>팀 공개</th>
										<td>
											 <c:if test="${PayDto.pm_open eq '1'}">공개</c:if>		
											 <c:if test="${PayDto.pm_open eq '0'}">미 공개</c:if>		
										</td>
									</tr>
									<tr>
										<th>작성일</th>
										<td>
										<c:set var="WriteDate" value="${PayDto.pm_date}"/>
										${fn:substring(WriteDate,0,16)}	 	
										</td>
									</tr>
									<tr>
										<th>현재 상태</th>
										<td>
											 ${PayDto.pm_state}	
										</td>
									</tr>
									
								</tbody>
							</table>
							<input id="ReferinsertInput" type="hidden" name="ReferinsertInput" value="">
								 <div class="col-md-auto align-self-center">
								 	<div>
								 		<table class="table table-bordered table-hover">
								 			<thead>
								 				<tr>
								 					<th>
								 						${PayDto.mem_name}[${PayDto.pm_dept}]
								 					</th>
								 					<c:forEach items="${PmlineDto}" var="line">
								 					<th class="${line.mem_id}">${line.mem_name}[${line.dept_name}]</th>
								 					</c:forEach>
								 				</tr>
								 			</thead>
								 			<tbody >
								 				<tr style="width: 120px;height: 120px;" id="DFList" >
								 				</tr>
								 			</tbody>
								 		</table>
								 	</div>
							    </div>
							</div>
							
							</div>	
								
							</div>
							
						<div class="input-group mb-3">
						  <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
						  <input type="text" class="form-control" name="PaymentSubject" value="${PayDto.pm_subject}" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						</div>
						<div id="div_editor"></div>
						<div id="content" style="display: none;">
							${PayDto.pm_content}
						</div>
							<div class="mb-3">
							  <ul class="list-group">
							  <c:forEach items="${PayFile}" var="file">
							  	<li class="list-group-item">${file.paf_oriFileName}
							  	<input type="button" class="btn btn-sm btn-secondary" value="다운로드"
							  	onclick="location.href='download.do?path=${file.paf_newFileName}'"></li>
							  	</c:forEach>
							  </ul>
							</div>
							<div class="input-group">
							  <span class="input-group-text">의견란</span>
							  <c:if test="${PayDto.pm_state eq '진행' || PayDto.pm_state eq '등록'}">
							  <textarea style="resize: none;" id="bigoContent" class="form-control" name="bigoContent"  
							  aria-label="With textarea">${PayDto.pm_bigo}</textarea>
							  </c:if>
							  <c:if test="${PayDto.pm_state eq '반려' || PayDto.pm_state eq '완료'}">
							  <textarea style="resize: none;" id="bigoContent" class="form-control" name="bigoContent"  
							  aria-label="With textarea" readonly>${PayDto.pm_bigo}</textarea>
							  </c:if>
							</div>
							<div style="text-align: center;margin-top: 30px;">
								<button type="button" type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
							</div>
						</div>
						
					</div>
					
					
					
					
		
			
			
			<div class="modal fade" id="referChoList" tabindex="-1" role="dialog" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog modal-sm">
			   <div class="modal-content">
			   	 <div class="modal-header">
			   	 	<h3>참조자</h3>
			   	 </div>
			   	  <div class="modal-body table-wrapper-scroll-y my-custom-scrollbar">
			   	  	<table class="table table-bordered table-hover row" style="margin: 0 auto">
			   	  		<tbody>
			   	  			<tr>
			   	  				<th>이름</th>
			   	  				<th>소속</th>
			   	  				<th>직책</th>
			   	  			</tr>
			   	  		<c:forEach items="${ReferDto}" var="refer">
			   	  			<tr>
			   	  				<td>${refer.mem_name}</td>
			   	  				<td>${refer.dept_name}</td>
			   	  				<td>${refer.pos_name}</td>
			   	  			</tr>
			   	  			</c:forEach>
			   	  		</tbody>
			   	  	</table>
     			 </div>
     			 <div class="modal-footer">
     			 	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">닫기</button>
     			 </div>
			   </div>
			</div>
			</div>
			
	
			</form>
				</section>
			</div>
			
			
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
	<input type="hidden" value="" name="pmLineSave">
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
</body>
<script>
var pm_bigo=$("#bigoContent").val();
$("#bigoContent").on('keyup',function(){
	pm_bigo=$(this).val();
	console.log("aa"+pm_bigo);
});

DetailListCall();
function DetailListCall(){
	var Idx="${PayDto.pm_idx}";
	var mem_id="${PayDto.mem_id}"
	
	$.ajax({
		type:'get'
		,url:'DetailPaymentListCall.ajax'
		,data:{'pm_idx':Idx,'mem_id':mem_id}
		,dataType:'json'
		,success:function(data){
			console.log(data);
			DFListListCall(data);
		},error:function(e){
			console.log(e);
		}
	});
}

function DFListListCall(data){
	var SessionID="${SessionID}"
	var pm_self="${PayDto.pm_self}";
	var SessionID="${SessionID}";
	var mem_id="${PayDto.mem_id}";
	var pm_idx="${PayDto.pm_idx}";
	var content = '';
	if(pm_self == 0 && SessionID == mem_id){
		content += '<td><button type="button" class="btn btn-primary btn-sm" onclick="SangSin()">상신하기</button></td>'
	}else if(pm_self == 1){
		content += '<td id="MySangSin" style="text-align: center">';
		content += '<img style="width: 60px;height: 60px;" src="/sign/'+data.MySign+'"></td>';
	}
	if(!data.AnotherSign.length == 0){
		for (var i = 0; i < data.AnotherSign.length; i++) {
			if (data.line[i].pl_ch == 0 && pm_self == 1 && data.line[i].pl_hp == SessionID) {
				if(pm_idx == data.line[i].pm_idx){
							content += '<td class="'+data.line[i].mem_id+'"><button type="button"';
							content += 'class="btn btn-primary btn-sm"  value="상신" onclick="PmSangSin(this)">상신하기</button>';
							content += '<button type="button" class="btn btn-primary btn-sm"  value="반려" onclick="PmSangSin(this)">반려하기 </button> </td>';
				}
				
			}else if(data.line[i].pl_ch == 1 && pm_self == 1){
				content += '<td id="MySangSin" style="text-align: center">';
				content += '<img style="width: 60px;height: 60px;" src="/sign/'+data.AnotherSign[i].si_newFileName+'"></td>';
			}else if(data.line[i].pl_ch == 2 && pm_self == 1){
				content +='<td id="MySangSin" style="text-align: center">반려</td>';
			}else{
				content +='<td id="MySangSin" style="text-align: center"></td>';
			}
		}	
	}
	$("#DFList").empty();
	$("#DFList").append(content);
	
}




function SangSin(){
console.log("성공1?");
var Idx="${PayDto.pm_idx}";
var mem_id="${PayDto.mem_id}"
var mem_name="${PayDto.mem_name}";
var pf_idx="${PayDto.pf_idx}";
console.log(Idx);
console.log(mem_id);
	$.ajax({
		type:'post'
		,url:'MySangSin.ajax'
		,data: JSON.stringify({'pm_idx':Idx,'mem_id':mem_id,'mem_name':mem_name,'pf_idx':pf_idx,'pm_bigo':pm_bigo})
		,dataType:'json'
		,contentType: 'application/json; charset=utf-8'
		,success:function(data){
			console.log("성공2?");
			DetailListCall();
			location.reload();
		},error:function(e){
			console.log(e);
		}
	});

}

function PmSangSin(e){
	var pm_idx="${PayDto.pm_idx}";
	var mem_id=$(e).parent()[0].classList[0];
	var mem_name = $("."+mem_id)[0].innerText;
	var StartIndex=mem_name.indexOf("[")
	var Result = mem_name.substring(0, StartIndex);
	var pm_state=$(e).val();
	var pf_idx="${PayDto.pf_idx}";
	console.log(pm_bigo);
	
	$.ajax({
		type:'post'
		,url:'PmSangSin.ajax'
		,dataType:'json'
		,contentType: 'application/json; charset=utf-8'
		,data:JSON.stringify({'pm_idx':pm_idx,'mem_id':mem_id,'mem_name':Result,'pm_state':pm_state,'pm_bigo':pm_bigo,'pf_idx':pf_idx})
		,success:function(data){
			console.log(data);
			DetailListCall();
			location.reload();
		},error:function(e){
			console.log(e);
		}
	});
	
	
}








var editor = new RichTextEditor("#div_editor");

editor.setHTMLCode($("#content").html()); // 불러온 내용 넣기
editor.setReadOnly(); // 읽기 전용 옵션으로 변경

</script>
</html>