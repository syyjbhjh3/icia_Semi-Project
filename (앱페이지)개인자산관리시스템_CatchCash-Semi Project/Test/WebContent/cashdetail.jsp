<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			table,td{
				border: 1px solid black;
			}
		</style>
	</head>
	<body>
		<form action="cashupdate" method="post">
		<jsp:include page="loginbox2.jsp"/>
		<div style="width:65%; height:44.5%; overflow:auto;">
       		<table style="width:100%;">
       				<tr>
       					<td style="display: none;"><input type="text" name="idx" value="${detail.idx }"/></td>
	       		 		<td style="width: 30%;">구분 : <input style="width: 50%;" type="text" name="part" value="${detail.part }" /></td>
	       		 		<td style="width: 30%; text-align: right;">결제수단 : <input type="text" style="width: 50%;" name="way" value="${detail.way }" /></td>
	       		 		<td style="width: 50%;">금액 : <input type="text" style="width: 50%;" name="money" value="${detail.money}" /></td>
	       		 		<td rowspan="2"><input type="submit" style=" width:100%;" value="가계부수정" ></td>
	       		 	</tr>
	       		 	<tr>
	       		 		<td style="width: 30%;">날짜 : <input type="text" style="width: 50%;" name="reg_date"value="${detail.reg_date }" /></td>
	       		 		<td style="width: 30%; text-align: right;">항목 : <input type="text" style="width: 50%;" name="kind" value="${detail.kind }" /></td>
	       		 		<td>내용 : <input type="text" style="width: 50%;" name="content" value="${detail.content }" /></td>
	       		 	</tr>
	       	</table>
	       	</div>
	       	</form>
	</body>
	<script>
	</script>
</html>