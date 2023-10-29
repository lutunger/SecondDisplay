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
	

	<main class="container mt-3 content-w d-flex justify-content-between">
		
		<jsp:include page="/WEB-INF/views/myPage/myPage-side.jsp"/>

		<div class="detail-wrapper w-75">
			<div class="card shadow-sm rounded">
				<div class="card-body p-5">
					
					<h1>닉네임 변경</h1>
					<p>닉네임을 변경할 수 있어요</p>
					
					<form action="/myPage/nickname" method="post" id="nicknameFrm">

						<div class="form-floating mb-3 mt-4">
							<input type="text" class="form-control rounded-3" 
							id="id" placeholder="아이디"
							value="${sessionScope.loginUser.userId}"
							autocomplete="off"
							disabled readonly
							>
							<label for="id">아이디</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3" 
							id="changeNickname" placeholder="닉네임" name="nickname"
							value="${sessionScope.loginUser.nickname}"
							autocomplete="off"
							>
							<label for="changeNickname">닉네임</label>
								<div class="form-text" id="ChangeNickMessage">
								닉네임 변경이 가능합니다.
								<br>
								한글,영어,숫자로만 2~10글자
							</div>
						</div>
						
						<div class="d-flex justify-content-center">
							<button class="w-50 mt-3 mx-auto btn btn-lg rounded-3 btn-primary" type="submit">변경</button>
						</div>

					</form>
				</div>
			</div>
		
		</div>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script src="/resources/js/myPage/myPageNickname.js"></script>
</body>
</html>
