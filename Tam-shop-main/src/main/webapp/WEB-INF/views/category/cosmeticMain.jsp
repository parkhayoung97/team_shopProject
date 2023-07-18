<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/category/cosmeticMain.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>

	<!-- header -->
	<%@include file = "../include/userHeader.jsp" %>

		<!-- 메인 화면 부분 -->
		<div class="content_area">
		
			<!-- 카테고리 -->
			<div class="category">
				<div style="display: inline-block;">
					<a href="/category/cosmeticMain">전체보기</a></div>
				<c:forEach var="cate" items="${cateAll }">
				<div style="display: inline-block; margin-left: 20px;">
					<a href="/category/cosmeticMain/${cate.cateCode }"><img class="cate_img" src="/resources/img/category_${cate.cateCode }.png"><br><br>${cate.cateName }</a><br>
				</div>
				</c:forEach>
			</div>
			
			<hr>
		 
			<!-- 게시물 o -->
			<c:if test="${prodCheck != 'empty'}">
			<div class="prod_list">
			
				<!-- 상품 -->
				<c:forEach items="${prodAll}" var="prod">
					<a href="/detail/cosmeticDetail/${prod.prodNum }" style="color: black;">
					<div class="prodBox">		
						<img class="prodImg" src="/resources/image_1/s_${prod.img1 }" style="width: 300px; height: 300px;"><br>
						${prod.prodName}
						${prod.price}
					</div>
					</a>
				</c:forEach>
				
				<div style="clear: both;"></div>
				<!-- 페이지 이동 인터페이스 -->
				<div class="pageMaker_wrap">
					<ul class="pageMaker">
	
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev }">
							<li class="pageMaker_btn prev"><a
								href="${pageMaker.pageStart -1}">이전</a></li>
						</c:if>
	
						<!-- 페이지 번호 -->
						<c:forEach begin="${pageMaker.pageStart }"
							end="${pageMaker.pageEnd }" var="num">
							<li
								class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
	
						<!-- 다음 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageMaker_btn next"><a
								href="${pageMaker.pageEnd + 1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div><!-- prod_list end -->
			
			<form id="moveForm" action="/category/cosmeticMain" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="type" value="C">
			</form>
		</c:if>
		
		<!-- 게시물 x -->
		<c:if test="${prodCheck == 'empty'}">
			<div class="table_empty">상품이 없습니다.</div>
		</c:if>
		
	</div>
	
	<!-- footer -->
	<%@include file = "../include/userFooter.jsp" %>
		
	<!-- 스크립트 -->
	<script>
	
		/* 페이지 이동 버튼 */
		const moveForm = $('#moveForm');

		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});
		
		// 검색 타입 선택 selected
		$(document).ready(function(){
			
			const selectedType = '<c:out value="${pageMaker.cri.type}"/>';
			if(selectedType != ""){
				$("select[name='type']").val(selectedType).attr("selected", "selected");	
			}
			
		});
		
	</script>

</body>
</html>