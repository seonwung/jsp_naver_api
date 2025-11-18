<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.KinDTO" %>

<%
    String query = request.getParameter("query");
    if (query == null) query = "";
//
    List<KinDTO> list = (List<KinDTO>) request.getAttribute("list");

 // ** 추가 세션에서 저장 상태 메시지를 가져와 즉시 삭제 **
    String saveStatus = (String) session.getAttribute("saveStatus");
    if (saveStatus != null) {
        session.removeAttribute("saveStatus");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>네이버 지식인 검색</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/kin.css">
</head>

<body>

<h2>네이버 지식인 검색</h2>

<%
    // ** 추가 저장 상태 메시지 출력 로직 **
    if (saveStatus != null) {
%>
    <p style="color: blue; font-weight: bold;"><%= saveStatus %></p>
<%
    }
%>

<form action="<%= request.getContextPath() %>/kin/search" method="get">  <!-- 이거쓰는이유 -->
    <input type="text" name="query" value="<%= query %>" placeholder="검색어 입력">
    <button type="submit">검색</button>
<!-- 절대경로로 지정 -->
    <% if (list != null && !list.isEmpty()) { %>
        <button type="submit" formaction="<%= request.getContextPath() %>/kin/save">저장</button>
    <% } %>
</form>

<hr>

<div class="result-box">

<%
    if (list != null && !list.isEmpty()) {
        for (KinDTO dto : list) {
%>

        <div class="item">
            <b><%= dto.getTitle() %></b><br>
            <a href="<%= dto.getUrl() %>" target="_blank"><%= dto.getUrl() %></a><br>

            <%= dto.getQContent() %><br>
         
        </div>

<%
        }
    } else {
%>
    <p>검색 결과가 없습니다.</p>
<%
    }
%>

</div>

</body>
</html>
