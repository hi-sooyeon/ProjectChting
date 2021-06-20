<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Editorial by HTML5 UP</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <%--  Sweet Alert2  --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <%--  J Query  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <h3>MyPage</h3>
            <article>
                <div class="content align-center">
                    <h3><c:out value="${userInfo.userInfoBasic.nickname}"/></h3>
                    <c:choose>
                        <c:when test="${not empty profile_img}">
                            <img id="preview" src="${profile_img}" width="130">
                        </c:when>
                        <c:otherwise>
                            <img id="preview"
                                 src="https://cdn0.iconfinder.com/data/icons/communication-line-10/24/account_profile_user_contact_person_avatar_placeholder-512.png"
                                 width="130" alt="프로필 이미지">
                        </c:otherwise>
                    </c:choose>
                    <br><br>
                    <p><c:out value="${userInfo.userInfoBasic.first_area_name}"/> <c:out
                            value="${userInfo.userInfoBasic.second_area_name}"/></p>
                    <hr>
                    <h3>자기소개</h3>
                    <p><c:out value="${userInfo.userInfoBasic.content}"/></p>
                    <hr>
                </div>
            </article>

            <article>
                <div class="content align-center">
                    <h3>관심사</h3>
                    <c:forEach var="userInterest" items="${userInfo.userInterest}">
                        <div class="circle_user_interest">
                            <c:out value="${userInterest.catename}"/>
                        </div>
                    </c:forEach>
                    <hr>
                </div>
            </article>

            <article>
                <div class="content align-center">
                    <h3>가입한 모임</h3>
                    <c:forEach var="userJoinGroup" items="${userInfo.userJoinGroup}">
                        <c:out value="${userJoinGroup.group_name}"/>
                    </c:forEach>
                </div>
            </article>
            <input type="button" value="회원 정보 수정" id="updateUser"
                   onclick="location.href='userUpdate.do?userid=${sessionScope.get("userData").userid}'">
            <input type="button" value="회원 탈퇴" id="delacount">

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">
    let userGroupRole = "${userInfo.userInfoBasic.cnt}";

    let swal = Swal.mixin({
        customClass: {
            confirmButton: 'button',
            cancelButton: 'button'
        },
        buttonsStyling: false
    })

    console.log(userGroupRole); //값이 1이면 모임장 권한을 가진 모임이 있음

    $(function () {
        $("#delacount").click(function () {

            if (userGroupRole == '1') {
                swal.fire({
                    text: "모임장 권한을 가지고 있는 모임이 있어 권한 위임 후 탈퇴가 가능합니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '모임 관리 페이지로 이동',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "groupJoin.do?userid=" + userid;
                    }
                })
            } else {
                swal.fire({
                    title: "정말 탈퇴하시겠습니까?",
                    text: "계정 복구가 불가합니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '네, 탈퇴할게요!',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "delAcount.do?=userid" + userid,
                            dataType: "text",
                            data: {
                                userid: userid
                            },
                            success: function (data) {
                                swal.fire(
                                    '탈퇴 완료되었습니다.',
                                    '메인 페이지로 이동합니다.',
                                    'success', {
                                        buttons: {
                                            confirm: {
                                                text: '확인',
                                                value: true,
                                                className: 'button'
                                            }
                                        }
                                    }).then((result) => {
                                    location.href = "index.do"
                                })
                            },
                            error: function (request, status, error) {
                                console.log(error);
                            }
                        })
                    }
                })
            }
        });
    });
</script>
</body>
</html>