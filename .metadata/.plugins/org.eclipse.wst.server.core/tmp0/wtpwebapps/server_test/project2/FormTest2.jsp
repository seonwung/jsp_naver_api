<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 
 String data =request.getParameter("_data");
 out.println("<h2>This page is FormTest2.jsp</h2>");
 out.println("<h3>"+data);
%>
</body>
</html>