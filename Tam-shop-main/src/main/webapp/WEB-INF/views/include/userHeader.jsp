<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드명</title>
<link rel="stylesheet" href="/resources/css/include/userHeader.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<!-- 윗부분 바 -->
			<div class="top_gnb_area">
				<a class="logo"  href="/">
					<img class="user_header_logo" src="/resources/img/logo.png">
				</a>
				<ul class="top_left">
					<li><a class="user_header_a" href="/category/cosmeticMain">제품보기</a></li>
				</ul>
				
				<ul class="top_right">
					<!-- 로그인 x -->
					<c:if test= "${member == null}">
						<li><a class="user_header_a" href="/login/loginPage">로그인</a></li>
						<li><a class="user_header_a" href="/join/joinPage">회원가입</a></li>
						<li><a class="user_header_a" href="/notice/main">고객센터</a></li>
					</c:if>
				
					<!-- 로그인 o -->	
					<c:if test="${member != null}">
						<div class="login_success_area">
							<!-- 관리자 계정 -->
							<c:if test="${member.adminCk == 1 }">	
								<li>관리자 님</li>		
								<li><a href="/adminProd/list">관리자 페이지</a></li>
								<li><a class="user_header_a" href="/notice/main">고객센터</a></li>						
								<li><a href="/login/logout.do">로그아웃</a></li>
							</c:if>
							
							<!-- 일반회원 계정 -->
							<c:if test="${member.adminCk == 0 }"> 
							<li>${member.name} 님</li>
								<li><a href="/userOrder/myOrder">마이룸</a></li>
								<li><a href="/cart/${member.id}">장바구니</a></li>
								<li><a class="user_header_a" href="/notice/main">고객센터</a></li>
								<li><a href="/login/logout.do">로그아웃</a></li>
							</c:if>
						</div>
					</c:if>
				</ul>
			</div>