<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<style type="text/css">
		body{
			position: fixed; 
			width: 100%;
		}
		
		#chart_div{
		float : left;
		margin-bottom : 20%;
		}
		#resist{
			margin-top: 8%;
		}
		td,table{
			border-collapse: collapse;
			text-align: center;
		}
		thead{
			font-size: 15px;
			font-weight: 800;
			color: #ffffff;
			background: #2980b9;
			border: 1px solid #2980b9;
			/*background: #f6f6f6; 전체 매끈한 색깔*/
		}
		tbody td{
			border:1px solid #E6E6E6;
			font-size: 15px;
			background: #FAFAFA;
		}


	
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		
	
		<c:forEach items ="${categorylist}" var="result">
			var food = ${result.foodhab};
			var company = ${result.companyhab};
			var car = ${result.carhab};
			var guitar = ${result.guitarhab };
			var tongsin = ${result.tongsinhab };
			var clothes = ${result.clotheshab };
			var sooib = ${result.sooibhab };
			var moonhwa = ${result.moonhwahab };
	</c:forEach>
	console.log(food);
		
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
				//추가할수록 차트공간 늘어남	
				['Task','asdsa'],
					['식비',food],
					['의류',clothes],
					['교통',car],
					['회비',company],
					['통신',tongsin],
					['문화',moonhwa],
					['기타',guitar],
				]);
			
			var options = {
					title : '분야별 지출현황',
					vAxis: {title: 'Cups'},
					hAxis: {title: 'Month'}, 
					seriesType: 'bars',
					series: {5: {type: 'line'}}
				};
			
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
		
		var arrayOfRolloverClasses = new Array();
		var arrayOfClickClasses = new Array();
		var activeRow = false;
		var activeRowClickArray = new Array();

		function highlightTableRow()
		{
			var tableObj = this.parentNode;
			if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;

			if(this!=activeRow){
				this.setAttribute('origCl',this.className);
				this.origCl = this.className;
			}
			this.className = arrayOfRolloverClasses[tableObj.id];
			
			activeRow = this;
			
		}

		function clickOnTableRow()
		{
			var tableObj = this.parentNode;
			if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;		
			
			if(activeRowClickArray[tableObj.id] && this!=activeRowClickArray[tableObj.id]){
				activeRowClickArray[tableObj.id].className='';
			}
			this.className = arrayOfClickClasses[tableObj.id];
			
			activeRowClickArray[tableObj.id] = this;
					
		}

		function resetRowStyle()
		{
			var tableObj = this.parentNode;
			if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;

			if(activeRowClickArray[tableObj.id] && this==activeRowClickArray[tableObj.id]){
				this.className = arrayOfClickClasses[tableObj.id];
				return;	
			}
			
			var origCl = this.getAttribute('origCl');
			if(!origCl)origCl = this.origCl;
			this.className=origCl;
			
		}
			
		function addTableRolloverEffect(tableId,whichClass,whichClassOnClick)
		{
			arrayOfRolloverClasses[tableId] = whichClass;
			arrayOfClickClasses[tableId] = whichClassOnClick;
			
			var tableObj = document.getElementById(tableId);
			}
	</script>
</head>
<body>
	<jsp:include page="aftercalendar.jsp"/><br/><br/>
		<form action ="categorylist" method="get">
			 <input type="month" name="mon" id="resist"/>
			 <input type="submit" value="등록" id="resist"/>
		</form>
		<table style="width: 98.5%; margin-left:-5px;">
			<thead>
		<tr>
			<td>#</td>
			<td>Kind</td>
			<td>Money</td>
		</tr>
	</thead>
		<c:forEach items ="${categorylist}" var="result">
			<tbody>
				<tr>
					<td>1</td>
					<td>식비</td>
					<td>${result.foodhab}원</td>
				</tr>
				<tr>
					<td>2</td>
					<td>회비</td>
					<td>${result.companyhab}원</td>
				</tr>
				<tr >
					<td>3</td>
					<td>교통</td>
					<td>${result.carhab}원</td>
				</tr>
				<tr>
					<td>4</td>
					<td>기타</td>
					<td>${result.guitarhab }원</td>
				</tr>
				<tr >
					<td>5</td>
					<td>통신</td>
					<td>${result.tongsinhab }원</td>
				</tr>
				<tr >
					<td>6</td>
					<td>의류</td>
					<td>${result.clotheshab }원</td>
				</tr>
				<tr >
					<td>7</td>
					<td>문화</td>
					<td>${result.moonhwahab }원</td>
				</tr>
			</tbody>
		</c:forEach>
		</table>
		<div id="chart_div" style=" position:absolute; z-index: -1;width:500px; height: 380px; margin-left:-40px; margin-top: -25px; margin-bottom: 30%;"></div>
		<jsp:include page="menu4.jsp"></jsp:include>
</body>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	addTableRolloverEffect('myTable','tableRollOverEffect1','tableRowClickEffect1');
</script>
<script>

</script>
</html>