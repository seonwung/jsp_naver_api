<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String id =request.getParameter("_id");   
 String pw =request.getParameter("_pw");
 
 if(id.equals("inha")&&pw.equals("inha")){
	 response.sendRedirect("http://www.inhatc.ac.kr");
 }
 else{
	 response.sendRedirect("Fail.jsp");
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