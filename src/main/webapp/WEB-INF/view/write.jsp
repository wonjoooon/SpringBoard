<%--
  Created by IntelliJ IDEA.
  User: 북악관205_07
  Date: 2023-09-13
  Time: 오전 9:41
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
    <title>Write | 글쓰기</title>
    <style>
        .class-caption {
            width: 100px;
        }
        .class-content {
            width: 500px;
        }
    </style>
    <script>
        function backToList(form){
            form.action = "${contextpath}/board/list";
            form.submit();
        }
    </script>
</head>
<body>
    <h1 style="text-align: center;">글쓰기</h1>
    <form name="articleForm" method="post" action="${contextpath}/board/addarticle">
        <table border="0" align="center">
            <tbody>
                <tr>
                    <td align="right" class="class-caption">글 제목</td>
                    <td colspan="2">
                        <input type="text" maxlength="100" name="i_title" class="class-content">
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top" class="class-caption"><br>글 내용:</td>
                    <td colspan="2">
                        <textarea name="i_content" rows="10" maxlength="2000" class="class-content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td colspan="2">
                        <input type="submit" value="저장">
                        <input type="button" value="목록보기" onclick="backToList(articleForm)">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
