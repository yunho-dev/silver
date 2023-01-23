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
<script src="assets/js/jquery.twbsPagination.js"></script>
</head>
<style>
	.filter{
		width: 30%;
	}
	.thingList{
		cursor: pointer;
	}
</style>
<body>
<!-- Hoverable rows start -->
    <section class="section">
        <div class="row" id="table-hover-row">
            <div class="col-12">
                <div class="card">
                	<div class="card-header" style="padding-bottom: 0px; padding-top: 20px;">
                        <h3 class="card-title">카테고리 조회</h3>
                        <p>사용량이 많은 카테고리 순으로 정렬되어 보여집니다<br>원하는 카테고리를 클릭해 주세요</p>
                    </div>
			       <div class="card-header" style="background-color: #435EBE; font-weight: bold; font-size: large; color: white;">
			           카테고리 이름 : <input type="text" name="thCate" class="filter"> &nbsp;&nbsp;
			           <button class="btn btn-secondary" onclick="search($(this))">검색</button>
						<button type="button" class="btn btn-secondary ml-1" style="margin-left: 50px;" onclick="location.href='itemCateWrite.go'">
							<span class="d-none d-sm-block">등록하기</span>
						</button>
					</div>
                        <!-- table hover -->
                        <div class="table-responsive">
                            <table class="table table-hover mb-0" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th>카테고리 이름</th>
                                        <th>사용 중인 개수</th>
                                        <th>수정</th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                	<!-- 리스트가 들어갈 공간 -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- Hoverable rows end -->
</body>
<script>
	ListCall();
	
	function ListCall(){
		$.ajax({
			type:'GET',
			url:'itemCateList.do',
			data:{},
			dataType:'JSON',
			success:function(data){
				drawList(data.list)
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function drawList(itemList){
		var content='';
		for(var i=0; i<itemList.length;i++){
			content +='<tr>';
			content +='<td style="display: none;" class="cateIdx">'+itemList[i].it_idx+'</td>';
			content +='<td id="cateClick1" onclick="cateRow($(this))" style="cursor: pointer;"><span class="cateName" >'+itemList[i].it_name+'</span><input type="hidden" name="cateNameUp" value="'+itemList[i].it_name+'"/></td>';
			content +='<td id="cateClick2" onclick="cateRow($(this))" style="cursor: pointer;">'+itemList[i].itCnt+'</td>';
			content +='<td><a class="btn btn-sm btn-primary" onclick="cateModify($(this))">수정</a><span id="cancelBtn" style="display: none;">&nbsp;<a href="itemCateList.go" class="btn btn-sm btn-secondary" onclick="location.href='+"itemCateList.go"+'">취소</a></span></td>';
			content +='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);
	}

	function cateRow(cateRow){
		var itIdx = cateRow.closest('tr').find('.cateIdx').text();
		var itName = cateRow.closest('tr').find('.cateName').text();
		opener.choiceCate(itIdx, itName);
		window.close()
	}
	
	function cateModify(modifyBtn){
		modifyBtn.closest('tr').find('#cateClick1').attr('onclick', '');
		modifyBtn.closest('tr').find('#cateClick1').css('cursor', '');
		modifyBtn.closest('tr').find('#cateClick2').attr('onclick', '');
		modifyBtn.closest('tr').find('#cateClick2').css('cursor', '');
		modifyBtn.closest('tr').find('.cateName').hide();
		modifyBtn.closest('tr').find('td input[name=cateNameUp]').attr('type', 'text')
		modifyBtn.text('저장');
		modifyBtn.siblings('#cancelBtn').css('display', 'inline-block');
		modifyBtn.attr('onclick','cateUpdate($(this))');
	}
	
	function cateUpdate(modifyBtn){
		var itIdx = modifyBtn.closest('tr').find('.cateIdx').text()
		var $cateName = modifyBtn.closest('tr').find('td input[name=cateNameUp]')
		if($cateName.val() == ''){
			alert("카테고리 이름을 입력해 주세요")
			$cateName.focus();
		}else{
			$.ajax({
				type:'GET',
				url:'itemCateUpdate.do',
				data:{itIdx:itIdx, cateName:$cateName.val()},
				datatype:'JSON',
				success:function(data){
					if(data.result==1){
						alert('수정 완료')
						location.replace('itemCateList.go')
					}else{
						alert('수정을 시도했으나 실패했습니다.\n중복된 ID이거나 서버 문제일 수 있습니다. \n이름을 바꿔 다시 시도해 주세요')
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	}
	
	function search(searchBtn){
		var itName = searchBtn.siblings('input.filter').val();
		
		$.ajax({
			type:'GET',
			url:'getItemSearch.do',
			data:{itName:itName},
			dataType:'JSON',
			success:function(data){
				drawList(data.list);
			},
			error:function(e){
				console.log(e);
			}
		});
		
	}
</script>
</html>