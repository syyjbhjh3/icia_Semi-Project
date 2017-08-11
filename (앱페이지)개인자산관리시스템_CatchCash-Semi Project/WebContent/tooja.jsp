<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
    <head>
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    
    	<link href='http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <meta charset="utf-8">
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="jquery.ajax-cross-origin.min.js"></script>
        <style>

        	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
			@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
        	@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
        	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
			#gum{
				font-family : 'Josefin Sans', sans-serif;
				font-size : 25px;
				margin-left : 20%;
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
      

            .img{
            	margin : 0 0 0 35;
            }
            #itemList{
            	margin : 0 0 0 23;
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
            td{
            	text-align : center;
            }
            th{
            	font-size : 30px;
            	
            }
            table {
  width: 350px;
  height : 200px;
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
  text-align: center;
}
table th {
  background-color: #46BEFF;
  font-weight: 300;
}
table tr:nth-child(5n) {
  background-color: #EBF5FF;
}
table tr:nth-child(5n+1) {
  background-color: white;
}
  .headerr {
  background-color: #006AF4;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}
        </style>
    </head>
    <body>
    	<jsp:include page="aftercalendar.jsp"/><br/><br/><br/><br/><br/>
        <div id="gum">
		

        Bank Type :
        <select id="cnt">
            <option value="020000">020000(은행)</option>
            <option value="030300">030200(여신전문금융)</option>
            <option value="030300">030300(저축은행)</option>
            <option value="030300">050000(보험)</option>
            <option value="030300">060000(금융투자)</option>
            
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
        <span style="margin-left:27%;">Option</span>
        </div>
        <img class ="img" src="image\1496587635_15_Open_Sign.png"  
		        	onclick="block()" style="cursor:pointer; margin-left:13%;" />
        <img class ="img" src="image\1496587644_18_Closed_Sign.png"  
		        	onclick="none()" style="cursor:pointer"/> 
<div class="table-users">
   <div class="headerr">저축상품 List</div>
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
                    	if(list[i].join_member.length>10){
                            join_member = list[i].join_member.substring(0,9)+"...";
                        }
                        content +="<tr>"
                            
                            +"<th colspan='3'><p>"+fin_prdt_nm+"</th></tr>"
                            +"<tr><td><p>"+kor_co_nm+"</p></td>"
                            +"<td><p>"+join_member+"</p></td><td><p>"+join_way+"</p></td></tr>"
                            
                            +"<tr><td colspan='3'><h6>"+mtrt_int+"</h6></td></tr>"
                            +"<tr><td  colspan='3'><p class='mtrt'>최대 저축 가능 금액 : "+max_limit+"</p></td></tr>"
                            +"<tr><td colspan='3'><p class='mtrt'>혜택 : "+spcl_cnd+"</p></td>"
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