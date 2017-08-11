<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <script src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="demo.css" />
     	<link rel="stylesheet" type="text/css" href="backgroundTransition.css" />
        <style>
        @import url(http://weloveiconfonts.com/api/?family=fontawesome);
		@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);
		[class*="fontawesome-"]:before {
		h2{
		}
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
		  color: inherit;
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
		
		.form input[type="password"], .form input[type="text"], .form input[type="submit"],.form input[type="button"] {
		  width: 100%;
		}
		.form--login {
		  color: #606468;
		}
		.form--login label,
		.form--login input[type="text"],
		.form--login input[type="password"],
		.form--login input[type="submit"],
		.form--login input[type="button"] {
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
		.form--login input[type="text"],span ,.form--login input[type="password"] {
		  background-color: #3b4148;
		  border-bottom-left-radius: 0;
		  border-top-left-radius: 0;
		}
		.form--login input[type="text"]:focus, span,.form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
		  background-color: #434A52;
		}
		.form--login input[type="submit"],.form--login input[type="button"] {
		  background-color: #ea4c88;
		  color: #eee;
		  font-weight: bold;
		  text-transform: uppercase;
		  margin : 2px;
		}
		.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover, 
		.form--login input[type="button"]:focus, .form--login input[type="button"]:hover{
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
		  margin-top : -7%;
		  width: 90%;
		  }
		  
		  .site__container{
		  margin-top : 10%;
		  }
		  .spanman{
		  	margin-top:5%;
		  	margin-left:30%;
		  }
		  .spanwoman{
		  	margin-top:5%;
		  	margin-left:5%;
		  }
		  .spanfr{
		  	margin-top:5%;
		  	margin-left:5%;
		  }
		  #findidbtn{
		  	background-color : red;
		  }
        
      </style>
  </head>
  <body class="align">

      <div class="backgroundTransition">
          
              <div class="site__container">

    <div class="grid__container">
    
		
        
      <form action="Idfind" method="post" name="frm" class="form form--login">
      	<div style="margin-top:40%;">
		<div class="form__field" style="float:left;width:50%;">
          <input type="button" onclick="location.href='findId.jsp'" id="findidbtn" value="Find ID">
        </div><div class="form__field" >  
          <input type="button" onclick="location.href='findpw.jsp'" value="Find PW">
        </div>
        </div>
        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><font ></font><span class="hidden">Username</span></label>
          <input id="login__username" type="text" class="form__input" name="userName" placeholder="Username" required>
        </div>
        
        <div class="form__field" >
          <label class="fontawesome-user" for="login__username"><font ></font><span class="hidden">UserId</span></label>
          <input id="login__username" type="text" class="form__input" name="email" placeholder="E-Mail" required>
        </div>

        <div class="form__field">
          <label class="fontawesome-lock" for="login__password" style="margin-right: -2%"><span class="hidden">Password</span></label>
          <input id="login__password" type="text" name="birth" class="form__input" placeholder="ex)1995-05-14" required>
        </div>
       
      

        <div class="form__field">
          <input type="submit" value="Check">
        </div>
       
        <div class="form__field">
        </div>
      </form>

    </div>

  </div>
  </div>
    </body>
    <script type="text/javascript" src="backgroundTransition.js"></script>
    <script>
	
	var msg = "${mmg}";
	if(msg!=""){
		alert(msg);
	}
    $('.backgroundTransition').backgroundTransition({
		  backgrounds:[
			  { src: 'http://www.blueb.co.kr/SRC2/_image/01.jpg' },
			  { src: 'money.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/03.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/04.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/05.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/06.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/07.jpg' }
		  ],
		  transitionDelay: 3,
		  animationSpeed: 800
	  });

    </script>
</html>