<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <script src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <style>
            table{
                width:100%;
            }
            table, td{
                border: 1px solid;
                border_collapse:collapse;
            }
            td{
                padding: 5px;
                text_align: center;
            }
            input[type='text']{
                width: 100%;
            }
            textarea{
                width: 100%;
                resize:none;
            }
        </style>
    </head>
    <body>
		<form action="modify2" method="post">
            <table>
                <tr>
                    <td>작성자</td>
                    <td>
                        <input type="text" name="writer" value="${sessionScope.loginId}" readonly/>
                    </td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td>
                        <input type="text" name="subject" value="<%=request.getParameter("subject")%>"/>
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea rows="50" name="content"><%=request.getParameter("content")%></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>"/>
                        <input type="submit" value="수정"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <script></script>
</html>