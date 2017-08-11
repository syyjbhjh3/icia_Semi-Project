<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
    <head>
    	<link href='http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <meta charset="utf-8">
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="jquery.ajax-cross-origin.min.js"></script>
        <style>
        	.header {
  background-color: #327a81;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}

img {
  border-radius: 50%;
  height: 60px;
  width: 60px;
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 800px;
}

table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: left;
}
table th {
  background-color: #daeff1;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #edf7f8;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: 'Name:';
  }
  td:nth-child(3):before {
    content: 'Email:';
  }
  td:nth-child(4):before {
    content: 'Phone:';
  }
  td:nth-child(5):before {
    content: 'Comments:';
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}
        	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
			@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
        	@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
        	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
			#gum{
				font-family : 'Josefin Sans', sans-serif;
				font-size : 25px;
				margin-left : 28%;
			}

			.mtrt{
				display : none;
			}
			.footer{
                border: 1px solid lightgray;
                padding: 10px 0 10px 0;
                text-align: center;
                cursor: pointer;
 
            }
            li{
              list-style: none;
                border: 1px solid lightgray;
                margin: 1px 0 1px 0;
                width : 300;
                
            }

            .img{
            	margin : 0 0 0 35;
            }
            #itemList{
            	margin : 0 0 0 30;
            }
            #subject{
            	margin : 0  0 0 10;
            }
            p{
            	font-size : 10px;
            }
            .gurwns{
            	width : 130px;
            }
            .rnjs{
            	width : 130px;
            }
        </style>
    </head>
    <body>
    	<jsp:include page="aftercalendar.jsp"/><br/><br/><br/><br/>
        <div id="gum">
		

        Bank Type :
        <select id="cnt">
            <option value="020000">020000(은행)</option>
            <option value="030300">030300(저축은행)</option>
        </select>
        PageNo :
        <select id="pageNo">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
        <button onclick="sendAjax(4)">검색</button>
        <br/>
        <br/>
        </div>
        <!-- <img class ="img" src="image\옵션상세보기.gif"  
		        	onclick="block()" style="cursor:pointer"/>
        <img class ="img" src="image\옵션닫기.gif"  
		        	onclick="none()" style="cursor:pointer"/> -->
<div class="table-users">
   <div class="header">저축상품 List</div>
        <table id="itemlist">
            

          </table></div>
          <div class="footer">더보기</div>
          
    </body>
    <script>
    	var j =0;
   		var page = 4;
	    $(".footer").click(function(){
	    	j= j+5;
	    	page = page+5;
	        sendAjax(page);                    
	    });
	    function none(){
	    	$(".mtrt").css("display","none");
	    }
	    function block(){
	    	$(".mtrt").css("display","block");
	    }
		function sendAjax(no){
			var topFin = $("#cnt").val();
	    	var pageNo = $("#pageNo").val();
	        var full_url="http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.json?"+
	        		"auth=66ef762f372ccc2706b6f56eb2fed9d9&topFinGrpNo="+topFin+"&pageNo="+pageNo;	
            $.ajax({
				type:"get",
                url:full_url,
				crossOrigin: true,
				dataType : 'json',  
                success:function(data){
					var obj = JSON.parse(data);
                    console.log(obj.result.baseList);
                    var list = obj.result.baseList;
                    
                    var fin_prdt_nm;/*적금이름*/
                    var kor_co_nm;/*은행이름*/
                    var max_limit;/*최대금액*/
                    var join_member;/*가입 멤버*/
                    var join_way;/*가입 경로*/
                    var mtrt_int;/*더보기 내용1*/
                    var spcl_cnd;/*더보기 내용2*/
                    content="";
                    var i =0;
                    
                    for(i=j;i<=no;i++){
                    	fin_prdt_nm = list[i].fin_prdt_nm;
                    	kor_co_nm = list[i].kor_co_nm;
                    	max_limit = list[i].max_limit;
                    	join_member = list[i].join_member;
                    	join_way = list[i].join_way;
                    	mtrt_int = list[i].mtrt_int;
                    	spcl_cnd = list[i].spcl_cnd;
               		
                        content +="<tr>"
                            
                            +"<div class='content'>"
                            +"<td class='rnjs'><p>"+fin_prdt_nm+"</p><p>"+kor_co_nm+"</p></td>"
                            +"<td class='gurwns'><p>"+join_member+"</p><p>"+join_way+"</p></td>"
                            +"<td><h6>"+mtrt_int+"</h6></td>"
                            +"</div>"
                            +"<td><h6 class='mtrt'>"+max_limit+"</h6></td>"
                            +"<td><h6 class='mtrt'>"+spcl_cnd+"</h6></td>"
                            +"</tr>";
						
                    };
                    if(no==4){
                        $("#itemlist").empty();
                    }
                    /*추가*/
                    $("#itemlist").append(content);
                },error:function(e){                   
                    console.log(e);
                }
            });            
        }

    </script>
</html>