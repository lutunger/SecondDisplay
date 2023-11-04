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
				<a class="btn btn-primary btn-sm" href="/manage">상품관리</a>
			</div>
		</nav>

		<h1>상품등록</h1>
		<form action="/edit" method="post" >	
			<table class="table text-center align-middle">
				<input type="hidden" name="goodsNo" value="${goods.goodsNo}">

				<tr>
					<td class="w-25">
					이미지
					</td>
					<td class="d-flex justify-content-between">

						<div class="imgbox position-relative border rounded-2">
								<img src="${goods.imageList[0].filePath}"	class="preview img-fluid">
								<label class="position-absolute top-50 start-50 translate-middle" for="img1">
									<i class="img-plus fa-solid fa-camera fa-4x" style="cursor:pointer;"></i>
								</label>	
								<input type="file" class="inputImage" name="images" id="img1">
								<span class="badge text-bg-primary position-absolute top-0 start-0">썸네일</span>
								<i class="delete-image position-absolute top-0 end-0 fa-solid fa-xmark fa-2x" style="cursor:pointer;"></i>
							</div>
						
							<div class="imgbox imgbox position-relative border rounded-2">
								<label class="position-absolute top-50 start-50 translate-middle" for="img2">
									<i class="img-plus fa-solid fa-camera fa-4x" style="cursor:pointer;"></i>
								</label>
								<img src="${goods.imageList[1].filePath}" class="preview img-fluid">
								<input type="file" class="inputImage" name="images" id="img2">
								<i class="delete-image position-absolute top-0 end-0 fa-solid fa-xmark fa-2x" style="cursor:pointer;"></i>
							</div>
						
							<div class="imgbox imgbox position-relative border rounded-2">
								<label class="position-absolute top-50 start-50 translate-middle" for="img3">
									<i class="img-plus fa-solid fa-camera fa-4x" style="cursor:pointer;"></i>
								</label	bel>
								<img src="${goods.imageList[2].filePath}" class="preview img-fluid">
								<input type="file" class="inputImage" name="images" id="img3">
								<i class="delete-image position-absolute top-0 end-0 fa-solid fa-xmark fa-2x" style="cursor:pointer;"></i>
							</div>
					</td>
				</tr>

				<tr>
					<td>상품명</td>
					<td>
					<input type="text" class="form-control" 
					name="goodsTitle"
					value="${goods.goodsTitle}"
					required>
					</td>
				</tr>

				<tr>
					<td>가격</td>
					<td class="input-group">
						<input type="number" class="form-control text-end border-end-0" 
						name="goodsPrice"
						value="${goods.goodsPrice}"
						required>
						<span class="input-group-text bg-transparent">원</span>
					</td>
				</tr>
				<tr>
					<td>
						거래상태
					</td>
					<td>
						<select id="status" class="form-select w-25" name="goodsStatus" value="${goods.goodsStatus}">
							<option value="A">판매중</option>
							<option value="P">예약중</option>
							<option value="E">판매완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td class="d-flex">
						<select class="form-select" size="6" id="category1" required>
							<option value="1">남성의류</option>
							<option value="2">여성의류</option>
						</select>
						<select class="form-select" size="6" id="category2" required>
							<option value="01">상의</option>
							<option value="02">하의</option>
							<option value="03">아우터</option>
							<option value="04">악세서리</option>
							<option value="05">기타</option>
						</select>
						<input type="hidden" id="categoryNo" 
						name="categoryNo" value="${goods.categoryNo}">
					</td>
				</tr>
				<tr>
					<td>설명</td>
					<td>
						<textarea class="form-control"
						rows="5" style="resize: none;" 
						name="goodsDescr"
						required>${goods.goodsDescr}</textarea>
					</td>
				</tr>

			</table>

			<div class="d-flex justify-content-end">
				<button type="submit" class="btn btn-lg btn-primary">수정</button>
			</div>

		</form>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
	<script src="/resources/js/board/edit.js"></script>
</body>
</html>
