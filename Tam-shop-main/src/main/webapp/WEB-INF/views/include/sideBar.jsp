<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.sidebar {
	width: 200px;
	float: left;
}

.sidebar-menu {
	list-style-type: none;
	padding: 0;
	margin: 0;
	width: 90%;
}

.menu-item {
	margin-bottom: 10px;
}

.menu-item a {
	display: block;
	padding: 10px;
	color: #333;
	text-decoration: none;
	transition: background-color 0.3s ease;
}

.menu-item a:hover {
	background-color: #e0e0e0;
}

.menu-item.active a {
	background-color: #ddd;
}

/* 구간 나누기 */
/* 칼럼 컨테이너 */
.column-container {
	width: 70%;
	overflow: hidden;
	margin: 0 auto;
	margin-top: 100px;
}

/* 왼쪽 칼럼 */
.column-left {
	float: left;
	width: 20%;
	text-align: left;
}

/* 오른쪽 칼럼 */
.column-right {
	float: right;
	width: 80%;
	text-align: left;
}
</style>
</head>
<body>

	<div class="column-container">		
	<!-- 왼쪽 -->
	<section class="column-left">
	
		<!-- 마이페이지 사이드바 -->
		<div class="sidebar">
			<ul class="sidebar-menu">
				<li><h2>마이페이지</h2></li>
				<li><h3>${member.id }</h3></li>
				<!-- 회원 -->
				<c:if test="${member.id != null }">
				<li class="menu-item">
					<span>쇼핑 정보</span>
					<a href="/userOrder/myOrder">주문/배송</a>
					<a href="#">적립금 현황</a>
				</li>
				<li class="menu-item">
					<span>계정 정보</span>
					<a href="/myPage/loginConfirm">회원정보 수정</a>
				</li>
				</c:if>
				
				<!-- 비회원 -->
				<c:if test="${member.id == null }">
				<li class="menu-item">
					<span>쇼핑 정보</span>
					<a href="#">주문/배송</a>
				</li>
				</c:if>
				
				<li class="menu-item">
					<span>고객센터</span>
					<a href="/notice/main">공지사항</a>
					<a href="#">고객서비스</a>
					<a href="#">자주묻는 질문</a>
					<a href="#">1:1 문의하기</a>
				</li>
			</ul>
		</div>
	</section><!-- column-left end -->
	
	<!-- 오른쪽 -->
	<section class="column-right">