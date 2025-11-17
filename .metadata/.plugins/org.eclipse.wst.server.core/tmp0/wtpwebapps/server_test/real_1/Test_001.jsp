<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     String cal =request.getParameter("_cal");
     if(cal==null) cal="";
     String Sa=request.getParameter("_a");
     String Sb=request.getParameter("_b");
     if(Sa==null)Sa="0";
     if(Sb==null)Sb="0";
    double result=0;
    
     double a = Double.parseDouble(Sa);
     double b = Double.parseDouble(Sb);
     
    if("+".equals(cal)) result =a+b;
    else if("-".equals(cal)) result =a-b;
    else if("*".equals(cal)) result =a*b;
    else if("/".equals(cal)) result =a/(double)b;
     
     
     
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계산기</h1>

<form action="Test_001.jsp" method="post" >
<input type="text" name="_a" value="<%=Sa%>"> 
<select name ="_cal">
<option value="+">+
<option value="-">-
<option value="*">*
<option value="/">/
</select>
<input type="text" name="_b" value="<%=Sb%>"><br>
<input type ="submit" value="등록"  value="<%=Sb%>">
</form>


 계산결과 : <%=result %>

</body>
</html>