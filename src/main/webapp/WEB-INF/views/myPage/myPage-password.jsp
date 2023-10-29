<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>secondDisplay</title>
	<link rel="stylesheet" href="/resources/lib/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/lib/fontAwesome/all.min.css">
	<link rel="stylesheet" href="/resources/css/common/common.css">
	<link rel="icon" href="/resources/images/common/icons8-cloth-32.png" type="image/x-icon">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	

	<main class="container-md mt-3 content-w d-flex justify-content-between">
		
		<jsp:include page="/WEB-INF/views/myPage/myPage-side.jsp"/>

		<div class="detail-wrapper w-75">
			<div class="card shadow-sm rounded">
				<div class="card-body p-5">
					
					<h1>개인정보변경</h1>
					<p>닉네임과 비밀번호를 변경할 수 있어요</p>
					
					<form action="/myPage/change" method="post">
						<div class="form-floating mb-3 mt-4">
							<input type="text" class="form-control rounded-3" 
							id="Id" placeholder="아이디" name="userId"
							value="${sessionScope.loginUser.userId}"
							autocomplete="off"
							disabled readonly
							>
							<label for="Id">아이디</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3" 
							id="changeNickname" placeholder="닉네임" name="changeNickname"
							value="${sessionScope.loginUser.nickname}"
							autocomplete="off"
							disabled readonly
							>
							<label for="changeNickname">닉네임</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3" 
							id="loginId" placeholder="Id" name="userId"
							value="${sessionScope.loginUser.userId}"
							autocomplete="off"
							disabled readonly
							>
							<label for="loginId">Id</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3" 
							id="loginId" placeholder="Id" name="userId"
							value="${sessionScope.loginUser.userId}"
							autocomplete="off"
							disabled readonly
							>
							<label for="loginId">Id</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3" 
							id="loginId" placeholder="Id" name="userId"
							value="${sessionScope.loginUser.userId}"
							autocomplete="off"
							disabled readonly
							>
							<label for="loginId">Id</label>
						</div>
						
						<div class="d-flex justify-content-center">
							<button class="w-25 mt-2 mb-0 btn btn-lg rounded-3 btn-primary" type="submit">변경하기</button>
						</div>

					</form>


				</div>
			</div>
		
		</div>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script src="/resources/js/myPage/myPage.js"></script>
</body>
</html>
