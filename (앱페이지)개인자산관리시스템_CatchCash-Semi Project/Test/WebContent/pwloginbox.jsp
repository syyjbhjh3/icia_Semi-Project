<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			#pwlogin{
				display: none;
			}
		</style>
	</head>
	<body>
		<input id="pwlogin" type="text" name="userId" value="${sessionScope.id}"/>
	</body>
	<script>
	var id="${sessionScope.id}";
	
	</script>
</html>