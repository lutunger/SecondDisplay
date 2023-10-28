<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="signUp" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-dialog-centered" style="width: 400px;">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">

		<h1 class="fw-bold mb-0 fs-2">회원가입</h1>

		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		
      </div>
      <div class="modal-body px-5 pt-0 pb-1">
		<form id="signUpFrm" action="/signUp" method="post">
			<div class="form-floating mb-1">
				<input type="text" class="form-control rounded-3" 
				id="signUpId" placeholder="아이디" name="userId"
				autocomplete="off">
				<label for="signUpId">아이디</label>
				<div class="form-text" id="idMessage">
					영문자로 시작하는 영문자 또는 숫자 4~20자로 시작하는 아이디를 입력해주세요
				</div>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control rounded-3 rounded-bottom-0" 
				id="signUpPw" placeholder="비밀번호" name="userPw">
				<label for="signUpPw">비밀번호</label>
			</div>
			<div class="form-floating mb-1">
				<input type="password" class="form-control rounded-3 rounded-top-0" 
				id="signUpPwConfirm" placeholder="비밀번호 확인">
				<label for="signUpPwConfirm">비밀번호 확인</label>
				<div class="form-text" id="pwMessage">
					비밀번호를 입력해주세요
					<br>
					영어,숫자,특수문자(!,@,#,-,_) 4~20글자
				</div>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control rounded-3" 
				id="signUpNickname" placeholder="닉네임" name="nickname"
				autocomplete="off">
				<label for="signUpNickname">닉네임</label>
				<div class="form-text" id="nickMessage">
					닉네임을 입력해주세요
					<br>
					한글,영어,숫자로만 2~10글자
				</div>
			</div>
			</div>
			<button class="w-75 mb-5 mx-auto btn btn-lg rounded-3 btn-primary" type="submit">회원가입</button>
		</form>
      </div>
    </div>
  </div>
</div>

<script src="/resources/js/user/signUp.js"></script>