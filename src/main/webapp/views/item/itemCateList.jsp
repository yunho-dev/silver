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
                        <h4 class="card-title">카테고리 조회</h4>
                        <p>사용량이 많은 카테고리 순으로 정렬되어 보여집니다<br>원하는 카테고리를 클릭해 주세요</p>
                    </div>
			       <div class="card-header" style="background-color: #adb5bd; font-weight: bold; font-size: large;">
			           카테고리 이름 : <input type="text" name="thCate" class="filter"> &nbsp;&nbsp;
			           <button class="btn btn-secondary" onclick="search($(this))">검색</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary ml-1" id="cateRegist">
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
                                <tbody>
                                    <c:if test="${list.size()<1}">
										<tr><td colspan="3">등록된 카테고리가 없습니다</td></tr>
									</c:if>
									<c:forEach items="${list}" var="cate">
										<tr >
											<td style="display: none;" class="cateIdx">${cate.it_idx}</td>
											<td onclick="cateRow($(this))" class="cateName" style="cursor: pointer;">${cate.it_name}<input type="hidden" value="${cate.it_name}"/></td>
											<td onclick="cateRow($(this))" style="cursor: pointer;">${cate.cnt}</td>
											<td><a href="#" class="btn btn-sm btn-primary" onclick="cateModify($(this))">수정</a></td>
											<%-- ${cate.it_idx} --%>
										</tr>
									</c:forEach>
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
	function cateRow(cateRow){
		var itIdx = cateRow.closest('tr').find('.cateIdx').text();
		var itName = cateRow.closest('tr').find('.cateName').text();
		console.log(opener)
		opener.choiceCate(itIdx, itName);
		window.close()
	}
	
	function cateModify(ModifyBtn){
		itIdx = ModifyBtn.closest('tr').find('.cateIdx').text()
		if(itIdx!=null || itIdx!=''){
			alert('수정하시겠습니까?');
		}
	}
</script>
</html>