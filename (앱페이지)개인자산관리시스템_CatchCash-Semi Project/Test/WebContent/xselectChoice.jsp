<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String chat = "\t다른영역가져오기"; %>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>프로젝트</title>
		<style>	</style>
	</head>
	<body>
		<form action="selectform.jsp" method="post">
		    <input type="date" name="date1"/>
		  	<input type="date" name="date2"/>
		  	<input type="month" name="month1"/>
		  	<input type="submit" value="등록"/>
		  	<br/>
		  	구분 :
            <select name="분류">
	            <option value="식비" selected>식비</option>
	            <option value="회비">회비</option>
	            <option value="교통">교통</option>
	            <option value="문화">문화</option>
            </select>
            <br/>
            <input type="radio" name="gender" value="in" checked>수입
            <input type="radio" name="gender" value="out">지출
            <br/>
            <input type="radio" name="sub" value="bill">현금
            <input type="radio" name="sub" value="card" checked>카드
             <input type="radio" name="sub" value="bank">은행
            <br/>            
            
         <br/><br/>다른영역가져오기.
           		<iframe src="calendar2.jsp"
	      	        width="100%"
	      	        height="100%"
	      	        frameborder="0">
      	        </iframe>
		</form>
		
	</body>
	<script>
		
	</script>
</html>