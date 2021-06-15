<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>공지사항</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- sweetalert2 -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
            <!-- Banner -->
            <section id="main">
                <h1 style="text-align: center">공지사항을 관리하세요</h1>
                <h2 style="text-align: center"></h2>
            </section>
            <section>

                <!-- 바디  -->
                <div class="box-body">
                    <table class="table table-bodered" style="text-align: center">
                        <tr>
                            <th style="text-align: center">번호</th>
                            <th style="text-align: center">글쓴이</th>
                            <th style="text-align: center">제목</th>
                            <th style="text-align: center">작성일</th>
                        </tr>
                        <c:forEach var="i" items="${boardList}">
                            <tr>
                                <td>${i.notice_no}</td>
                                <td>${i.nickname}</td>
                                <!-- 공지상세보기 링크 수정 -->
                                <td><a href="adminNoticeDetail.do?noticeNo=${i.notice_no}">${i.subject}</a></td>
                                <td><fmt:formatDate value="${i.writedate}" pattern="yyyy-MM-dd (E) HH:mm" /></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <div class="box-footer">
                    <div class="text-center">
                        <ul class="pagination" style="text-align: center">
                            <!-- 이전prev -->
                            <c:if test="${pm.prev}">
                                <li><a href="adminNotice.do?page=${pm.startPage-1}">&laquo;</a></li>
                            </c:if>
                            <!-- 페이지블럭 -->
                            <c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
                                <!-- 삼항연산자를 사용해서 class로 스타일적용  -->
                                <li ${pm.cri.page == idx? 'class=active':''}>
                                    <a href="adminNotice.do?page=${idx }">${idx}</a>
                                </li>
                            </c:forEach>
                            <!-- 다음next -->
                            <c:if test="${pm.next && pm.endPage > 0}">
                                <li><a href="adminNotice.do?page=${pm.endPage+1}">&raquo;</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>

                <!-- 바디 끝 -->
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>
<script type="text/javascript">

</script>
</html>