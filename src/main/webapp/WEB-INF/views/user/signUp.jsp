<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="loginModal">

  <div class="modal-dialog modal-dialog-centered" style="width: 380px;">

    <div class="modal-content rounded-4 shadow">

      <div class="modal-header p-5 pb-4 border-bottom-0">

		<h1 class="fw-bold mb-0 fs-2">회원가입</h1>

		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		
      </div>

      <div class="modal-body px-5 pt-0 pb-4">
		<form class="">
			<div class="form-floating mb-3">
				<input type="email" class="form-control rounded-3" id="floatingInput" placeholder="Id">
				<label for="floatingInput">Id</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password">
				<label for="floatingPassword">Password</label>
			</div>
			<div class="form-check text-start my-3">
				<input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
				<label class="form-check-label" for="flexCheckDefault">
					ID 기억하기
				</label>
			</div>
			<button class="w-100 mt-2 mb-0 btn btn-lg rounded-3 btn-primary" type="submit">로그인</button>
		</form>
      </div>

    </div>

  </div>


</div>