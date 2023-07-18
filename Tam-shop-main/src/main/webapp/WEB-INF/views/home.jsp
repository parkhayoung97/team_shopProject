<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드명</title>
<link rel="stylesheet" href="resources/css/home.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<!-- header -->
	<%@include file = "../views/include/userHeader.jsp" %>
	
		<!-- 메인 화면 부분 -->
		<div class="content_area">

			<p>l'eau</p>
			<input type="button" class="btn-navi" value="전제품 보기">
			<input type="button" class="btn-navi"
			onclick="window.open('https://www.google.co.kr/maps/place/TAMBURINS+Flagship+Store+Samcheong/data=!3m1!4b1!4m6!3m5!1s0x357ca310873a0217:0x48767bcb989ef154!8m2!3d37.5793989!4d126.9822207!16s%2Fg%2F11khm926xj')"
			 value="오프라인">
			 
		</div><!-- content_area end -->
		
	<!-- footer -->
	<%@include file = "../views/include/userFooter.jsp" %>

	<!-- 스크립트 -->
	<script type="text/javascript">
    </script>
	

</body>
</html>

