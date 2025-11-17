<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
     request.setCharacterEncoding("UTF-8");
 String id =request.getParameter("_id");
 String name =request.getParameter("_name");
 String addr =request.getParameter("_addr");
 String rel =request.getParameter("_rel");
 String inter =request.getParameter("_inter");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 삭제 확인</h1>

ID:<%=id %><br>
성명:<%=name %><br>
주소:<%=addr %><br>
종교:<%=rel %><br>
관심분야:<%=inter %><br>
<h2>삭제 확인</h2>
</body>
</html>