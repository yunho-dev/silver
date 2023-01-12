<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 은빛 우산 부트스트랩 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
</head>
<body>
	<section id="basic-horizontal-layouts">
	    <div class="row match-height">
	        <div class="col-md-6 col-12">
	            <div class="card">
	                <div class="card-header" style="padding-bottom: 0px; padding-top: 20px;">
	                    <h3 class="card-title">카테고리 등록</h3>
	                    <p>카테고리를 등록해 주세요<br>카테고리 이름은 중복될 수 없습니다.</p>
	                </div>
	                <div class="card-content">
	                    <div class="card-body">
	                        <form class="form form-horizontal" id="cateResist">
	                            <div class="form-body">
	                                <div class="row">
	                                    <div class="col-md-4"  style="font-size: large; font-weight: bold;">
	                                        <label>카테고리 이름</label> &nbsp;&nbsp;
	                                        <button type="button" id="cateNameCheck"
	                                            class="btn btn-primary me-1 mb-1">중복검사</button>
	                                    </div>
	                                    <div class="col-md-8 form-group">
	                                        <input type="text" class="form-control"
	                                            name="cateName" placeholder="입력해 주세요" style="height: 50px;">
	                                            <p class="cateCheckPls" style="color: #B1B1B1;">중복검사를 눌러주세요</p>
	                                    </div>
	                                    <div class="col-sm-12 d-flex justify-content-end">
	                                        <button type="button" id="cateSubmit"
	                                            class="btn btn-primary me-1 mb-1">등록</button>
	                                        <button type="button"
	                                            class="btn btn-light-secondary me-1 mb-1" onclick="location.href='itemCateList.go'">취소</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<!-- // Basic Horizontal form layout section end -->
</body>
<script>
	var cateCheck = false;
	
	$("#cateNameCheck").click(function(){
		var cateName = $('#cateResist input[name=cateName]');
		if(cateName.val()==''){
			alert("카테고리 이름을 입력해 주세요");
			cateName.focus();
		}else{
			$.ajax({
				type:'GET',
				url:'cateNameCheck.do',
				data:{'cateName':cateName.val()},//id값 전송
				dataType:'JSON',
				success:function(data){
					if(data.cateCheck){
						alert('이미 사용 중인 아이디 입니다.')
						$('.cateCheckPls').css('color', 'red');
						$('.cateCheckPls').text('사용이 불가능한 이름입니다. 중복검사를 눌러주세요');
					}else{
						cateCheck = true;
						alert('사용 가능한 이름입니다.')
						$('.cateCheckPls').css('color', 'green');
						$('.cateCheckPls').text('사용 가능한 이름입니다.');
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
	});
	
	$('#cateSubmit').click(function(){
		var $cateName = $('#cateResist input[name=cateName]');
		if(cateCheck==true){
			
			if($cateName.val()==''){
				alert("아이디를 입력해 주세요");
				$cateName.focus();
			}else{
				$.ajax({
					type:'GET',
					url:'itemCateResist.do',
					data:{'cateName':$cateName.val()},
					dataType:'JSON',
					success:function(data){
						if(data.result==1){
							alert('등록 완료 \n카테고리 조회 페이지로 이동합니다.')
							location.replace('itemCateList.go')
						}else{
							alert('등록을 시도했으나 실패했습니다.\n중복된 ID이거나 서버 문제일 수 있습니다. 이름을 바꿔 다시 시도해 주세요 \n페이지를 새로고침 합니다.')
							location.reload();
						}
					},
					error:function(e){
						console.log(e)
					}
				});
			}
			
		}else{
			alert("중복 검사를 해 주세요");
		}
	})
	
</script>
</html>