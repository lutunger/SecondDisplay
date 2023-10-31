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
				<tr>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
			</tbody>
		</table>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script src="/resources/js/board/add.js"></script>
</body>
</html>
