<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("_id");
  String name = request.getParameter("_name");
  String Sprice = request.getParameter("_price");
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>객실 상세정보</h1>
객실ID:<%=id %><br>
객실명:<%=name %><br>
숙박가격:<%=Sprice %><br>


<a href="Order.jsp?_id=<%=id%>&_name=<%=name%>&_price=<%=Sprice%>">예약</a>
<a href="Update.jsp?_id=<%=id%>&_name=<%=name%>&_price=<%=Sprice%>">수정</a>

</body>
</html>