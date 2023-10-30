<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	
	<main class="container mt-3 content-w">

	<div class="goodsWrapper d-flex">
		<div id="goodsImg" class="carousel slide w-50">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#goodsImg" 
				data-bs-slide-to="0" class="active" aria-current="true"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" 
				data-bs-slide-to="1" aria-label="Slide 2"></button>
				<%-- 
				<button type="button" data-bs-target="#carouselExampleIndicators" 
				data-bs-slide-to="2" aria-label="Slide 3"></button>
				--%>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
				<img src="/resources/images/board/dummy3.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
				<img src="/resources/images/board/dummy3.png" class="d-block w-100" alt="...">
				</div>
				<%-- <div class="carousel-item">
				<img src="..." class="d-block w-100" alt="...">
				</div> --%>
			</div>
			<button class="carousel-control-prev" type="button" 
			data-bs-target="#goodsImg" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" 
			data-bs-target="#goodsImg" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<div class="card w-50">
			<div class="card-body p-5">

				<div class="card-text border-bottom pb-3 mb-3">
					<div class="fs-3">${goods.goodsTitle}</div>
					<div class="fs-2"><b>${goods.goodsPrice}</b>원</div>
				</div>

				<table class="table table-borderless w-75">
					<tr>
						<td>조회수</td>
						<td>${goods.viewCount}</td>
					</tr>
					<tr>
						<td>올린시간</td>
						<td>${goods.enrollDate}</td>
					</tr>
					<tr>
						<td>거래상태</td>
						<td>${goods.goodsStatusName}</td>
					</tr>
				</table>

				<div class="goodsAction d-flex flex-row-reverse justify-content-center mt-5">
					<a class="btn btn-primary btn-lg" href="#">채팅하기</a>
				</div>

			</div>
		</div>

	</div>


	<div class="card">
		<div class="card-body p-5">
			<p class="card-text border-bottom text-body-secondary">
				상품정보
			</p>
			<p class="card-text">
				${goods.goodsDescr}
			</p>
		</div>
	</div>


	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script src="/resources/js/board/detail.js"></script>
</body>
</html>
