<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>출석부</h1>
<form action ="Attend.jsp" method="post">
<%
   for(int i=1;i<=10;i++){
%>
   학생<%=i %> <input type="checkbox" name="check" value="학생<%=i %>"><br>
<%    
   }
%>
<input type ="submit" value="결석 체크"><br>
</form>


<%
request.setCharacterEncoding("UTF-8");
String [] check = request.getParameterValues("check");
if(check ==null){
	check =new String[1];
	check[0]="";
}
out.println("<h2>결석학생</h2>");

for(int i=0;i<check.length;i++){
	if(check[i]!=null||!check[i].equals(" ")){
		out.println(check[i]+" ");
	}
}
%>
</body>
</html>