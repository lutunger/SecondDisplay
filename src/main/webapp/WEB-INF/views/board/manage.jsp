<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<title>secondDisplay</title>
	<link rel="stylesheet" href="/resources/lib/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/lib/fontAwesome/all.min.css">
	<link rel="stylesheet" href="/resources/css/common/common.css">
	<link rel="stylesheet" href="/resources/css/board/add.css">
	<link rel="icon" href="/resources/images/common/icons8-cloth-32.png" type="image/x-icon">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<main class="container mt-3 content-w mb-5">

		<nav class="navbar border-bottom mb-3 pb-3">
			<div>
				<a type="button" class="btn btn-primary btn-sm" href="/add">상품등록</a>
				<a type="button" class="btn btn-primary btn-sm" href="/shop">상품관리</a>
			</div>
		</nav>
		
		<h1>상품관리</h1>
		
		<c:choose>
			<c:when test="${not empty goodsList}">
				<table class="table text-center align-middle border-top mt-3">
					<thead>	
						<tr>
							<th scope="col">이미지</th>
							<th scope="col">판매상태</th>
							<th scope="col">상품명</th>
							<th scope="col">가격</th>
							<th scope="col">기능</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${goodsList}" var="goods">
							<tr>
								<td><img src="/resources/images/board/dummy3.png" class="card-img-top" style="width: 100px;"></td>
								<td>${goods.goodsStatusName}</td>
								<td>
									<a class="link-underline link-underline-opacity-0" href="/detail/${goods.goodsNo}">
									${goods.goodsTitle}
									</a>
								</td>
								<td><b>${goods.goodsPrice}</b>원</td>
								<td>
									<a class="btn btn-primary" href="/edit/${goods.goodsNo}">수정</a>
									<button class="delete btn btn-primary" href="/delete/${goods.goodsNo}" data-target="${goods.goodsNo}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<div class ="text-center mt-5">
					<h3>상품이 없습니다.</h3>
				</div>
			</c:otherwise>
		</c:choose>

		<nav class="d-flex justify-content-center mt-4">
			<ul class="pagination">

			</ul>
		</nav>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script>
		const goodsListCount = ${goodsListCount}
	</script>
	<script src="/resources/js/board/manage.js"></script>
</body>
</html>
