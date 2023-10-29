<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
				<a class="link-primary link-underline-opacity-0"href="">더보기</a>
			</div>
			
			<div class="mt-3 row row-cols-5 row-gap-3">
				<%for(int i = 0; i < 30; i++){ %>
					<div class="col ">
						<div class="card">
							<img src="https://dummyimage.com/150x150/000/fff" class="card-img-top" style="width: 100%;">
							<div class="card-body">
								<p class="card-text">제품이름</p>
								<p class="card-text">가격</p>
							</div>
						</div>
					</div>
				<%} %>

			</div>
			
			<div class="d-flex justify-content-center my-5">
				<button type="button" class="btn btn-primary m-0">더보기</button>
			</div>

		</section>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
</body>
</html>
