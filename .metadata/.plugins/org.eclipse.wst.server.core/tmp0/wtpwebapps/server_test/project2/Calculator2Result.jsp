<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계산완료</h1>
<%
 String sa = request.getParameter("_a");
 String sb = request.getParameter("_b");
 
 double a = Double.parseDouble(sa);
 double b = Double.parseDouble(sb);
 double c= a+b;
 out.println("실행결과 :"+a+"+"+b+"="+c+"<br>");
%>

실행결과 : <%=a%> +<%=b %> =<%=c %><br>
실행결과 : <%=a+"+"+b+"="+ c%>
</body>
</html>