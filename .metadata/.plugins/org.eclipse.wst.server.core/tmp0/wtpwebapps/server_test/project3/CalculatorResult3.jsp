<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String sa =request.getParameter("a");
 String sb =request.getParameter("b");
 String cal =request.getParameter("_cal");
 
 if(sa==null) sa= "0";
 if(sb==null) sb= "0";
 
 int a =Integer.parseInt(sa);
 int b =Integer.parseInt(sb);

 double result =0; 
 int sum=0;
 
 if("+".equals(cal)) sum =a+b;
 else if("-".equals(cal)) sum =a-b;
 else if("*".equals(cal)) sum =a*b;
 else if("/".equals(cal)) result =a/(double)b;

 out.println("<h1>계산 결과</h1>");
 if("/".equals(cal)){
 out.println(sa+cal+sb+"="+result);
 }
 else{
	 out.println(sa+cal+sb+"="+sum);
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>