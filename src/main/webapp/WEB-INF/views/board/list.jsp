<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="goodsList" value="${map.goodsList}"/>

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
	
	<main class="container mt-3 mb-5 content-w">
		
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Library</li>
			</ol>
		</nav>

		<h3>카테고리</h3>

		<div class="mt-3 row row-cols-5 row-gap-3">
			<c:forEach items="${goodsList}" var="goods">
				<a class="link-underline link-underline-opacity-0" href="/products/${goods.goodsNo}">
					<div class="col">
						<div class="card">
							<img src="/resources/images/board/dummy3.png" class="card-img-top" style="width: 100%;">
							<div class="card-body">
								<p class="card-text text-truncate">${goods.goodsTitle}</p>
								<p class="card-text">${goods.goodsPrice}원</p>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
</body>
</html>
