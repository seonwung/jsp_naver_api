<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>객실 리스트</h1>

<%
  Calendar cal = Calendar.getInstance();
out.println(cal.get(Calendar.YEAR)+"."+(cal.get(Calendar.MONTH)+1)+"."+cal.get(Calendar.DATE));

%>
<table border="1">
<tr>
<th>객실ID</th>
<th>객실명</th>
<th>숙박가격</th>
</tr>

<tr>
<td><a href="Detail.jsp?_id=R001&_name=일반실&_price=100000">R001</a></td>

<td>일반실</td>
<td>100000</td>
</tr>

<tr>
<td><a href="Detail.jsp?_id=R002&_name=세미나룸&_price=500000">R002</a></td>
<td>세미나룸</td>
<td>500000</td>
</tr>

<tr>
<td><a href="Detail.jsp?_id=R003&_name=스위트룸&_price=300000">R003</a></td>

<td>스위트룸</td>
<td>300000</td>
</tr>
</table>
<a href="Insert.jsp">등록</a>
</body>
</html>