<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<h3>결재 문서 등록</h3>
			</div>
			<div class="page-content">
				<section class="row">
				<form action="PayMentInsert.do" method="post" enctype="multipart/form-data">
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
							<div class="d-flex align-items-center">
							<div class="container">
							 <div class="row justify-content-between">
							<table class="table table-bordered table-hover row" style="width: 600px;">
								<tbody>
									<tr>
										<th class="col-md-2">결재 양식</th>
										<td>
											<select id="payFormDropDown" name="payFormDropDown" onchange="payFormDropDownCall()">
												<option>휴가</option>
												<option>지출결의서</option>
												<option>품의서</option>
												<option>경위서</option>
											</select>
										</td>
										<td>
										<button type="button" class="btn btn-sm btn-primary" onclick="PayFormModal()"
										data-bs-toggle="modal" data-bs-target="#PayFormCallList">불러오기</button>
										</td>
									</tr>
									<tr id="vacationDropParent">
										<th>휴가 날짜</th>
										<td>
										<select id="vacationDrop" name="vacationDrop" onchange="vacationDropCall()">
											<option>연차</option>
											<option>오전 반차</option>
											<option>오후 반차</option>
											<option>공가</option>
											<option>병가</option>
										</select>
										</td>
										<td>
											<input name="FirstVacationDate" type="date" style="float: left:;">&nbsp;&nbsp; 
											<input name="SecondVacationDate" id="dateHalfSel" type="date" style="float: right;"> 			
										</td>
									</tr>
									<tr>
										<th>팀 공개</th>
										<td colspan="2" style="text-align: center">
											<input class="form-check-input" type="checkbox" name="openchk" id="openchk">
<!-- 											  <label class="form-check-label" for="flexCheckDefault"> -->
<!-- 											    Default checkbox -->
<!-- 											  </label> -->
										</td>
									</tr>
									<tr>
										<th>참조자</th>
										<td id="Referinsert">
										</td>
										<td>
										<button type="button" class="btn btn-sm btn-primary" onclick="referCho()"
										data-bs-toggle="modal" data-bs-target="#referChoList">참조자 선택</button>
										</td>
									</tr>
									
								</tbody>
							</table>
							<input id="ReferinsertInput" type="hidden" name="ReferinsertInput" value="">
								 <div class="col-md-auto align-self-center">
								 	<input id="pmline" type="button" class="btn btn-sm btn-primary" value="결재라인 추가"
								 	style="float: right;">
								 	<div>
								 		<table class="table table-bordered table-hover">
								 			<thead>
								 				<tr id="pmsignName">
								 					<th id="selfpmsignName">${SelfMem_name}
								 						<input type="hidden" value="${mem_posLevel}" name="SelfMem_Pos">
								 					</th>
								 				</tr>
								 			</thead>
								 			<tbody>
								 				<tr id="pmsign">
								 					<td></td>
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
						  <input type="text" class="form-control" name="PaymentSubject" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						</div>
						<div id="div_editor"></div>
						<input type="hidden" name="wp_content"/>
							<div class="mb-3">
							  <label for="formFileMultiple" class="form-label"></label>
							  <input class="form-control" name="PayMentFile" type="file" id="formFileMultiple" multiple>
							</div>
							<div class="input-group">
							  <span class="input-group-text">의견란</span>
							  <textarea class="form-control" name="bigoContent" aria-label="With textarea"></textarea>
							</div>
							<div style="text-align: center;margin-top: 30px;">
								<button type="button" type="button" class="btn btn-primary" onclick="save()">등록하기</button>
								<button type="button" type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
							</div>
						</div>
						
					</div>
					<div class="modal fade" id="PayFormCallList" tabindex="-1" role="dialog" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog modal-lg">
			   <div class="modal-content">
			   	 <div class="modal-header">
			   	 	<h3>결재 양식 선택</h3>
			   	 </div>
			   	  <div class="modal-body table-wrapper-scroll-y my-custom-scrollbar">
			   	  	<table class="table table-bordered table-hover">
			   	  		<thead>
			   	  			<tr>
			   	  				<th></th>
			   	  				<th>결재 양식</th>
			   	  				<th>등록자</th>
			   	  				<th>제목</th>
			   	  				<th>양식 사용 횟수</th>
			   	  			</tr>
			   	  		</thead>
			   	  		<tbody id="PayFormListBody">
			   	  			
			   	  		</tbody>
			   	  	</table>
     			 </div>
     			 <div class="modal-footer">
     			 	<button id="PayFormOk" type="button" class="btn btn-primary">선택</button>
     			 	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
     			 </div>
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
			   	  	<ul class="list-group" id="referchoListBody">
			   	  	</ul>
     			 </div>
     			 <div class="modal-footer">
     			 	<button id="ReferOK" type="button" class="btn btn-primary">선택</button>
     			 	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
     			 </div>
			   </div>
			</div>
			</div>
			
			<div class="modal fade" id="PayOrgCall" tabindex="-1" role="dialog" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog modal-sm">
			   <div class="modal-content">
			   	 <div class="modal-header">
			   	 	<h3>결재자 추가</h3>
			   	 </div>
			   	  <div class="modal-body table-wrapper-scroll-y my-custom-scrollbar">
			   	  	<ul class="list-group" id="OrgDeptList">
			   	  	</ul>
     			 </div>
     			 <input type="hidden" name="OrgPmSelected" id="OrgPmSelected" value="">
     			 <div class="modal-footer">
     			 	<button id="OrgDeptListOK" type="button" class="btn btn-primary">선택</button>
     			 	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
     			 </div>
			   </div>
			</div>
			</div>
			<input type="hidden" name="PMlineIndex" value="">
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
// 휴가 드롭다운 표시 조건 //
function payFormDropDownCall(){
	if($("#payFormDropDown").val() != '휴가'){
		$("#vacationDropParent").css('display','none');
	}else{
		$("#vacationDropParent").css('display','');
	}
}
function vacationDropCall(){
	console.log('!!@@##');
	console.log($("#vacationDrop").val());
	if ($("#vacationDrop").val() == '오전 반차' || $("#vacationDrop").val() == '오후 반차') {
		$("#dateHalfSel").css('display','none');
	}else{
		$("#dateHalfSel").css('display','')
	}
}
// 휴가 드롭다운 표시 조건 //

