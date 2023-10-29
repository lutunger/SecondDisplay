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

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	

	<main class="container-md mt-3 content-w">
		
        <jsp:include page="/WEB-INF/views/myPage/myPage-side.jsp"/>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="/resources/lib/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/resources/lib/jquery/jquery-3.7.1.min.js"></script>
</body>
</html>
