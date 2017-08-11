<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<style>
		div{
			float : left;
		}
		#chart_div{
			margin-right: 10%;
		}
		td{
			font-size: 50px;
		}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	</script>
</head>
<body>
	<jsp:include page="aftercalendar.jsp"/><br/><br/>
	<div>
	<form action ="categorylist" method="get">
			 <input type="month" name="mon"/>
			 <input type="submit" value="등록"/>
		</form>
		<table>
			<tr>
		<c:forEach items ="${categorylist}" var="result">
			
				<td>식비</td>
				<td>${result.foodhab}</td>
			</tr>
			<tr>
				<td>회비</td>
				<td>${result.companyhab}</td>
			</tr>
			<tr>
				<td>교통</td>
				<td>${result.carhab}</td>
			</tr>
			<tr>
				<td>기타</td>
				<td>${result.guitarhab }</td>
			</tr>
			<tr>
				<td>통신</td>
				<td>${result.tongsinhab }</td>
			</tr>
			<tr>
				<td>의류</td>
				<td>${result.clotheshab }</td>
			</tr>
			<tr>
				<td>문화</td>
				<td>${result.moonhwahab }</td>
			
		</c:forEach>
		</tr>
		</table>
		</div>
		<div id="chart_div" style="width:1500px; height: 1000px;"></div>
		<jsp:include page="menu4.jsp"></jsp:include>
</body>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
</script>
</html>