// 결재 양식 모달 AJAX // 
function PayFormModal(){
	var payFormDropDown = $("#payFormDropDown").val();
	
	$.ajax({
		type:'get'
		,url:'WritePayformCall.ajax'
		,data:{'payFormDropDown':payFormDropDown}
		,dataType:'json'
		,success:function(data){
			console.log(data);
			PayFormModalListCall(data.modalPayFormList);
		},error:function(e){
			console.log(e);
		}
		
	});
// 결재 양식 모달 창 //	


// 결재 양식 모달 그리기 //	
	function PayFormModalListCall(MPFlist){
		var content = '';
		for(var i=0;i<MPFlist.length;i++){
			content +='<tr>';
			content +='<td><input type="radio" name="chk_info" value="'+MPFlist[i].pf_idx+'">'
			content +='<textarea style="display:none;">'+MPFlist[i].pf_content+'</textarea>';
			content +='</td>';
			content +='<td>'+MPFlist[i].pf_cate+'</td>';
			content +='<td>'+MPFlist[i].mem_name+'</td>';
			content +='<td>'+MPFlist[i].pf_subject+'</td>';
			content +='<td>'+MPFlist[i].pf_count;
			content += '</td>';
			
			content +='</tr>';
		}
		$("#PayFormListBody").empty();
		$("#PayFormListBody").append(content);
		
		$("#PayFormOk").click(function(){
			console.log('저장!!');
			editor.setHTMLCode($(":radio[name='chk_info']:checked").next()[0].textContent);
			$("#PayFormCallList").modal('hide');
		});
		
	}
	}
//결재 양식 모달 그리기 //	


// 참조자 선택 AJAX //
function referCho(){
	$.ajax({
		type:'get'
		,url:'PayMentReferCho.ajax'
		,dataType:'json'
		,success:function(data){
			console.log(data);
			referChoList(data.refercho,data.referDept);
		},error:function(e){
			console.log(e)
		}
	});
}
//참조자 선택 AJAX //

// 참조자 선택 Modal //
function referChoList(refercho,referDept){
	var content='';

	for(var i=0;i<referDept.length;i++){
		content +='<li class="list-group-item" id='+referDept[i].dept_name+'>';
		// content +='<input class="form-check-input me-1" type="checkbox" value="'+refercho[i].dept_name+'" onclick="AllSelRefer()">';
		content +=referDept[i].dept_name;
		content += '<ul class="list-group">';
		for(var a=0;a<refercho.length;a++){
			if(referDept[i].dept_num == refercho[a].dept_num){
				content +='<li class="list-group-item">';
				content +='<input class="form-check-input me-1" name="ReferCheckBox" type="checkbox" id="'+refercho[a].mem_name+'" value="'+refercho[a].mem_id+'">';
				content +=refercho[a].mem_name+'['+refercho[a].pos_name+']';
				content +='</li>';
			}
		}
		content += '</ul>';
		content +='</li>';
		
	}
	$("#referchoListBody").empty();
	$("#referchoListBody").append(content);
	
}
//참조자 선택 Modal //

