<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("_id");
  String name = request.getParameter("_name");
  String Sprice = request.getParameter("_price");
  
  int price = Integer.parseInt(Sprice);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>객실 등록 확인</h1>
객실ID:<%=id %><br>
객실명:<%=name %><br>
숙박가격:<%=Sprice %><br>

<a href="Select.jsp">리스트</a>
</body>
</html>