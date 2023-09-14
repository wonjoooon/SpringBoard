<%--
  Created by IntelliJ IDEA.
  User: 북악관205_07
  Date: 2023-09-12
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextpath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>글 목록</title>
  <style>
    .cls2 {
      text-align: center;
      font-size: 30px;
      display: block;
    }
    .cls1 {
      text-decoration: none;
    }
  </style>
</head>
<body>
  <table align="center" border="1" width="80%">
    <thead>
      <tr height="10" align="center" bgcolor="#90ee90">
        <th>글 번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>작성일</th>
      </tr>
    </thead>
    <c:choose>
      <c:when test="${empty dataList}">
        <tbody>
          <tr height="10">
            <td colspan="4">
              <p align="center"><b><span style="font-size: 9pt">등록된 글이 없습니다.</span></b></p>
            </td>
          </tr>
        </tbody>
      </c:when>
      <c:otherwise>
        <tbody>
          <c:forEach var="article" items="${dataList}" varStatus="articleNum">
            <tr align="center" height="10">
              <td width="8%">${articleNum.count}</td>
              <td width="10%">${article.write_id}</td>
              <td align="left" width="35%">
                <span style="padding-right: 30px;"></span>
                <a href="${contextpath}/board/view?no=${article.article_no}" class="cls1">${article.title}</a>
              </td>
              <td width="10%">${article.write_date}</td>
            </tr>
          </c:forEach>
        </tbody>
      </c:otherwise>
    </c:choose>
  </table>
<a href="${contextpath}/board/add" class="cls1"><span class="cls2">글쓰기</span></a>
</body>
</html>
