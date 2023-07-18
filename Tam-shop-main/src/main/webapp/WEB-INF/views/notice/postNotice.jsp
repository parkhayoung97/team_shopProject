<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/postNotice.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file = "../include/userHeader.jsp" %>
	
	<!-- 사이드 바 -->
	<%@ include file="/WEB-INF/views/include/sideBar.jsp"%>
	
	<!-- 메인 화면 부분 -->
	<div class="content_area">
	
		<h1>공지글 등록</h1>
	<form action="/notice/postNotice" method="post">
		<div class="input_wrap">
		제목:	<input name="noticeTitle">
		</div>
		<div class="input_wrap">
		내용:	<textarea rows="3" name="noticeContent"></textarea>
		</div>		
		<button class="btn">등록</button>
	</form>
	
	</div>
	
	</section>
	</div><!-- column-container end -->
	
	<!-- footer -->
	<%@include file="../include/userFooter.jsp" %>

</body>
</html>