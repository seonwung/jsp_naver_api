<%@ page import="java.util.*" %>
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
   Date d = new Date();
   out.println((d.getYear()+1900)+"년"
		     +(d.getMonth()+1)+"월"
		      +(d.getDate()+"일"));
%>
</body>
</html>	