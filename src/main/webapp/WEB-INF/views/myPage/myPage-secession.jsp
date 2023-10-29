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
					
					<h1>회원탈퇴</h1>
					
					<form action="/myPage/secession" method="post" id="secessionFrm">

						<div class="form-floating mb-3 mt-4">
							<input type="text" class="form-control rounded-3" 
							id="id" placeholder="아이디"
							value="${sessionScope.loginUser.userId}"
							autocomplete="off"
							disabled readonly
							>
							<label for="id">아이디</label>
						</div>

						<div class="form-floating">
							<input type="password" class="form-control rounded-3 rounded-bottom-0" 
							id="secessionPw" placeholder="비밀번호" name="userPw">
							<label for="changePw">현재비밀번호</label>
						</div>

						<div class="form-floating mb-1">
							<input type="password" class="form-control rounded-3 rounded-top-0" 
							id="secessionPwConfirm" placeholder="비밀번호 확인">
							<label for="changePwConfirm">비밀번호 확인</label>
							<div class="form-text" id="secessionPwMessage">
								비밀번호를 입력해주세요
							</div>
						</div>
						
						<div class="d-flex justify-content-center">
							<button class="w-50 mt-3 mx-auto btn btn-lg rounded-3 btn-danger" type="submit">탈퇴</button>
						</div>

					</form>
				</div>
			</div>
		
		</div>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script src="/resources/js/myPage/myPageSecession.js"></script>
</body>
</html>
