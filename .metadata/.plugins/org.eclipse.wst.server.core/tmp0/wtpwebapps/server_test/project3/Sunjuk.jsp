<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String sa =request.getParameter("a");
 String sb =request.getParameter("b");
 String sc =request.getParameter("c");
 String sd =request.getParameter("d");
 
 int sum =0;
 if(sa==null) sa= "0";
 if(sb==null) sb= "0";
 if(sc==null) sc= "0";
 if(sd==null) sd= "0";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Sunjuk.jsp" method ="post">
전자논리회로 <input type ="text" name="a" value ="<%= sa %>"><br>
TCP/IP <input type ="text" name="b" value ="<%= sb %>"><br>
시스템보안 <input type ="text" name="c" value ="<%= sc %>"><br>
JAVA프로그래밍 <input type ="text" name="d" value ="<%= sd %>"><br>

<input type ="submit" value="평균">
<input type ="reset" value="취소">

</form>
<%
    int a = Integer.parseInt(sa);
    int b = Integer.parseInt(sb);
    int c = Integer.parseInt(sc);
    int d = Integer.parseInt(sd);
    sum =a+b+c+d;

    
    double result =sum/4.0;
    out.println("<h1>평균 :"+ result+"<h1>");
%>

 <%-- <h1>평균 : <%=result %></h1> --%>
</body>
</html>