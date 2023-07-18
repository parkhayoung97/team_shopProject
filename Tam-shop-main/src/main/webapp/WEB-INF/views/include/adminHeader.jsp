<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/include/adminHeader.css">
    
	<div class="wrapper">
		<div class="wrap">
		
			<!-- 윗부분 바 -->
			<div class="top_gnb_area">
				<a class="logo"  href="/">
					<img class="user_header_logo" src="/resources/img/logo.png">
				</a>
				<span class="top_left">관리자 페이지</span>
				
				<ul class="top_right">
					<li><a href="/">메인 페이지</a></li>
					<li><a href="/login/logout.do">로그아웃</a></li>
					<li><a href="/notice/main">고객센터</a></li>
				</ul>
			</div>
			
			<div class="column-container">
			<!-- 메인 화면 부분 -->
			<div class="content_area">
				<!-- navigation -->
				<div class="admin_navi_wrap">
					<ul>
						<li class="admin_list_01"><a href="/adminProd/list">Product List</a></li>
						<li class="admin_list_02"><a href="/adminOrder/orderList">Order List</a></li>
						<li class="admin_list_03"><a href="/adminMember/memberList">Member List</a></li>
					</ul>
				</div>
				<div class="admin_wrap">