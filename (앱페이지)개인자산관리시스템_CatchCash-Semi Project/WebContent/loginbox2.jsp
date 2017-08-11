<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			#idtext{
				display: none;
			}
		</style>
	</head>
	<body>
		<input id="idtext" type="text" name="userId" value="${sessionScope.loginId}"/>
	</body>
	<script>
	var id="${sessionScope.loginId}";
	</script>
</html>