<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="border-top bg-body-tertiary d-flex align-items-center justify-content-center">

	<nav class="bg-body-tertiary d-flex align-items-center">
		<div class="content-w container-fluid d-flex align-items-end">
			<h2>
				Second<i class="fa-solid fa-shirt"></i>Display
			</h2> 
				ⓒ2023 Company, Inc
		</div>
	</nav>

</footer>

<c:if test="${not empty message}" >

	<script>
		alert('${message}');
	</script>

</c:if>