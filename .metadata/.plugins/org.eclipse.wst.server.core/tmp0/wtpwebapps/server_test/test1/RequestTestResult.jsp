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
  request.setCharacterEncoding("UTF-8");
%>

인코딩 방식: <%=request.getCharacterEncoding() %><br>
클라이언트URL경로 :<%=request.getRequestURL() %><br>
전송방식 :<%= request.getMethod() %><br>
</body>
</html>