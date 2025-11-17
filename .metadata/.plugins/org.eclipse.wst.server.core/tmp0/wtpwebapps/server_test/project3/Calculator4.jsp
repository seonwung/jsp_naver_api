<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
<h1>계산기</h1>

<form action="Calculator4.jsp" method="post">
   <input type="text" name="a"> + <input type="text" name="b">
   <input type="hidden" name="_cal" value="+">
   <input type="submit" value="실행">
</form><br>


<form action="Calculator4.jsp" method="post">
   <input type="text" name="a"> - <input type="text" name="b">
   <input type="hidden" name="_cal" value="-">
   <input type="submit" value="실행">
</form><br>


<form action="Calculator4.jsp" method="post">
   <input type="text" name="a"> * <input type="text" name="b">
   <input type="hidden" name="_cal" value="*">
   <input type="submit" value="실행">
</form><br>


<form action="Calculator4.jsp" method="post">
   <input type="text" name="a"> / <input type="text" name="b">
   <input type="hidden" name="_cal" value="/">
   <input type="submit" value="실행">
</form>
<%
String sa =request.getParameter("a");
String sb =request.getParameter("b");
String cal =request.getParameter("_cal");


double sum=0;
if(sa==null){
	sa="0";
}
if(sb==null){
	sb="0";
}
if(cal==null){
	cal="";
}

int a =Integer.parseInt(sa);
int b =Integer.parseInt(sb);

if("+".equals(cal)){
 sum = 	 a+b;
}
else if("-".equals(cal)){
	 sum = 	 a-b;
	}
else if("*".equals(cal)){
	 sum = 	 a*b;
	}
if("/".equals(cal)){
	 sum = 	a/(double)b;
	}

out.println("<h1>계산 결과</h1>");
out.println(sa+cal+sb+"="+sum);
%>

</body>
</html>