<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
  <%
    request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("_id");
  String name = request.getParameter("_name");
  String price1 = request.getParameter("_price");
  String day1 =request.getParameter("_day");
 if(price1==null) price1="0";
 if(day1==null) day1="0";
 int price2 = Integer.parseInt(price1);
 int day2 =Integer.parseInt(day1);
 int result =0;
   result= price2*day2;
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>객실 예약</h1>
<form action ="Order.jsp" method="post">
객실ID:<%=id %><br>
객실명:<%=name %><br>
숙박가격:<%=price1 %><br>
숙박일: <input type="text" name="_day" value="<%=day1%>"><br>
결제금액:<%=result %><br>

<input type="hidden" name="_id" value="<%=id%>">
<input type="hidden" name="_name" value="<%=name%>">
<input type="hidden" name="_price" value="<%=price1%>">

<input type="submit" value="예약">
</form>
<a href="Select.jsp">리스트</a>
</body>
</html>