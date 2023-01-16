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
<link rel="stylesheet" href="richtexteditor/runtime/richtexteditor_content.css">
<link rel="stylesheet" href="richtexteditor/rte_theme_default.css" />
<script type="text/javascript" src="richtexteditor/rte.js"></script>
<script type="text/javascript"
		src='richtexteditor/plugins/all_plugins.js'></script>
</head>
<body>
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
			<!-- 여기 안에서 개발  -->
			<div class="page-heading">
				<h3>결재 문서 등록</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
						<form action="" method="post">
							<div class="d-flex align-items-center">
							<div class="container">
							 <div class="row justify-content-between">
							<table class="table table-bordered table-hover row" style="width: 400px;">
								<tbody>
									<tr>
										<th>결재 양식</th>
										<td>
											<select id="payFormDropDown">
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
									<tr>
										<th>팀 공개</th>
										<td colspan="2" style="text-align: center">
											<input class="form-check-input" type="checkbox" id="openchk">
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
								 					<th id="selfpmsignName">${SelfMem_name}</th>
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
							
						</form>
						<div id="div_editor"></div>
						<input type="hidden" name="wp_content"/>
							<div style="text-align: center;margin-top: 30px;">
								<button type="button" class="btn btn-primary" onclick="save()">등록하기</button>
								<button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
							</div>
						</div>
					</div>
				</section>
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
     			 	<button id="PayFormOk" class="btn btn-primary">선택</button>
     			 	<button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
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
     			 	<button id="ReferOK" class="btn btn-primary">선택</button>
     			 	<button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
     			 </div>
			   </div>
			</div>
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

	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
</body>
<script>

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
	
	
	function PayFormModalListCall(MPFlist){
		var content = '';
		for(var i=0;i<MPFlist.length;i++){
			content +='<tr>';
			content +='<td><input type="radio" name="chk_info">'
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
				content +='<input class="form-check-input me-1" type="checkbox" id="'+refercho[a].mem_name+'" value="'+refercho[a].mem_id+'">';
				content +=refercho[a].mem_name;
				content +='</li>';
			}
		}
		content += '</ul>';
		content +='</li>';
		
	}
//  	for(var c=0;c<ReferOk_arr.length;c++){
//  		if($("input:checkbox").attr('id')==ReferOk_arr[c]){
//  			$(this).prop("checked",true);
//  		}
//  	}
	$("#referchoListBody").empty();
	$("#referchoListBody").append(content);
	
}

var ReferOk_arr=new Array();
var ReferID_arr=new Array();
$(document).on('click','#ReferOK',function(){
	$("input[type='checkbox']:checked").each(function(){
		var ReferOk = $(this).val();
		var ReferID = $(this).attr('id');
		ReferOk_arr.push(ReferOk);
		ReferID_arr.push(ReferID);
	});
	//$("#Referinsert").text($("input[type='checkbox']:checked").val());
	$("#ReferinsertInput").empry();
	$("#Referinsert").empty();
	$("#ReferinsertInput").val(ReferOk_arr);
	$("#Referinsert").text(ReferID_arr);
	$("#referChoList").modal('hide');
});
	


	
	




var count=0;
$(document).on('click','#pmline',function(){
	if($("#pmsignName th").length == 4){
		alert('결재 라인 지정은 최대 3명만 가능합니다.');
		return;
	}
	count++;
	var content1='';
	content1 +='<th>결재 라인<input style="margin-left:11px;width:5px;"'; 
	content1 +='type="button" id='+count+' value="-" class="btn btn-sm btn-secondary" onclick="pmlinedel(this)"></th>';
	var content2='';
	count++;
	content2 +='<td><input type="button" value="결재자 추가" id='+count+'></td>';
	$("#pmsignName").append(content1);
	$("#pmsign").append(content2);
});

function pmlinedel(e){
	var idx=$(e).attr("id");
	$("#"+idx).parent().remove();
	idx++;
	$("#"+idx).parent().remove();
	
}



var config = {};
config.editorResizeMode = "none"; // 에디터 크기조절 안됨
config.file_upload_handler = function(file, pathReplace) {
	console.log(file); // 파일 정보 확인 가능
	if (file.size > (1 * 1024 * 1024)) { // 1MB 이상의 사진일 경우..
		alert("1MB 이상의 사진은 올릴 수 없습니다.");
		pathReplace("/filephoto/noimage.png"); // data:image 경로를 변경
	}
}

var editor = new RichTextEditor("#div_editor", config);
function save() {
	$("input[name='wp_content']").val(editor.getHTMLCode());
	var teamChk=$("#openchk").is(':checked');
	if($("input[name='wp_content']").val().length < 11){
		alert('최소 10글자 입력 해주세요.');
	}else{
		// $("form").submit();
	}
}
</script>
</html>