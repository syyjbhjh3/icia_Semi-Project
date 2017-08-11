<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>프로젝트</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* ---------------------- Blueslate nav ---------------------- */
.blue #slatenav{position:relative;display:block;height:42px;font-size:11px;
							font-weight:bold;background:transparent url(blueslate_background.gif) repeat-x top left;
							font-family:Arial,Verdana,Helvitica,sans-serif;text-transform:uppercase;}
.blue #slatenav ul{margin:0px;padding:0;list-style-type:none;width:auto;}
.blue #slatenav ul li{display:block;float:left;margin:0 1px 0 0;}
.blue #slatenav ul li a{display:block;float:left;color:#D5F1FF;text-decoration:none;padding:14px 22px 0 22px;height:28px;}
.blue #slatenav ul li a:hover,.blue #slatenav ul li a.current{color:#fff;background:transparent url(blueslate_backgroundOVER.gif) no-repeat top center;}
/* ---------------------- END Blueslate nav ---------------------- */
.blue{
	margin-top: 110%;
}
li{
	font-size: 1.5em;
}
</style>
</head>
<body>

	

	<p> </p>
	<div class="blue">
	<div id="slatenav">
	<ul>
	<li><a href="seelistidx?user_id=${sessionScope.loginId }" title="css menus">일별보기</a></li>
	<li><a href="monthpay.jsp" title="css menus" class="current">월별보기</a></li>
	<li><a href="categorylist" title="css menus">분야별 보기</a></li>
	</ul>
	</div>
	</div>
	
	
</body>
</html>