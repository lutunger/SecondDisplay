<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>

	<nav class="navbar bg-body-tertiary border-bottom">
		<div class="body-w container-fluid">
			<div>
			
			</div>
			<div>
				<button type="button" class="btn btn-primary btn-sm">로그인</button>
				<button type="button" class="btn btn-primary btn-sm">회원가입</button>
			</div>
		</div>
	</nav>

	<div class="sticky-top">

		<nav class="navbar bg-body-tertiary">
			<div class="body-w container-fluid">
				<a class="navbar-brand" href="/">
					<div>Second<i class="fa-solid fa-shirt"></i>Display</div>
				</a>
				<form class="d-flex my-auto" role="search">
					<input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div>
					<button type="button" class="btn btn-primary btn-sm">Primary</button>
					<button type="button" class="btn btn-primary btn-sm">Primary</button>
					<button type="button" class="btn btn-primary btn-sm">Primary</button>
				</div>
			</div>
		</nav>

		<nav class="navbar bg-body-tertiary border-bottom">
			<div class="body-w container-fluid">
				<div>
					<button type="button" class="btn btn-primary btn-sm">남성의류</button>
					<button type="button" class="btn btn-primary btn-sm">여성의류</button>
					<button type="button" class="btn btn-primary btn-sm">전체보기</button>
				</div>
			</div>
		</nav>

	</div>

</header>