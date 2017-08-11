<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%String id= request.getParameter("date1");
String pw = request.getParameter("date2");

String month1 = request.getParameter("month1");
String foodbill = request.getParameter("분류");
String gender = request.getParameter("gender");
String sub = request.getParameter("sub");
System.out.println(id+"/"+pw+"/"+month1);
System.out.println(foodbill+"/"+gender+"/"+sub);%>-->
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style></style>
	</head>
	<body>
		
	</body>
	<script>
		//적용안됨.
		String id= request.getParameter("date1");
		String pw = request.getParameter("date2");
		String zx = request.getParameter("date3");
		String foodbill = request.getParameter("식비");
		String gender = request.gerParameter("gender");
		String sub = request.getParameter("sub");
		System.out.println(id+"/"+pw+"/"+zx);
		System.out.println(foodbill+"/"+gender+"/"+sub);
		
	</script>
</html>