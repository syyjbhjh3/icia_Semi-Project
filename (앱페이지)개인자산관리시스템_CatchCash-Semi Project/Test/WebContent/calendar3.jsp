<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel='stylesheet' type='text/css' href='http://arshaw.com/css/main.css?6' />
<link rel='stylesheet' type='text/css' href='http://arshaw.com/css/fullcalendar.css?3' />
<link href='http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
<link rel='stylesheet' type='text/css' href='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.css' />
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-ui-1.10.3.custom.min.js'></script>
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.min.js'></script>
<style>
	th{
		display : none;
	}
	#subject{
		font-family : 'Josefin Sans', sans-serif;
		font-size : 90px;
		margin-left:22%;
		
	}
	#enter{
		font-family : 'Josefin Sans', sans-serif;
		font-size : 40px;
		margin : 0 0 0 15;
		margin-left: 25%;
		
	}
	#calendar{
				margin-top: 7%;
        		
	}
	#list{
		font-size : 30px;
		   		margin-left: 23%;
		
	}
</style>
</head>
<body style="background-color:white;">
	<jsp:include page="aftercalendar.jsp"/><br/><br/>
	
	<form action = "calwrite" method = "get">
	<div id='calendar' style='width: 970px; font-size: 25px'></div>
	<br/>
	<span id="subject">Schedule Regist</span><br/>
	<span id="enter">Date :<input type="text" name="startdate" size="7" placeholder="1999-01-01"/>
	Content :<input type="text" name="content" size="7"/>
	<input type="submit" value="submit"/><span>
	</form>
	<table id="list">
		<c:forEach items="${list}" var="item1">
			<tr>
				<th>${item1.calrendarno }</th>
				<td>${item1.startdate }</td>				
				<td>${item1.title }</td>
				<td><input type="button" value="삭제"
						onclick="location.href='caldelete?calrendarno=${item1.calrendarno}'"/></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script type='text/javascript'>
	$(document).ready(function() {
		var list1 = new Array();
		
		if("${list}"!=null){
			
			<c:forEach items="${list}" var="item1">
				var obj = new Object();
				obj.title = "${item1.title}";
				obj.start = "${item1.startdate}";
				list1.push(obj);
			</c:forEach>
			console.log(list1);	
		}

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			editable : true,
			  events: list1
	           
		});

		

	});
	
</script>
</html>