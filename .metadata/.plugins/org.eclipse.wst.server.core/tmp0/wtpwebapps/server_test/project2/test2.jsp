<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 확인</h1>
<%
 
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("_id");
  String pw = request.getParameter("_pw");
  out.print("ID:" + id + "<br>");

%>

ID:<%=id %><br>
PW:<%=pw %><br>

<%
out.print("ID:" + id + "<br>");
%>
</body>
</html>