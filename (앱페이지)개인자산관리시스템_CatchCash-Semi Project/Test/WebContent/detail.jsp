<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <script src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <style>
        	p.content {
			    border-collapse: separate;
			    border-spacing: 1px;
			    text-align: left;
			    line-height: 1.5;
			    border-top: 1px solid #ccc;
			  	margin : 30px 10px;
			  	padding: 20px 1px 250px 20px;
			}
			p.line {
			    border-collapse: separate;
			    border-spacing: 1px;
			    text-align: left;
			    line-height: 1.5;
			    border-top: 1px solid #ccc;
			  	margin : 30px 10px;
			  	padding: 20px 1px 1px 20px;
			}
			h3{
				margin-top: 70px;
			}
			input[type='text']{
                width: 70%;
            }
            div{
            	float: left;
            	display: inline;
            }
            
        </style>
    </head>
    <body>
    	<h2>정보 나눔 게시판</h2>
    	<h3>${dto.subject }</h3>
    	<p>${dto.user_id }</p>
    	<p>${dto.date } / 조회수 ${dto.bhit }</p>
    	<p class="content">${dto.content }</p>
    	
    	<div>
    		<form action="modify.jsp" method="post">
	    		<input type="hidden" name="subject" value="${dto.subject }"/>
	    		<input type="hidden" name="content" value="${dto.content }"/>
	    		<input type="hidden" name="bbsno" value="${dto.bbsno }"/>
	    		<input id="modify" type="submit" value="수정"/>
	    	</form>
    	</div>
    	<div>
    		<button onclick="location.href='delete?bbsno=${dto.bbsno}'">삭제</button>
    	</div>
    	<div>
    		<button onclick="location.href='board'">목록보기</button>
    	</div>
    	<br/>
    	<p class="line"></p>
    	
    	<form action="commentwrite" method="get">
    		<input type="submit" value="댓글 달기"/>
    		<input type="text" name="comments"/>
    		<input type="hidden" name="bbsno" value="${dto.bbsno}"/>
    		<input type="hidden" name="user_id" value="${sessionScope.loginId }"/>
    	</form>
    	<c:forEach items="${commentlist }" var="list">
    		<p>${list.user_id }</p>
    		<P>${list.comments }</P>
    		<p class="line"></p>
    	</c:forEach>
    </body>
    <script>
    	<%--if(${sessionScope.loginId} == ${dto.user_id}){
    		$("#modify").attr("type", "button");
    	}--%>
    	var msg = "${msg}";
    	if(msg != ""){
    		alert(msg);
    	}
    </script>
</html>