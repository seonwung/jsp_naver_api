<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.KinDTO" %>


<%
    List<KinDTO> list = (List<KinDTO>) request.getAttribute("list");

    Integer currentPage = (Integer) request.getAttribute("page");
    Integer totalPage = (Integer) request.getAttribute("totalPage");
    Integer pageSize = (Integer) request.getAttribute("pageSize");
    Integer totalCount = (Integer) request.getAttribute("totalCount");

    if (currentPage == null) currentPage = 1;
    if (totalPage == null) totalPage = 1;
    if (pageSize == null) pageSize = 100;
    if (totalCount == null) totalCount = 0;

    int startNo = (currentPage - 1) * pageSize + 1;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>저장된 지식인 질문 목록</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/kin.css">
</head>
<body>

<h2>저장된 지식인 질문 목록</h2>
<p>총 <%= totalCount %> 건</p>

<div class="result-box">
<%
    if (list != null && !list.isEmpty()) {
%>
    <table class="saved-table">
        <thead>
            <tr>
                <th>No</th>
                <th>제목</th>
                <th>URL</th>
                <th>질문 내용</th>
            </tr>
        </thead>
        <tbody>
        <%
            int rowNo = startNo;
            for (KinDTO dto : list) {
        %>
            <tr>
                <td><%= rowNo++ %></td>
                <td><%= dto.getTitle() %></td>
                <td>
                    <a href="<%= dto.getUrl() %>" target="_blank">링크</a>
                </td>
                <td><%= dto.getQContent() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
<%
    } else {
%>
    <p>저장된 데이터가 없습니다.</p>
<%
    }
%>
</div>

<!-- 페이지 네비게이션 -->
<div class="pagination">
<%
    for (int i = 1; i <= totalPage; i++) {
        if (i == currentPage) {  
%>
        <span class="page current"><%= i %></span>
<%
        } else {
%>
        <a class="page" href="<%= request.getContextPath() %>/kin/saved-list?page=<%= i %>"><%= i %></a>
<%
        }
    }
%>
</div>

</body>
</html>
