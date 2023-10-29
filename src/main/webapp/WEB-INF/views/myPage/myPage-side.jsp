<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="card shadow-sm bg-body-tertiary rounded" style="width: 200px; height: min-content;">
  <div class="card-header text-center">
    ${sessionScope.loginUser.userId}님의
    <br>
    마이페이지 메뉴
  </div>
  <ul class="list-group list-group-flush">
    <a class="list-group-item" href="/myPage/nickname" id="sideNickname">닉네임 변경</a>
    <a class="list-group-item" href="/myPage/password" id="sidePassword">비밀번호 변경</a>
    <a class="list-group-item" href="/myPage/secession" id="sideSecession">탈퇴</a>
  </ul>
</div>