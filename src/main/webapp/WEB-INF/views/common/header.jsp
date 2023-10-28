<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<nav class="navbar bg-body-tertiary border-bottom">
	<div class="body-w container-fluid">
		<div>
		
		</div>
		<div>
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<button type="button" class="btn btn-primary btn-sm" 
					data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
					<button type="button" class="btn btn-primary btn-sm" 
					data-bs-toggle="modal" data-bs-target="#signUp">회원가입</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-primary btn-sm">마이페이지</button>
					<a class="btn btn-primary btn-sm" href="/logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>


<nav class="navbar bg-body-tertiary sticky-top  border-bottom">
	<div class="body-w container-fluid">
		<a class="navbar-brand" href="/">
			<div>Second<i class="fa-solid fa-shirt"></i>Display</div>
		</a>
		<form class="d-flex my-auto" role="search">
			<input class="form-control me-2" type="search" placeholder="상품명 검색" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
		<div>
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<button type="button" class="btn btn-primary btn-sm"
					data-bs-toggle="modal" data-bs-target="#loginModal">
					판매하기</button>
					<button type="button" class="btn btn-primary btn-sm"
					data-bs-toggle="modal" data-bs-target="#loginModal"
					>내상점</button>
					<button type="button" class="btn btn-primary btn-sm"
					data-bs-toggle="modal" data-bs-target="#loginModal"
					>채팅</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-primary btn-sm">판매하기</button>
					<button type="button" class="btn btn-primary btn-sm">내상점</button>
					<button type="button" class="btn btn-primary btn-sm">채팅</button>

				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div class="body-w container-fluid mt-3 mb-2">
		<div>
			<button type="button" class="btn btn-primary btn-sm">남성의류</button>
			<button type="button" class="btn btn-primary btn-sm">여성의류</button>
			<button type="button" class="btn btn-primary btn-sm">전체보기</button>
		</div>
	</div>

</nav>

<!-- 로그인 모달 -->
<jsp:include page="/WEB-INF/views/user/login.jsp"/>

<%-- 회원가입 모달 --%>
<jsp:include page="/WEB-INF/views/user/signUp.jsp"/>