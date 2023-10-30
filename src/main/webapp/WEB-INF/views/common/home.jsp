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
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	

	<main class="mx-auto mt-3 content-w">
		
		<div>
			<img src="/resources/images/common/banner.png" style="width:100%;">
		</div>

		<section class="mt-5">
			
			<div class="d-flex justify-content-between align-items-center">
				<h4>최신매물</h4>
				<a class="link-primary link-underline-opacity-0" href="/category/300">더보기</a>
			</div>
			
			<div class="mt-3 row row-cols-5 row-gap-3">
				<c:forEach items="${goodsList}" var="goods">
					<a class="link-underline link-underline-opacity-0" href="/detail/${goods.goodsNo}">
						<div class="col">
							<div class="card">
								<img src="/resources/images/board/dummy3.png" class="card-img-top" style="width: 100%;">
								<div class="card-body">
									<p class="card-text mb-1 text-truncate">${goods.goodsTitle}</p>
									<p class="card-text"><b>${goods.goodsPrice}</b>원</p>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			
			<div class="d-flex justify-content-center my-5">
				<A class="btn btn-primary m-0" href="/category/300">더보기</A>
			</div>

		</section>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
