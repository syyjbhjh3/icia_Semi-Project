<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" ><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" >
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<title>http://www.blueb.co.kr</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		 <meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/* ---------------------- Blueslate nav ---------------------- */
.blue #slatenav{position:relative;display:block;height:42px;font-size:11px;font-weight:bold;background:transparent url(blueslate_background.gif) repeat-x top left;font-family:Arial,Verdana,Helvitica,sans-serif;text-transform:uppercase;}
.blue #slatenav ul{margin:0px;padding:0;list-style-type:none;width:auto;}
.blue #slatenav ul li{display:block;float:left;margin:0 1px 0 0;}
.blue #slatenav ul li a{display:block;float:left;color:#D5F1FF;text-decoration:none;padding:14px 56px 0 57px;height:28px;}
.blue #slatenav ul li a:hover,.blue #slatenav ul li a.current{color:#fff;background:transparent url(blueslate_backgroundOVER.gif) no-repeat top center;}
/* ---------------------- END Blueslate nav ---------------------- */
.blue{
	position: absolute;
	top:690px;
	width : 412px;
	margin-left: -8px;
}
</style>
</head>
<body>

	
	<div class="blue">
	<div id="slatenav" style="width:100%;">
	<ul>
	<li id="one"><a href="seelistidx?user_id=${sessionScope.loginId }" title="css menus">일별</a></li>
	<li id="two" ><a href="monthpay.jsp" title="css menus" class="current">월별</a></li>
	<li id="three"><a href="categorylist" title="css menus">분야별</a></li>

	</ul>
	</div>
	</div>
	</body>
</html>