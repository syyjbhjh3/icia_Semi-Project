<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			#login{
				border:none;
				border-right:0px; 
				border-top:0px; 
				boder-left:0px;
				boder-bottom:0px;
				margin-top : -5%;
			}
			#idtext{
				display: none;
			}
		</style>
	</head>
	<body>
		<div id=login></div>
		<input id="idtext" type="text" name="userId" value="${sessionScope.loginId}"/>
	</body>
	<script>
	var id="${sessionScope.loginId}";
	if(id == ""){
		location.href="index.jsp";
	}else{
		//alert(id+"님~ 환영합니다.");
		var content=id+" 님  <button onclick='logout()'>로그아웃</button>";
		$("#login").html(content);
	}
	function logout(){
		location.href="logout";
	}
	
	
	
	
	</script>
</html>