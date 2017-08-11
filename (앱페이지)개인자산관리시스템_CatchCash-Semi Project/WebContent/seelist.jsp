<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		 <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>프로젝트</title>
		<style rel="stylesheet">

body {
}
td,table{
		border-collapse: collapse;
		text-align: center;
	}
thead{
	font-size: 14px;
	font-weight: 800;
	color: #ffffff;
	background: #2980b9;
	border: 1px solid #2980b9;
	/*background: #f6f6f6; 전체 매끈한 색깔*/
}
tbody td{
	border:1px solid #E6E6E6;
	font-size: 14px;
	background: #FAFAFA;
}


</style>
	</head>
	<body>
		<jsp:include page="aftercalendar.jsp"/><br/><br/><br/>
		 <b><p>Selected Days : ${reg}</p></b>
		<div id="search">
		<form action="seelist" method="get">
			<select name="reg_date">
				<c:forEach items="${reglist}" var="reglist">
					<option value="${reglist}">${reglist}</option>
				</c:forEach>
			</select>
			<input type="hidden" name="user_id" value="${sessionScope.loginId}"/>
			<input type="submit" value="검색" class="button"/>
		</form>
		</div>
				<table style="width:100%;">
					<thead>
				      <tr class="cell" >
				        <th >Part</th>
				        <th >Kind</th>
				        <th >Money</th>
				        <th >Content</th> 
				      </tr>
				      </thead>
				      <tbody>
					<c:forEach items="${list}" var="list">
						      <tr class="cell2">
						      	<td >${list.part}</td>
						     	<td >${list.kind }</td>						      
						       	<td>${list.money}원</td>
						        <td >${list.content}</td>
						     </tr>
					</c:forEach>
					</tbody>
					</table>
			<jsp:include page="menu2.jsp"></jsp:include>
		</body>
	<script>
	</script>
</html>