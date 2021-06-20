<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

    body, div, table, section, nav, li, input {
        font-family: 'Jua', sans-serif;
    }
</style>
<!-- Sidebar -->
<div id="sidebar">
    <div class="inner">

        <!-- Search -->
        <section id="search" class="alt">
            <form method="post" action="#">
                <input type="text" name="query" id="query" placeholder="Search"/>
            </form>
        </section>

        <!-- Menu -->
        <nav id="menu">
            <header class="major">
                <h2>Menu</h2>
            </header>
            <ul id="sideList">
                <li><a href="index.do">ChTing</a></li>
                <li><a href="adminIndex.do">관리자</a></li>
                <li><a href="groupRecommend.do">모임 추천</a></li>
                <li><a href="myPage.do?userid=${sessionScope.get("userData").userid}">마이페이지</a></li>
                <li><a href="groupMake.do?userid=${sessionScope.get("userData").userid}">모임 생성</a></li>

                <!-- 임시 모임관리 링크 -->
                <li><a href="#" id="groupJoin">모임관리</a></li>

                <!-- 임시 모임관리 링크 POST 전송할 form -->
                <form style="display: none" action="" method="POST" id="groupJoinPost">
                    <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}"/>
                </form>

                <%--                <li><span class="opener">조선 제1조 모임</span>
                                    <ul>
                                        <li><a href="board_main.do?group_no=">메인</a></li>
                                        <li><a href="board_list.do?group_no=">게시판</a></li>
                                        <li><a href="board_diary.do?group_no=">일정</a></li>
                                        <li><a href="board_chatting.do?group_no=">채팅</a></li>
                                        <li><a href="groupJoin.do?group_no=">모임관리</a></li>
                                    </ul>
                                </li>--%>
            </ul>
        </nav>

        <%--		<!-- Section -->--%>
        <%--		<section>--%>
        <%--			<div class="mini-posts">--%>
        <%--				<article>--%>
        <%--					<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>--%>
        <%--					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper--%>
        <%--						dolore aliquam.</p>--%>
        <%--				</article>--%>
        <%--				<article>--%>
        <%--					<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>--%>
        <%--					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper--%>
        <%--						dolore aliquam.</p>--%>
        <%--				</article>--%>
        <%--				<article>--%>
        <%--					<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>--%>
        <%--					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper--%>
        <%--						dolore aliquam.</p>--%>
        <%--				</article>--%>
        <%--			</div>--%>
        <%--			<ul class="actions">--%>
        <%--				<li><a href="#" class="button">More</a></li>--%>
        <%--			</ul>--%>
        <%--		</section>--%>

        <!-- Section -->
        <%--		<section>--%>
        <%--			<header class="major">--%>
        <%--				<h2>Get in touch</h2>--%>
        <%--			</header>--%>
        <%--			<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare--%>
        <%--				velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed--%>
        <%--				aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus--%>
        <%--				aliquam.</p>--%>
        <%--			<ul class="contact">--%>
        <%--				<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>--%>
        <%--				<li class="icon solid fa-phone">(000) 000-0000</li>--%>
        <%--				<li class="icon solid fa-home">1234 Somewhere Road #8254<br />--%>
        <%--					Nashville, TN 00000-0000--%>
        <%--				</li>--%>
        <%--			</ul>--%>
        <%--		</section>--%>


    </div>
</div>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<%--  Sweet Alert2  --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- underscore.js -->
<script src="https://cdn.jsdelivr.net/npm/underscore@1.13.1/underscore-umd-min.js"></script>
<script type="text/javascript">

    //모임관리 링크 클릭시 POST 전송
    $(document).on("click", "#groupJoin", function () {
        $("#groupJoinPost").attr("action", "groupJoin.do");
        $("#groupJoinPost").submit();
    });

    let sideList = $('#sideList');
    if (${not empty pageContext.request.userPrincipal}) {
        $.ajax({
            url: "side/groupList/" + "${sessionScope.get("userData").userid}",
            data: {},
            dataType: "json",
            type: "get",
            success: function (response) {
                response.forEach(group => {
                    sideList.append(
                        "<li><span class='opener active'>" + group.group_name
                        + "</span><ul><li><a href='board_main.do?group_no=" + group.group_no + "'>메인</a></li><li>" +
                        "<a href='board_list.do?group_no=" + group.group_no + "'>게시판</a></li><li>" +
                        "<a href='board_diary.do?group_no=" + group.group_no + "'>일정</a></li><li>" +
                        "<a href='board_chatting.do?group_no=" + group.group_no + "'>채팅</a></li> <li>" +
                        "<a href='groupJoin.do?userid=testuser'>모임관리</a></li></ul></li>")
                });
            },
            error: function (Http, status, error) {
                console.log("Http : " + Http + ", status : " + status + ", error : " + error);
            }
        });
    }

</script>
