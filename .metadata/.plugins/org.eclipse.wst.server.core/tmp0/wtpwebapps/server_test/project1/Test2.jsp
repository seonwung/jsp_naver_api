<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="javascript">

function viewDate(){
	var d = new Date();
	document.FormName.Date.value =
	(d.getYear()+1900)+"년"+(d.getMonth()+1)+"월"+d.getDate()+"일";
	
}

</script>
</head>
<body>
<%
Date d = new Date();
out.println("Server Date: "+(d.getYear()+1900)+"년"
		+(d.getMonth()+1)+"월"+d.getDate()+"일");

%>
<form name ="FormName">
Local Date: <input type="text" name="Date">
<input type="button" value="Call Local Date" onClick="viewDate()">
</form>


</body>
</html>