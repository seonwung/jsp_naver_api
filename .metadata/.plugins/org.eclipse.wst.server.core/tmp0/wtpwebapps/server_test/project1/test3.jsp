<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String str ="Hello, Welcome to JSP World! Let's go ";
  out.print("문자열 길이: "+str.length()+"<br>");
  out.print("JSP 문자위치:"+str.indexOf("JSP")+"<br>");
  out.print("소문자 변환: "+str.toLowerCase()+"<br>");
  out.println("대문자 변환"+str.toUpperCase());
  Calendar cal = Calendar.getInstance();
  out.println(cal.get(Calendar.YEAR)+"년");
  out.println((cal.get(Calendar.MONTH)+1)+"월");//cal.get에서 불러온곳에서 +1해야함
  out.println(cal.get(Calendar.DATE)+"일");
  %>
</body>
</html>