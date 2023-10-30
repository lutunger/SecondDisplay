<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
				<li class="breadcrumb-item">
					1차보기
				</li>
				<li class="breadcrumb-item">
					2차보기
				</li>
			</ol>
		</nav>

		<h3>
			전체보기
		</h3>

		<div class="board mt-3 row row-cols-5 row-gap-3">
			<c:forEach items="${goodsList}" var="goods">
				<a class="link-underline link-underline-opacity-0" href="/products/${goods.goodsNo}">
					<div class="col">
						<div class="card">
							<img src="/resources/images/board/dummy3.png" class="card-img-top" style="width: 100%;">
							<div class="card-body">
								<p class="card-text mb-1 text-truncate">${goods.goodsTitle}</p>
								<span class="card-text"><b>${goods.goodsPrice}</b>원</span>
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
	<script>
		const categoryNo = ${categoryNo};
	</script>
	<script src="/resources/js/board/list.js"></script>

</body>
</html>
