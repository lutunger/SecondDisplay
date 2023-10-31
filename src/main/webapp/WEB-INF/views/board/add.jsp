<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
				<a class="btn btn-primary btn-sm" href="/add">상품등록</a>
				<a class="btn btn-primary btn-sm" href="/shop">상품관리</a>
			</div>
		</nav>

		<h1>상품등록</h1>
		<form action="/add" method="post" >
			<table class="table text-center align-middle">


				<tr>
					<td>상품명</td>
					<td>
					<input type="text" class="form-control" 
					name="goodsTitle"
					required>
					</td>
				</tr>

				<tr>
					<td>가격</td>
					<td class="input-group">
						<input type="number" class="form-control text-end border-end-0" 
						name="goodsPrice"
						required>
						<span class="input-group-text bg-transparent">원</span>
					</td>
				</tr>
				<tr>
					<%-- <td>카테고리</td>
					<td class="d-flex">
						<select class="form-select" size="6" required>
							<option value="1">남성의류</option>
							<option value="2">여성의류</option>
						</select>
						<select class="form-select" size="6" required>
							<option value="01">상의</option>
							<option value="02">하의</option>
							<option value="03">아우터</option>
							<option value="04">악세서리</option>
							<option value="05">기타</option>
						</select>
						<input type="hidden" name="categoryNo">
					</td> --%>
				</tr>
				<tr>
					<td>설명</td>
					<td>
						<textarea class="form-control"
						rows="5" style="resize: none;" 
						name="goodsDescr"
						required></textarea>
					</td>
				</tr>

			</table>

			<div class="d-flex justify-content-end">
				<button type="submit" class="btn btn-lg btn-primary">등록</button>
			</div>

		</form>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script src="/resources/js/board/add.js"></script>
</body>
</html>
