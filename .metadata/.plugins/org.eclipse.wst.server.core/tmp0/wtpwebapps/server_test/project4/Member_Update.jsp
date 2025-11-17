<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
   String id = request.getParameter("_id");
   String name = request.getParameter("_name");
   String addr = request.getParameter("_addr");
   String rel = request.getParameter("_rel");
   String inter = request.getParameter("_inter");
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Member_Update_Ok.jsp" method="post">
Id:<%=id %><br>
<input type="hidden" name="_id" value=<%=id %>>
성명:<input type="text" name="_name" value=<%=name %>><br>
주소:<input type="text" name="_addr" value=<%=addr %>><br>
종교:<input type="text" name="_rel" value=<%=rel %>><br>
관심분야:<input type="text" name="_inter" value=<%=inter%>><br>
<input type ="submit" value="수정">
</form>
</body>
</html>