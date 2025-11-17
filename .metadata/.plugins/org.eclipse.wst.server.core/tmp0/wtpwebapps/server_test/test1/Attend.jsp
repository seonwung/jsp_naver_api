<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8"); 
   String [] absent = request.getParameterValues("_absent");
   if(absent==null){
	   absent = new String[1];
	   absent[0]="";
   }//처음엔 없으니까 0인상태로 만들어줘야함
   //1 여기서 일단 absent로 받음 학생 1 3 5
   // absent 는 학생1,3,5
   
   List absentList= (absent!=null) ? Arrays.asList(absent) :  new ArrayList(); //contain을 쓰기위한 List도 마찬가지
   //그리고 absentList만들어짐
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="Attend.jsp" method="post">
<%
   for(int i=1;i<=10;i++){
	   String student = "학생"+i;
	   String chk = (absentList.contains(student)) ? "checked" :"";
	   
	   out.println(student+"<input type='checkbox' name='_absent' value='"+student+"'"+chk+">"+"<br>");
   }//포문으로 학생 1~10 까지 돌려주고 chk 에 absentList에 있으면 checked로 만드는데 현재는 없음
   // 근데 내가 만약 체크를 해준다면 체크 해주고 제출하면 1 35
   //여기서 학생 1부터 도는거임 absentList에 학생1 현재 포함되어있지? 그러면 지금 포문에서는 chk="checked"
   //out.println(student+"<input type='checkbox' name='_absent' value='"+student+"' "+chk+">"+"<br>");

%>
<input type ="submit" value="제출 드가자">
</form>
<h1>결석 결과</h1>
 <%
    for(int i=0;i<absent.length;i++){
    	if(!absent[i].equals("")||absent[i]!=null)
    	out.println(absent[i]+" ");// 현재 출력 x 
    }
 %>

</body>
</html>