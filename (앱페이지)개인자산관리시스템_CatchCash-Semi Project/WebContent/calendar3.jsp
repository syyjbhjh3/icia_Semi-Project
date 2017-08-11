<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel='stylesheet' type='text/css' href='http://arshaw.com/css/fullcalendar.css?3' />
<link href='http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
<link rel='stylesheet' type='text/css' href='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.css' />
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-ui-1.10.3.custom.min.js'></script>
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.min.js'></script>
<style>
	
	body {
	margin: 0;
	}
	
.clear {
	clear: both;
	}
	
.alignleft {
	float: left;
	}
	
img.alignleft {
	margin-right: 1em;
	}
	
.alignright {
	float: right;
	}
	
img.alignright {
	margin-left: 1em;
	}
	
a {
	color: #710000;
	}
	
a img {
	border: 0;
	}
	
body img.framed {
	padding: 1px;
	background: #888;
	border: 5px solid #ddd;
	}
	
sup.new {
	color: red;
	}
	
.indent {
	margin: 1em 3em;
	}
	
	
	
	
	
	
	
#top {
	background: url(../images/container_top_wider.gif) repeat-x;
	height: 108px;
	position: relative;
	z-index: 1;
	min-width: 950px;
	}
	
#top h1 {
	margin: 0 0 0 20px;
	height: 64px;
	line-height: 64px;
	font-weight: normal;
	font-size: 26px;
	color: #fff;
	}
	
#top h1 a {
	text-decoration: none;
	color: #fff;
	}

#top h2 {
	position: absolute;
	bottom: 10px;
	left: 842px;
	margin: 0;
	font-size: 14px;
	}
	
#top h2 a {
	text-decoration: none;
	color: #fff;
	}
	
#top h2 a:hover {
	text-decoration: underline;
	}
	
	
	
	
#container {
	position: relative;
	z-index: 2;
	width: 810px;
	margin-top: -47px;
	background: #fff url(../images/container_right.gif) repeat-y top right;
	}
	
#container1 {
	background: url(../images/container_top_wider.gif) no-repeat 0 -108px;
	}

#container2 {
	background: url(../images/container_bottom_wider.gif) no-repeat bottom left;
	padding: 3px 4px 5px 0;
	position: relative;
	}
	
	
	
	
#subnav {
	margin: 10px 20px 0;
	border-bottom: 1px solid #E4E4E4;
	position: relative;
	}
	
#subnav ul {
	margin: 0;
	padding: 0;
	height: 34px;
	list-style: none;
	}
	
#subnav li {
	float: left;
	}
	
#subnav li a {
	float: left;
	margin-right: 20px;
	height: 34px;
	line-height: 34px;
	text-decoration: none;
	color: #666;
	}
	
#subnav li a:hover {
	border-bottom: 1px solid #BD2504;
	}
	
#subnav li a:active {
	border-bottom: 1px solid red;
	}
	
#subnav li.selected a {
	border-bottom: 1px solid #7E392E;
	}
	
	
	
	
	
#content {
	margin: 20px 0 0; /*30px;*/
	padding: 0 20px;
	}
	
#content p, #content dd {
	line-height: 150%;
	}
	
	
	
	
#side {
	position: absolute;
	top: 108px;
	left: 842px;
	width: 180px;
	}
	
#nav {
	color: #5D5454;
	}
	
#nav ul {
	margin: 0;
	padding: 0;
	list-style: none;
	}
	
#nav li {
	margin: 15px 0;
	}
	
#nav li a {
	color: #5D5454;
	text-decoration: none;
	}
	
#nav li a:hover {
	text-decoration: underline;
	}
	
#nav h2 {
	font-size: 14px;
	margin: 30px 0 10px;
	}
	
	
	
#footer {
	font-size: 12px;
	color: #948F7F;
	width: 730px;
	padding: 8px 9px 30px;
	}
	
#footer a {
	color: #948F7F;
	}
	
	
	
	
/* homepage */
	
#homepage .section {
	margin: 42px 0;
	}
	
#homepage .section p {
	margin: .5em 0;
	}
	
	
	
	
	
/* about */

#about img {
	margin-top: 7px;
	}

#about .text {
	float: right;
	width: 550px;
	}
	
#about ul {
	list-style: none;
	margin: 2em 0 1em;
	padding: 0;
	}
	
#about li {
	margin: 2.5em 0 0;
	padding: 0;
	}
	
#about li p {
	font-size: 11px;
	color: #666;
	margin-top: .5em;
	}




/* projects */

#projects ul {
	margin: 2em 0;
	padding: 0 0 0 2em;
	}

#projects li {
	margin: 1em 0;
	padding: 0;
	}
	
	


/* portfolio */	

#portfolio {
	margin-bottom: 0;
	}
	
#portfolio .project {
	margin: 22px 0 40px;
	float: left;
	width: 100%;
	}
	
#portfolio .project .screenshots {
	float: left;
	background: #ddd;
	padding: 5px 0 5px 5px;
	}
	
#portfolio .project .screenshots img {
	float: left;
	border: 1px solid #888;
	margin-right: 5px;
	}
	
#portfolio .project .credits {
	font-size: 11px;
	color: #777;
	}
	
#portfolio .project .credits a {
	color: #777;
	}
	
#portfolio .subproject {
	float: left;
	margin-right: 20px;
	}
	
#portfolio .subproject a {
	display: block;
	margin-bottom: .5em;
	}
	
#portfolio .subproject .screenshots {
	margin-bottom: 0;
	}
	
#portfolio div.alignleft {
	float: left;
	width: 325px;
	}
	
#portfolio div.alignright {
	float: right;
	width: 340px;
	}
	
#portfolio h2 {
	clear: both;
	margin: 0 0 40px;
	font-size: 18px;
	font-weight: normal;
	color: #666;
	border-bottom: 1px solid #E4E4E4;
	}
	
	
/* docs */
	
#toc {
	float: left;
	border: 1px solid #ccc;
	background: #F8F8F8;
	padding: 1em;
	}
	
#toc h1 {
	font-size: 1.5em;
	margin-top: 0;
	}
	
#toc ul {
	margin: 0;
	padding: 0;
	}
	
#toc li {
	margin: .5em 0;
	padding: 0;
	list-style-position: inside;
	}
	
	
/* for webhostingsearch */

.last-p {
	text-align:right;
	position:relative;
	top:30px;
	left:20px;
	margin:0;
	font-size:12px;
	}
	
	
	
#downloads-table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 450px;
	}
	
#downloads-table td,
#downloads-table th {
	text-align: left;
	border: 1px solid #E4E4E4;
	padding: 7px 10px;
	}
	
#downloads-table th {
	background: #eee;
	border-color: #ddd;
	}

	
	th{
		display : none;
	}
	#subject{
		font-family : 'Josefin Sans', sans-serif;
		font-size : 40px;
		margin-left : 20%;
	}
	#enter{
		font-family : 'Josefin Sans', sans-serif;
		font-size : 20px;
	}
	#calendar{
				margin-top: 12%;
	}
	#list{
		font-size : 12px;
		margin-left : 25%;
	}
</style>
</head>
<body style="background-color:white;">
	<jsp:include page="aftercalendar.jsp"/><br/><br/><br/>
	
	<form action = "calwrite" method = "get">
	<div id='calendar' style='width: 410px; font-size: 10px'></div>
	<br/>
	<span id="subject">Schedule Regist</span><br/>
	<span id="enter">Date: <input type="text" name="startdate"  placeholder="2016-01-01" size="10"/>
	Content: <input type="text" name="content" style="width: 120px;"/>
	<input type="submit" value="작성"/><span>
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