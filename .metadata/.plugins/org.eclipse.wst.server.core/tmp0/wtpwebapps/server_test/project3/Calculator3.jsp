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

<form action="CalculatorResult3.jsp" method="post">
<input type ="text" name ="a"> + <input type ="text" name ="b">
<input type ="hidden" name="_cal" value="+">
<input type ="submit" value="실행">
</form><br>

<form action="CalculatorResult3.jsp" method="post">
<input type ="text" name ="a"> - <input type ="text" name ="b">
<input type ="hidden" name="_cal" value="-">
<input type ="submit" value="실행">
</form><br>

<form action="CalculatorResult3.jsp" method="post">
<input type ="text" name ="a"> * <input type ="text" name ="b">
<input type ="hidden" name="_cal" value="*">
<input type ="submit" value="실행">
</form><br>

<form action="CalculatorResult3.jsp" method="post">
<input type ="text" name ="a"> / <input type ="text" name ="b">
<input type ="hidden" name="_cal" value="/">
<input type ="submit" value="실행">
</form><br>

</body>
</html>