<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">
	<head>
	<script src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<style rel="stylesheet">
		body {
	    	
            margin: 0px;
	    }
	
	    .wrapper {
	        margin: 0 auto;
	        padding: 0px;
	        max-width: 800px;
	    }
	
	    .table {
	        margin: 0 0 40px 0;
	        width: 100%;
	        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	        display: table;
	    }
	    @media screen and (max-width: 580px) {
	        .table {
	            display: block;
	        }
	    }
	
	    .row {
	        display: table-row;
	        background: #f6f6f6;
	    }
	    .row.header {
	        font-weight: 900;
	        color: #ffffff;
	        background: #ea6153;  
	        text-align: center;
	    }
	    .row.green {
	        background: #27ae60;
	    }
	    .row.blue {
	        background: #2980b9;
	    }
	    @media screen and (max-width: 580px) {
	        .row {
	            padding: 8px 0;
	            display: block;
	        }
	    }
	
	    .cell {
	        padding: 6px 12px;
	        display: table-cell;
	    }
	    .bhit {
	        color: darkgray;
	        font-size: 0.8em;
	        padding: 0px 12px;
	    }
	    @media screen and (max-width: 580px) {
	        .cell {
	            padding: 2px 12px;
	            display: block;
	        }
	    }
        #content{
            padding: 0 0 0 12;
            height: 300;
        }
        #subject{
            font-weight: 800;
            font-size: 1.3em;
        }
        #bhit {
	        color: darkgray;
	        font-size: 0.8em;
	        padding: 0px 12px;
	    }
        #board{
            left: 295px;
            top: -35px;
        }
        #delete{
            left: 95px;
            top: 3px;
        }
        #comment{
            width: 100%;
            bottom: 5px;
        }
        #commentbutton{
            left: 0px;
        }
        #modify{
        	top: 25px;
        }
        .seecomment{
            margin: 0px;
        }
        p.line {
            border-collapse: separate;
            border-spacing: 1px;
            text-align: left;
            line-height: 1.5;
            border-top: 1px solid #ccc;
            margin : 10px 10px;
            padding: 0px 1px 1px 20px;   
        }
	    .button {
	        display: inline-block;
	        vertical-align: top;
	        position: relative;
	        overflow: hidden;
	        min-width: 40px;
	        line-height: 20px;
	        padding: 0 24px;
	        font-size: 14px;
	        color: white;
	        text-align: center;
	        text-decoration: none;
	        text-shadow: 0 1px #154c86;
	        background-color: #247edd;
	        background-clip: padding-box;
	        border: 1px solid;
	        border-color: #1c65b2 #18589c #18589c;
	        border-radius: 4px;
	        -webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.4), 0 1px 2px rgba(0, 0, 0, 0.2);
	        box-shadow: inset 0 1px rgba(255, 255, 255, 0.4), 0 1px 2px rgba(0, 0, 0, 0.2);
	        background-image: -webkit-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 50%, rgba(0, 0, 0, 0.12) 51%, rgba(0, 0, 0, 0.04));
	        background-image: -moz-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 50%, rgba(0, 0, 0, 0.12) 51%, rgba(0, 0, 0, 0.04));
	        background-image: -o-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 50%, rgba(0, 0, 0, 0.12) 51%, rgba(0, 0, 0, 0.04));
	        background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 50%, rgba(0, 0, 0, 0.12) 51%, rgba(0, 0, 0, 0.04));
	        left: 10px;
	        top: 5px;
	    }
	    .button:before {
	        content: '';
	        position: absolute;
	        top: -25%;
	        bottom: -25%;
	        left: -20%;
	        right: -20%;
	        border-radius: 50%;
	        background: transparent;
	        -webkit-box-shadow: inset 0 0 38px rgba(255, 255, 255, 0.5);
	        box-shadow: inset 0 0 38px rgba(255, 255, 255, 0.5);
	    }
	    .button:hover {
	        background-color: #1a74d3;
	    }
	    .button:active {
	        color: rgba(255, 255, 255, 0.9);
	        text-shadow: 0 -1px #154c86;
	        background: #1f71c8;
	        border-color: #113f70 #154c86 #1c65b2;
	        -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, 0.4);
	        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, 0.4);
	        background-image: -webkit-linear-gradient(top, #1a5da5, #3a8be0);
	        background-image: -moz-linear-gradient(top, #1a5da5, #3a8be0);
	        background-image: -o-linear-gradient(top, #1a5da5, #3a8be0);
	        background-image: linear-gradient(to bottom, #1a5da5, #3a8be0);
	    }
	    .button:active:before {
	        top: -50%;
	        bottom: -125%;
	        left: -15%;
	        right: -15%;
	        -webkit-box-shadow: inset 0 0 96px rgba(0, 0, 0, 0.2);
	        box-shadow: inset 0 0 96px rgba(0, 0, 0, 0.2);
	    }
	    header .drawer-toggle {
		  	top: 7px;
		}
</style>
</head>
    <body>
    	<jsp:include page="aftercalendar.jsp"/><br/><br/><br/><br/>
        <div class="wrapper">
            <div class="table">
                <div class="row header blue">
                    글 상세보기
                </div>
                <div class="row">
                    <div id="subject" class="cell">
                        ${dto.subject }
                    </div>
                </div>
                <div class="row">
                    <div class="cell">
                        ${dto.user_id }
                    </div>
                    <div class="cell" id="bhit">
                        ${dto.date } / 조회수 ${dto.bhit }
                    </div>
                    <p class="line cell"></p>
                </div>
                <div class="row">
                    <div class="cell" id="content">
                        ${dto.content }
                    </div>
                    <form action="modify.jsp" method="post">
                        <input type="hidden" name="subject" value="${dto.subject }"/>
                        <input type="hidden" name="content" value="${dto.content }"/>
                        <input type="hidden" name="bbsno" value="${dto.bbsno }"/>
                        <input type="hidden" name="userId" value="${dto.user_id }"/>
                        <input class="button" id="modify" type="submit" value="수정"/>
                    </form>
                    <button id="delete" class="button" onclick="location.href='delete?bbsno=${dto.bbsno}'">삭제</button>
                    <p class="line cell"></p>
	                <div class="row">
	                    <div class="cell">
	                        <form action="commentwrite" method="get">
	                            <input id="comment" type="text" name="comments"/>
	                            <input id="commentbutton" class="button" type="submit" value="댓글달기"/>
	                            <input type="hidden" name="bbsno" value="${dto.bbsno}"/>
	                            <input type="hidden" name="user_id" value="${sessionScope.loginId }"/>
	                            <input type="hidden" name="bbsId" value="${dto.user_id }"/>
	                        </form>
	                    </div>    
	                </div>
                </div>
                <c:forEach items="${commentlist }" var="list">
	                <div class="row">
	                    <div class="cell">
	                            ${list.user_id }
	                            <br/>
	                            ${list.comments }
	                    </div>
	                </div>
               	</c:forEach>
            </div>
        </div>
        <button id="board" class="button" onclick="location.href='board'">목록 보기</button>
    </body>
</html>