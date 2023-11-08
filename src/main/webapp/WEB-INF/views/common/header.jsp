<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<nav class="navbar bg-body-tertiary border-bottom">
	<div class="content-w container-fluid">
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
					<a type="button" class="btn btn-primary btn-sm" href="/myPage/nickname">마이페이지</a>
					<a class="btn btn-primary btn-sm" href="/logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>


<nav class="navbar bg-body-tertiary sticky-top border-bottom d-flex flex-column">

	<div class="content-w container-lg">
		<a class="navbar-brand" href="/">
			<div>Second<i class="fa-solid fa-shirt"></i>Display</div>
		</a>
		<form class="d-flex my-auto" action="/search" method="get">
			<input class="form-control me-2" type="search" name="val">
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
					>내상품</button>
					<button type="button" class="btn btn-primary btn-sm"
					data-bs-toggle="modal" data-bs-target="#loginModal"
					>채팅</button>
				</c:when>
				<c:otherwise>
					<a type="button" class="btn btn-primary btn-sm" href="/add">판매하기</a>
					<a type="button" class="btn btn-primary btn-sm" href="/manage">내상품</a>
					<a type="button" class="btn btn-primary btn-sm" href="/chat">채팅</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div class="content-w container-lg mt-3 mb-2">
		<div>

			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					남성의류
				</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/category/101">상의</a></li>
					<li><a class="dropdown-item" href="/category/102">하의</a></li>
					<li><a class="dropdown-item" href="/category/103">아우터</a></li>
					<li><a class="dropdown-item" href="/category/104">악세서리</a></li>
					<li><a class="dropdown-item" href="/category/105">기타</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/category/100">남성의류 전체</a></li>
				</ul>
			</div>

			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					여성의류
				</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/category/201">상의</a></li>
					<li><a class="dropdown-item" href="/category/202">하의</a></li>
					<li><a class="dropdown-item" href="/category/203">아우터</a></li>
					<li><a class="dropdown-item" href="/category/204">악세서리</a></li>
					<li><a class="dropdown-item" href="/category/205">기타</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/category/200">여성의류 전체</a></li>
				</ul>
			</div>

		</div>
	</div>

</nav>

<jsp:include page="/WEB-INF/views/user/login.jsp"/>

<jsp:include page="/WEB-INF/views/user/signUp.jsp"/>