// 참조자 선택 후 값 담기 //
$(document).on('click','#ReferOK',function(){
	var ReferOk_arr=new Array();
	var ReferID_arr=new Array();
	$("#ReferinsertInput").empty();
	$("#Referinsert").empty();
	$("input[name='ReferCheckBox']:checked").each(function(){
		var ReferOk = $(this).val();
		var ReferID = $(this).attr('id');
		ReferOk_arr.push(ReferOk);
		ReferID_arr.push(ReferID);
	});
	//$("#Referinsert").text($("input[type='checkbox']:checked").val());
	$("#ReferinsertInput").val(ReferOk_arr);
	$("#Referinsert").text(ReferID_arr);
	$("#referChoList").modal('hide');
});
//참조자 선택 후 값 담기 //	


	



// 결재자 추가 AJAX //
var SelfMem_Pos=$("input[name='SelfMem_Pos']").val()
function PayOrgCall(){
	console.log($("#pmsignName").children());
	var LengthChk = $("#pmsignName").children().length;
	LengthChk--;
	if(LengthChk == 2){
		// LengthChk--;
		var LineChoice=$("#pmsignName  th:nth-child("+LengthChk+")")[0].innerText;
		var StartIndex=LineChoice.indexOf("[")+1;
		var LastIndex=LineChoice.indexOf("]");
		var Result = LineChoice.substring(StartIndex, LastIndex);
		console.log("result 값은 : "+Result);
		// $(document).on('click','#OrgDeptListOK',function(){});
	}
	if(LengthChk == 3){
		// LengthChk--;
		// LengthChk--;
		var LineChoice=$("#pmsignName  th:nth-child("+LengthChk+")")[0].innerText;
		var StartIndex=LineChoice.indexOf("[")+1;
		var LastIndex=LineChoice.indexOf("]");
		var Result = LineChoice.substring(StartIndex, LastIndex);
		console.log("result 값은 : "+Result);
	}
	if(Result =='주임') SelfMem_Pos = 4;
	else if(Result =='팀장') SelfMem_Pos = 3;
	else if(Result =='사무국장') SelfMem_Pos=2;
	else if(Result =='원장') SelfMem_Pos=1 ;
	else SelfMem_Pos=$("input[name='SelfMem_Pos']").val();
	$.ajax({
		type:'get'
		,url:'PayOrgCall.ajax'
		,dataType:'json'
		,data:{'SelfMem_Pos':SelfMem_Pos}
		,success:function(data){
			PayOrgCallList(data.PayOrgCall,data.OrgDept);
		},error:function(e){
		}
	});
}
// 결재자 추가 AJAX //

// 결재자 추가 모달 //

function PayOrgCallList(OrgList,OrgDept){
	var content='';

	for(var i=0;i<OrgDept.length;i++){
		content +='<li class="list-group-item" id='+OrgDept[i].dept_name+'>';
		content +=OrgDept[i].dept_name;
		content += '<ul class="list-group">';
		for(var a=0;a<OrgList.length;a++){
			if(OrgDept[i].dept_num == OrgList[a].dept_num){
				content +='<li class="list-group-item">';
				content +='<input class="form-check-input me-1" type="radio"'; 
				content += ' name="OrgRadio" value="'+OrgList[a].mem_id+','+OrgList[a].pos_level+'">';
				content +=OrgList[a].mem_name+'['+OrgList[a].pos_name+']';
				content +='</li>';
			}
		}
		content += '</ul>';
		content +='</li>';
		
	}
	$("#OrgDeptList").empty();
	$("#OrgDeptList").append(content);
}
// 결재자 추가 모달 //

