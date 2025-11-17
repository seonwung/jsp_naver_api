<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>출석부</h1>
<%
   request.setCharacterEncoding("UTF-8");
   String [] absent =request.getParameterValues("_absent");
   if(absent==null){
	absent =new String[1];
	absent[0] ="";
   }
   
   List absentList  = (absent!=null) ? Arrays.asList(absent) :  new ArrayList(); 
%>
<form action="Attend_re.jsp" method="post">
<%
   for(int i=1;i<=10;i++){
	   String student ="학생"+i;
	   String strChecked =absentList.contains(student) ? "checked" : "";
	   out.println(student+"<input type ='checkbox' name='_absent' value='"+student+"'"+strChecked+">"+"<br>");
	   
   }
%>
<input type="submit" value="결석체크">
</form>

<h2>결석학생</h2>
<%
  for(int i=0;i<absent.length;i++){
	  if(absent[i]!=null||!absent[i].equals("")){
	  out.println(absent[i]+" ");
	  }
  }

%>

</body>
</html>