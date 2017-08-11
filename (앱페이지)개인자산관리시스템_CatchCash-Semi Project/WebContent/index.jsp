<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

  <head>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
      
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Insert title here</title>
      <link rel="stylesheet" type="text/css" href="demo.css" />
      <link rel="stylesheet" type="text/css" href="backgroundTransition.css" />
      <style>
      	h2{
      		margin-top:20%;
      		font-size: 100px;
      		text-align: center;
      	}
      	p{
      		margin-top:-8%;
      		font-size: 50px;
      		text-align: center;
      	}
      	table{
      		margin-top:-3%;
      		text-align: center;
        	margin-left: 17%;
        }
     	/* @import url(http://weloveiconfonts.com/api/?family=fontawesome);
		@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700); */
		[class*="fontawesome-"]:before {
		  font-family: 'FontAwesome', sans-serif;
		}
		* {
		  box-sizing: border-box;
		}
		
		html {
		  height: 100%;
		}
		
		body {
		  background-color: #2c3338;
		  color: #606468;
		  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
		  margin: 0;
		  min-height: 100%;
		}
		
		a {
		  color: #000000;
		  outline: 0;
		  text-decoration: none;
		}
		a:focus, a:hover {
		  text-decoration: underline;
		}
		
		input {
		  border: 0;
		  color: white;
		  font: inherit;
		  margin: 0;
		  outline: 0;
		  padding: 0;
		  -webkit-transition: background-color .3s;
		          transition: background-color .3s;
		}
		
		.site__container {
		  -webkit-box-flex: 1;
		  -webkit-flex: 1;
		      -ms-flex: 1;
		          flex: 1;
		  padding: 3rem 0;
		}
		
		.form input[type="password"], .form input[type="text"], .form input[type="submit"] {
		  width: 100%;
		}
		.form--login {
		  color: #606468;
		}
		.form--login label,
		.form--login input[type="text"],
		.form--login input[type="password"],
		.form--login input[type="submit"] {
		  border-radius: 0.25rem;
		  padding: 1rem;
		}
		.form--login label {
		  background-color: #363b41;
		  border-bottom-right-radius: 0;
		  border-top-right-radius: 0;
		  padding-left: 1.25rem;
		  padding-right: 1.25rem;
		}
		.form--login input[type="text"], .form--login input[type="password"] {
		  background-color: #3b4148;
		  border-bottom-left-radius: 0;
		  border-top-left-radius: 0;
		}
		.form--login input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
		  background-color: #434A52;
		}
		.form--login input[type="submit"] {
		  background-color: #ea4c88;
		  color: #eee;
		  font-weight: bold;
		  text-transform: uppercase;
		}
		.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
		  background-color: #d44179;
		}
		.form__field {
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  margin-bottom: 1rem;
		}
		.form__input {
		  -webkit-box-flex: 1;
		  -webkit-flex: 1;
		      -ms-flex: 1;
		          flex: 1;
		}
		
		.align {
		  -webkit-box-align: center;
		  -webkit-align-items: center;
		      -ms-flex-align: center;
		          align-items: center;
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-orient: horizontal;
		  -webkit-box-direction: normal;
		  -webkit-flex-direction: row;
		      -ms-flex-direction: row;
		          flex-direction: row;
		}
		
		.hidden {
		  border: 0;
		  clip: rect(0 0 0 0);
		  height: 1px;
		  margin: -1px;
		  overflow: hidden;
		  padding: 0;
		  position: absolute;
		  width: 1px;
		}
		
		.text--center {
		  text-align: center;
		}
		
		.grid__container {
		  margin: 0 auto;
		  max-width: 20rem;
		  margin-top : -25%;
		  width: 90%;
		  }
		  #dudwns{
		  	margin-top : 15%;
		  	font-size : 100px;
		  }
		  #qkr{
		  		margin-top : -30%;
		  }
      </style>
  </head>
  <body class="align">
  	<div class="backgroundTransition">
	    <p id="dudwns" style="color: white">C:C</p>
	    <p id="qkr" style="color: white" >[Catch:Cash]</p>
	    <div class="site__container">

    <div class="grid__container">

      <form action="login" method="post" class="form form--login">

        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><font >ID</font><span class="hidden">UserId</span></label>
          <input id="login__username" type="text" class="form__input" name="userId" placeholder="UserId" required>
        </div>
        
        <div class="form__field">
          <label class="fontawesome-lock" for="login__password" style="margin-right: -1%; padding-left: -1%"><font>PW</font><span class="hidden">Password</span></label>
          <input id="login__password" type="password" name="userPw" class="form__input" placeholder="Password" required>
        </div>

        <div class="form__field">
          <input type="submit" value="LogIn">
        </div>
        <div class="form__field">
        <a  style="margin-left:29%; color: white;" href="joinForm.jsp">회원가입</a><a style="margin-left:9%; color: white;" href="findId.jsp">ID,PW찾기</a>
        </div>
      </form>

    </div>

  </div>
  </div>
  <script>
	var mg = "${result}";
	if(mg!=""){
		alert(mg);
	}
	
  </script>
<script src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="backgroundTransition.js"></script>

<script type="text/javascript">

  $(document).ready(function(){
	  $('.backgroundTransition').backgroundTransition({
		  backgrounds:[
			  { src: 'money.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/03.jpg' },//절벽
			  { src: 'http://www.blueb.co.kr/SRC2/_image/06.jpg' }, //들판
			  { src: 'http://www.blueb.co.kr/SRC2/_image/07.jpg' }//배 o
		  ],
		  transitionDelay: 3,
		  animationSpeed: 800
	  });
  });
  
</script>
</body>
</html>