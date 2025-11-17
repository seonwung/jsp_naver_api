<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form action ="MemberResult.jsp" method="post">
 성명 <input type ="text" name="_name"><br>
 ID <input type ="text" name="_id"><br>
 암호 <input type ="password" name="_pw"><br>
 주소 <input type ="text" name="_addr"><br>
 종교 <input type="radio" name="_rel" value="기독교">기독교
     <input type="radio" name="_rel" value="천주교">천주교
     <input type="radio" name="_rel" value="불교">불교<br>
     
 관심분야 <input type="checkbox" name="_inter" value="앙">앙
          <input type="checkbox" name="_inter" value="기">기
           <input type="checkbox" name="_inter" value="모">모<br>
           
 전화 
 <select name ="_phone1">
 <option value="02"> 02
 <option value="032"> 032
 <option value="031"> 031
 </select>
 <input type ="text" name ="_phone2"><br>
 
 <input type ="submit" value="등록">
 <input type ="reset" value="취소">
</form>
</body>
</html>