// 결재자 추가 후 값 담기
var OrgCnt=1;
var OrgMem_name_ID=new Array();
	$(document).on('click','#OrgDeptListOK',function(){
		// console.log($("input[name='OrgRadio']:checked").val());

		var OrgMem_idOne= $("input[name='OrgRadio']:checked").val().split(",")[0];
		var OrgMem_idTwo= $("input[name='OrgRadio']:checked").val().split(",")[1];
		var OrgMem_name =  $("input[name='OrgRadio']:checked").next().prevObject[0].offsetParent.innerText;
		
// 		$("#"+OrgCnt).parent().prepend(OrgMem_name);
// 		OrgCnt++;
// 		$("#"+OrgCnt).css('display','none');
// 		OrgCnt++;
		// OrgCnt=count;
		$("#"+OrgCnt).parent().prepend(OrgMem_name);
		OrgCnt++;
		$("#"+OrgCnt).css('display','none');
		OrgCnt++;
		OrgMem_name_ID.push(OrgMem_idOne);
		$("#OrgPmSelected").val(OrgMem_name_ID);
		console.log(OrgMem_name_ID);
	 	$("#PayOrgCall").modal('hide');
	 	
	});

//결재자 추가 후 값 담기

// 결재라인 추가 //
var count=0;
$(document).on('click','#pmline',function(){
	
	if($("#pmsignName th").length == 4){
		alert('결재 라인 지정은 최대 3명만 가능합니다.');
		return;
	}
	count++;
	var content1='';
	content1 +='<th><input style="margin-left:11px;width:5px;"'; 
	content1 +='type="button" id='+count+' value="-" class="btn btn-sm btn-secondary" onclick="pmlinedel(this)"></th>';
	var content2='';
	count++;
	content2 +='<td><button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#PayOrgCall" onclick="PayOrgCall()"';
	content2 +='id='+count+' type="button" id="NotEmptyButton">결재자 추가</button></td>';
	$("#pmsignName").append(content1);
	$("#pmsign").append(content2);
	console.log("추가 count 값 : "+count);
	// console.log("추가 OrgCnt 값 : "+OrgCnt);
});
//결재라인 추가 //


// 결재 라인 삭제 //
function pmlinedel(e){
	idx=$(e).attr("id");
	console.log("삭제1 count 값 : "+count);
	$("#"+idx).parent().remove();
	idx++;
	$("#"+idx).parent().remove();
	console.log("삭제2 count 값 : "+count);
	// console.log("삭제 OrgCnt 값 : "+OrgCnt);
	console.log($("#OrgPmSelected").val().substring($("#OrgPmSelected").val().lastIndexOf(",")));
}
//결재 라인 삭제 //


// 에디터 관련 //
var config = {};
config.editorResizeMode = "none"; // 에디터 크기조절 안됨
config.file_upload_handler = function(file, pathReplace) {
	console.log(file); // 파일 정보 확인 가능
	if (file.size > (1 * 1024 * 1024)) { // 1MB 이상의 사진일 경우..
		alert("1MB 이상의 사진은 올릴 수 없습니다.");
		pathReplace("/filephoto/noimage.png"); // data:image 경로를 변경
	}
}
//에디터 관련 //

// form 전송 //
var editor = new RichTextEditor("#div_editor", config);
function save() {
	$("input[name='wp_content']").val(editor.getHTMLCode());
	var teamChk=$("#openchk").is(':checked');
	if($("input[name='wp_content']").val().length < 11){
		alert('최소 10글자 입력 해주세요.');
	}else{
		if($("input[name='chk_info']").val() == null){
			alert('결재 양식을 선택해주세요');
			return;
		}
		$("input[name='PMlineIndex']").val($("#pmsignName"));
		if($("input[name='OrgPmSelected']").val() == ""){
			alert('결재 라인 선택해주세요');
			return;
		}
		if($("input[name='PaymentSubject']").val() == ''){
			alert('제목이 없습니다.');
			return;
		}
		if($("#payFormDropDown").val() == '휴가'){
			if($("#vacationDrop").val() == '연차' || $("#vacationDrop").val() == '병가' || $("#vacationDrop").val() == '공가'){
				console.log($("input[name='FirstVacationDate']").val()+" 입니다.");
				console.log($("input[name='SecondVacationDate']").val()+" 입니다.");
				if($("input[name='FirstVacationDate']").val() == "" || $("input[name='SecondVacationDate']").val() == ""){
					alert('휴가 날짜 선택해주세요');
					return;
				}
			}else if($("#vacationDrop").val() == '오후 반차' || $("#vacationDrop").val() == '오전 반차'){
				if($("input[name='FirstVacationDate']").val() == ""){
					alert('휴가 날짜 선택해주세요');
					return;
				}
			}
		}
		$("form").submit();
	}
}
//form 전송 //
</script>
</html>