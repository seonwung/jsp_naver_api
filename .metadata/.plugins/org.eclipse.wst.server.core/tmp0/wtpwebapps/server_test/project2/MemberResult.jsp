<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 완료</h1>
<%
 request.setCharacterEncoding("UTF-8");
String id= request.getParameter("_id");
String name= request.getParameter("_name");
String pw= request.getParameter("_pw");
String addr= request.getParameter("_addr");
String rel= request.getParameter("_rel");
String [] inter = request.getParameterValues("_inter");
String phone1 = request.getParameter("_phone1");
String phone2 = request.getParameter("_phone2");
%>

성명 :<%=name %><br>
ID :<%=id %><br>
암호 :<%=pw %><br>
주소 :<%=addr %><br>
종교 :<%=rel %><br>
관심분야:
<%
  for(int i=0;i<inter.length;i++)
  {
	  out.println(inter[i]+" ");
  }
%><br>
전화번호: <%=phone1+"-"+phone2%><br>

<h1>이상입니다</h1>
</body>
</html>