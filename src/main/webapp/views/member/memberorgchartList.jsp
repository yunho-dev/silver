<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>은빛 우산</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/tree.css">
    <link rel="stylesheet" href="assets/css/Treant.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="assets/vendor/raphael.js"></script>
    <script src="assets/js/Treant.js"></script>
<style>

</style>
</head>
<body>
 <div id="app">
      <jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
   <div class="page-heading">
       <h3>조직도</h3>
   </div>
   <div class="card" style="width: 100%; height: 100%;">    
    <div class="chart" id="tree" style="width: auto;height: auto;">
    </div>
   </div>  
</div>
</div>
<script>

 $.ajax({
	type:'GET',
	url:'memberOrgChartCall',
	dataType:'JSON',
	success:function(data){
		drawChart(data.memberOrgChartCall);
	},
	error:function(e){
		console.log(e);
	}
});
var total = {};
total.config = {
	container : '#tree',
	connectors:{
		type:'step'
	},
	node:{//하나의 사람마다 주워질 클래스
		HTMLclass:'nodeExample'
	}
};
function drawChart(list){
	list.forEach(function(item){
		var obj = {};
		 if (item.stack == 'true') {
			obj.stackChildren = true;
		}
		obj.text = {};
		obj.text.name = item.mem_name;
		obj.text.phone =item.mem_pnum;
		obj.text.dept = item.dept_name;
		//console.log(item.pos_level);
		if(item.pos_level > 1){//부모가 있을 경우
			if(item.pos_level == 2){
			obj.parent = total['진양철'];		
			}
			if(item.pos_level == 3){
				obj.parent = total['진도준'];		
			}
			if(item.pos_level == 4 && item.dept_num == 1){
					obj.parent = total['진영기'];	
			}
			if(item.pos_level == 4 && item.dept_num == 2){
				obj.parent = total['진동기'];	
			}
			if(item.pos_level == 4 && item.dept_num == 3){
				obj.parent = total['진화영'];	
			}
			if(item.pos_level == 4 && item.dept_num == 4){
				obj.parent = total['진윤기'];	
			}
			if(item.pos_level == 5 && item.dept_num == 1){
					obj.parent = total['윤현우'];	
			}
			if(item.pos_level == 5 && item.dept_num == 2){
				obj.parent = total['오세현'];	
			}
			if(item.pos_level == 5 && item.dept_num == 3){
				obj.parent = total['이항재'];	
			}
			if(item.pos_level == 5 && item.dept_num == 4){
				obj.parent = total['손정래'];	
			}
		}		
		total[item.mem_name] = obj;	
	});
		new Treant(Object.values(total));
} 
</script>
</html>