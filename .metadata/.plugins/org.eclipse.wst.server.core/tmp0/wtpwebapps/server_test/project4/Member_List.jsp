<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 리스트</h1>
<table border ="1">
<tr>
<th>ID</th>
<th>성명</th>
<th>주소</th>
<th>종교</th>
<th>관심분야</th>
</tr>
<tr>
<td><a href="Member_Detail.jsp?_id=hong&_name=홍길동&_addr=서울&_rel=기독교&_inter=컴퓨터">hong</a></td>
<td>홍길동</td>
<td>서울</td>
<td>기독교</td>
<td>컴퓨터</td>
</tr>

<tr>
<td><a href ="Member_Detail.jsp?_id=kim&_name=김유신&_addr=인천&_rel=천주교&_inter=모바일">kim</a></td>
<td>김유신</td>
<td>인천</td>
<td>천주교</td>
<td>모바일</td>
</tr>

<tr>
<td><a href="Member_Detail.jsp?_id=lee&_name=이순신&_addr=부산&_rel=불교&_inter=임베디드">lee</a></td>
<td>이순신</td>
<td>부산</td>
<td>불교</td>
<td>임베디드</td>
</tr>
</table>
</body>
</html>