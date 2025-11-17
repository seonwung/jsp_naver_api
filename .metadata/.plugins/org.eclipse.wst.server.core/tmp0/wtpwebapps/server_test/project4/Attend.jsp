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
<%
 request.setCharacterEncoding("UTF-8");
String [] absent=request.getParameterValues("_absent"); //1 
if(absent==null){
	absent =new String[1];
	absent[0]="";
}
 List absentList;
 if(absent !=null){
	 absentList =Arrays.asList(absent);
 }
 else{
	 absentList =new ArrayList();
 }
 
%>

<form action="Attend.jsp">
<%
  for(int i=1;i<=10;i++){
	  
	  String student ="학생"+i;
	  String strChecked;
	  if(absentList.contains(student)){
		  strChecked ="checked";
	  }
	  else{
		  strChecked="";
	  }
	  out.println(student+"<input type='checkbox' name='_absent' value='"+student+"'"+strChecked+"><br>");
  }
%>
<input type ="submit" value="결석체크">

</form>

<%
   out.println("<h2>결석학생</h2>");

 for(int i=0;i<absent.length;i++){
	 if(absent[i]!=null&&!absent[i].equals("")){
		 out.println(absent[i]+" ");
	 }
 }
%>  ㅇ
</body>
</html>