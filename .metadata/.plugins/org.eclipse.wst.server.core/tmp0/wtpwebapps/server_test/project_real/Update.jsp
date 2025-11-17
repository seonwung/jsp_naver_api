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
<h1>객실 수정</h1>
<form action="UpdateOk.jsp" method="post">
객실ID: <input type="text" name="_id" value=<%=id %>><br>
객실명: <input type="text" name="_name" value=<%=name %>><br>
숙박가격: <input type="text" name="_price" value=<%=Sprice %>><br>

<input type="submit" value="수정">
</form>
</body>
</html>