<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
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
<div class="chart" id="tree">
</div>  
  

</div>
</div>
<script>

$.ajax({
	type:'GET',
	url:'memberOrgChartCall',
	dataType:'JSON',
	success:function(data){
		//onsole.log(data.list);
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
//console.log('0');
function drawChart(list){
	//console.log(list);
	//console.log('find:'',result);
	list.forEach(function(item){
		//console.log(item);
		var obj = {};
		//obj = {parent:'value'}
		//obj.parent = 'value'
		//obj['parent']='value'<-변수에 담긴 값을 객체의 속성명으로 사용 하고 싶을 경우
		
		//console.log('1');
		 if (item.stack == 'true') {
			obj.stackChildren = true;
		}
		//console.log('2');
		
		obj.text = {};
		obj.text.name = item.mem_name;
		obj.text.phone =item.mem_pnum;
		obj.text.dept = item.dept_name;
		obj.text.title = item.pos_level;
		
		//console.log('3');
		//1.DB 에 level 을 줘서 level 을 기준으로 order by 해 오는 방법
		//2.첫 반복문에서 parent 정보를 넣지 않고, 다시 한번 반복문을 돌려 그때 넣는 방법
		//3.현재 부모 객체가 없으면 list 에서 찾아와 넣는 방법
		if(item.parent_id = null){//부모가 있을 경우
			obj.parent = total[item.parent_id];	
			
		}		
		total[item.id] = obj		
	});
	//console.log('7');
	//obj ==> array
	
		//console.log(total);
		new Treant(Object.values(total));
}

</script>
</html>