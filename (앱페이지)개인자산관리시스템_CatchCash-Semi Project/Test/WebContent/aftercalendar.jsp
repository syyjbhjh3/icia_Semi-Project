<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="kr" id="html">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>menu bar example</title>
	<style>
		h1{
			font-size : 35px;
			margin-bottom : 70px;
		}
		html .opened { 
			overflow: hidden;
		}
		
		header {
			margin: 0;
			padding: 0;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 70px;
			background: #006AF4;
			-webkit-transition: 0.3s;
			        transition: 0.3s;
			z-index: 900;
			box-shadow: 4px 4px 12px 1.2px rgba(0, 0, 0, 0.2); 
			}
		
		header .drawer-toggle {
			position: fixed;
		  	top: 0;
		  	left: 0;
		  	width: 56px;
		  	height: 56px;
		  	line-height: 56px;
		  	text-align: center;
		  	font-size: 25px;
		  	color: #FFFFFF;
		  	text-shadow: rgba(0, 0, 0, 0.3) 1px 1px 2px, rgba(0, 0, 0, 0.3) 0 0 10px;
		}
		
		header a, header a:hover, header a:focus {
			text-decoration: none;
			color: #FFFFFF;
		}
		header h3 {
			position: absolute;
			top: 0;
			left: 80px;
			margin: 0;
			line-height: 56px;
			font-size: 22px;
		}
		
		#drawer {
			width: 220px;
			height: 100%;
			position: fixed;
			top: 0;
			left: -280px;
			background: #EEEEEE;
			z-index: 1050;
			-webkit-transition: .3s;
			      transition: .3s;
			overflow: hidden;
			background-color : #006AF4;
		}

		#drawer.opened {
			left: 0;
			box-shadow: 5px 5px 15px 1.5px rgba(0, 0, 0, 0.2);
			display: block;
		}

		
		#blocker {
			display: none;
			background: rgba(0, 0, 0, 0.2);
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			z-index: 999;
		}
		#blocker.opened {
			display: block;
		}
		#ssibal{
			margin-left : 70px;
			font-size : 50px;
							
		}
		.sidebar-nav {
  list-style: none;
  margin: 0;
  padding: 0;
  position: absolute;
  top: 0;
  width: 220px;
}

.sidebar-nav li {
  display: inline-block;
  line-height: 20px;
  position: relative;
  width: 100%;
}

.sidebar-nav li:before {
  -moz-transition: width 0.2s ease-in;
  -ms-transition: width 0.2s ease-in;
  -webkit-transition: width 0.2s ease-in;
  content: '';
  height: 100%;
  left: 0;
  position: absolute;
  top: 0;
  -webkit-transition: width 0.2s ease-in;
  transition: width 0.2s ease-in;
  width: 3px;
  z-index: -1;
}

.sidebar-nav li:first-child a {
  background-color: #1a1a1a;
  color: #ffffff;
}

.sidebar-nav li:nth-child(2):before { background-color: #52418a; }

.sidebar-nav li:nth-child(3):before { background-color: #5c499c; }

.sidebar-nav li:nth-child(4):before { background-color: #6651ad; }

.sidebar-nav li:nth-child(5):before { background-color: #7562b5; }

.sidebar-nav li:nth-child(6):before { background-color: #8473be; }

.sidebar-nav li:nth-child(7):before { background-color: #9485c6; }

.sidebar-nav li:nth-child(8):before { background-color: #a396ce; }

.sidebar-nav li:nth-child(9):before { background-color: #b2a7d6; }

.sidebar-nav li:hover:before {
  -webkit-transition: width 0.2s ease-in;
  transition: width 0.2s ease-in;
  width: 100%;
}

.sidebar-nav li a {
  color: #dddddd;
  display: block;
  padding: 10px 15px 10px 30px;
  text-decoration: none;
}

.sidebar-nav li.open:hover before {
  -webkit-transition: width 0.2s ease-in;
  transition: width 0.2s ease-in;
  width: 100%;
}



.sidebar-nav li a:hover, .sidebar-nav li a:active, .sidebar-nav li a:focus, .sidebar-nav li.open a:hover, .sidebar-nav li.open a:active, .sidebar-nav li.open a:focus {
  background-color: transparent;
  color: #ffffff;
  text-decoration: none;
}

.sidebar-nav > .sidebar-brand {
  font-size: 20px;
  height: 65px;
  line-height: 44px;
}

</style>
</head>
<body>
	
	<header id="header">
		
		<div class="drawer-toggle" onclick="setOpened()"><i class="ic-menu"><img src="menu.png" width="100" height="70"  alt=""></i></div>
		<b id="ssibal"><a href="mainlist">Catch Cash</a></b>
	</header>
	
	<nav id="drawer">
		 <ul class="nav sidebar-nav">
      <li class="sidebar-brand"> <a href="#"> </a> </li>
      <li> <a href="mainlist"><i class="fa fa-fw fa-home"></i> Home</a> </li>
      <li> <a href="calrendar"><i class="fa fa-fw fa-folder"></i> Calrendar</a> </li>
      <li> <a href="tooja.jsp"><i class="fa fa-fw fa-file-o"></i> Search SaveMoney</a> </li>
      <li> <a href='seelistidx?user_id=${sessionScope.loginId }'><i class="fa fa-fw fa-cog"></i> Super Info</a> </li>
      <li> <a href="board"><i class="fa fa-fw fa-cog"></i> Free Board</a> </li>
      </ul>
	</nav>
	<div id="blocker" onclick="removeOpened()"></div>
	<script>
		
		function setOpened() {
			var html = document.getElementById("html");
			var drawer = document.getElementById("drawer");
			var blocker = document.getElementById("blocker");
			html.classList.add("opened");
			drawer.classList.add("opened");
			blocker.classList.add("opened");
		}
		function removeOpened() {
			if(location.hash != "#drawer"){
				var html = document.getElementById("html");
				var drawer = document.getElementById("drawer");
				var blocker = document.getElementById("blocker");
				html.classList.remove("opened");
				drawer.classList.remove("opened");
				blocker.classList.remove("opened");
			}
		}
	</script>
</body>
</html>