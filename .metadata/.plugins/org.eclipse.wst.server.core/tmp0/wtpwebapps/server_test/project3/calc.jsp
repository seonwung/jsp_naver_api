<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 
String sa= request.getParameter("a");
String sb= request.getParameter("b");
String cal= request.getParameter("_cal");

int a = Integer.parseInt(sa);
int b = Integer.parseInt(sb);
int c=0;
if("+".equals(cal)){
	c = a+b;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

실행결과 : <%=a %> + <%=b %> =<%=c %>
</body>
</html>