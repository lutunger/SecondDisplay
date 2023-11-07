<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<title>secondDisplay</title>
	<link rel="stylesheet" href="/resources/lib/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/lib/fontAwesome/all.min.css">
	<link rel="stylesheet" href="/resources/css/common/common.css">
	<link rel="stylesheet" href="/resources/css/board/add.css">
	<link rel="icon" href="/resources/images/common/icons8-cloth-32.png" type="image/x-icon">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<main class="container content-w mt-3 mb-3">

        <div class="chat-wrapper d-flex h-75">
            <div class="chat-list card w-50">
                <h5 class="card-header">채팅방</h5>
                <div class="card-body p-0 overflow-y-scroll">
                    <ul class="list-group list-group-flush mh-100 ">
                        <c:forEach var="room" items="${roomList}">
                            <li class="chatRoom list-group-item d-flex align-items-center" 
                            style="cursor: pointer;"
                            data-user1No = "${room.user1No}"
                            data-user2No = "${room.user2No}"
                            data-roomNo = "${room.chatRoomNo}"
                            data-goodsNo = "${room.goodsNo}"
                            data-thumbnail = "${room.thumbNail}"
                            data-title = "${room.goodsTitle}"
                            data-price = "${room.goodsPrice}">
                                <div class="h-100">
                                    <img src="${room.thumbNail}" style="width:48px; height:48px;">
                                </div>
                                <div class="ms-3">
                                    <div class="fs-4 text-truncate">
                                        <c:choose>
                                            <c:when test="${sessionScope.loginUser.userNo == room.user1No}">
                                                ${room.user2Nickname}님
                                            </c:when>
                                            <c:otherwise>
                                                ${room.user1Nickname}님
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="fs-6 text-truncate">
                                        ${room.goodsTitle} 상품
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <div class="chat-message card w-50">
                <h5 class="card-header">메시지</h5>

                <div id="messageList" class="card-body overflow-y-scroll h-100">

                    <%-- <div class="d-flex flex-row-reverse mb-3">
                        <div class="border rounded-3 p-2" style="max-width: 50%;">
                            ㅁㅁㅁㅁ
                        </div>
                    </div>

                    <div class="d-flex mb-3">
                        <div class="border rounded-3 p-2" style="max-width: 50%;">
                            ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇ
                        </div>
                    </div> --%>

                </div>

                <div class="card-footer">
                    <div class="input-group">
                        <textarea type="text" id="inputChatting" class="form-control" style="resize: none;"></textarea>
                        <button class="btn btn-outline-secondary" type="button" id="send">
                            <i class="fa-solid fa-paper-plane"></i>
                        </button>
                    </div>
                </div>

            </div>

        </div>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
		const loginUserNo = "${loginUser.userNo}";
        const enterRoomNo = "${roomNo}";
	</script>

	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script src="/resources/lib/sockjs/sockjs.min.js"></script>
	<script src="/resources/js/chat/chat.js"></script>
</body>
</html>
