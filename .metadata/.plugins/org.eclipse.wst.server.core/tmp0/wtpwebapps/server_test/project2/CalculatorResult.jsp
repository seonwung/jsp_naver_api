<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계산 결과</h1>
<%
 String Sa =request.getParameter("_a");
 String Sb =request.getParameter("_b");
 
 int a = Integer.parseInt(Sa);
 int b = Integer.parseInt(Sb);
 
 int c= a+b;
%>

실행결과 :<%=a%> +<%=b%> = <%=c %>
</body>
</html>