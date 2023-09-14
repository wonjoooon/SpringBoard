<%--
  Created by IntelliJ IDEA.
  User: 북악관205_07
  Date: 2023-09-13
  Time: 오전 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View | 상세 조회</title>
    <style>
        #tr_btn_modify {
            display: none;
        }
    </style>
    <script>
        function backToList(form){
            form.action = "${contextpath}/board/list";
            form.submit();
        }

        function fn_enable(){ // 수정버튼 누르면 실행되는 함수
            document.querySelector("#i_title").disabled = false;
            document.querySelector("#i_content").disabled = false;
            document.querySelector("#tr_btn").style.display = 'none';
            document.querySelector("#tr_btn_modify").style.display = 'table-row';
        }
        function fn_articleModify(form){
            form.action = "${contextpath}/board/edit";
            form.submit();
        }
        function fn_deleteArticle(form){
            form.action = "${contextpath}/board/delete";
            form.submit();
        }
    </script>
</head>
<body>
    <form name="articleForm" method="post" action="">
        <table border="0" align="center">
            <tbody>
                <tr>
                    <td width="150" align="center" bgcolor="#FF9933">글 번호</td>
                    <td>
                        <input type="text" value="${article.article_no}" name="articleNo" readonly>
                    </td>
                </tr>
                <tr>
                    <td width="150" align="center" bgcolor="#FF9933">작성자</td>
                    <td>
                        <input type="text" value="${article.write_id}" name="writer" readonly>
                    </td>
                </tr>
                <tr>
                    <td width="150" align="center" bgcolor="#FF9933">제목</td>
                    <td>
                        <input type="text" value="${article.title}" name="title" id="i_title" disabled>
                    </td>
                </tr>
                <tr>
                    <td width="150" align="center" bgcolor="#FF9933">내용</td>
                    <td>
                        <textarea rows="20" cols="60" name="content" id="i_content" disabled>
                            ${article.content}
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td width="150" align="center" bgcolor="#FF9933">작성일</td>
                    <td>
                        <input type="text" value="${article.write_date}" readonly>
                    </td>
                </tr>
                <tr id="tr_btn">
                    <td colspan="2" align="center">
                        <input type="button" value="수정" onclick="fn_enable()"/>
                        <input type="button" value="삭제" onclick="fn_deleteArticle(articleForm)"/>
                        <input type="button" value="목록보기" onclick="backToList(articleForm)" />
                    </td>
                </tr>
                <tr id="tr_btn_modify">
                    <td colspan="2" align="center">
                        <input type="button" value="저장" onclick="fn_articleModify(articleForm)"/>
                        <input type="button" value="취소" onclick="backToList(articleForm)"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
