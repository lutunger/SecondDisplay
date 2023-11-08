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
					검색
				</li>
				<li class="breadcrumb-item">
					${param.val} 
				</li>
			</ol>
		</nav>

		<h3>
			"${param.val}"에 대한 검색 결과
		</h3>

		<div class="board mt-3 row row-cols-5 row-gap-3">
			<c:choose>
				<c:when test="${not empty searchList}">
					<c:forEach items="${searchList}" var="goods">
						<a class="link-underline link-underline-opacity-0" href="/detail/${goods.goodsNo}">
							<div class="col">
								<div class="card">
									<img src="${goods.thumbnail}" class="card-img-top" style="width: 100%;">
									<div class="card-body">
										<p class="card-text mb-1 text-truncate">${goods.goodsTitle}</p>
										<div class="d-flex justify-content-between">
											<span class="card-text"><b>${goods.goodsPrice}</b>원</span>
											<c:choose>
													<c:when test="${goods.goodsStatus=='A'}">
														<span class="badge text-bg-primary">판매중</span>
													</c:when>
													<c:when test="${goods.goodsStatus=='P'}">
														<span class="badge text-bg-success">예약중</span>
													</c:when>
													<c:when test="${goods.goodsStatus=='E'}">
														<span class="badge text-bg-danger">거래종료</span>
													</c:when>
												</c:choose>
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>
						검색결과가 없습니다.
					</div>
				</c:otherwise>
			</c:choose>
		</div>

	

		<c:if test="${searchList.size() == 20}">		
			<div class="d-flex justify-content-center my-5">
				<div class="spinner-border text-primary" role="status">
					<span class="visually-hidden">Loading...</span>
				</div>
			</div>
		</c:if>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script>
		const searchValue = "${param.val}";
	</script>
	<script src="/resources/js/board/search.js"></script>

</body>
</html>
