<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/adminMember/memberList.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../include/adminHeader.jsp"%>

	<!-- 메인 화면 부분 -->
	<div class="admin_content_wrap">
		<h2>회원 목록</h2>
		<hr><br>
		<!-- 목록 영역 -->
		<div class="member_wrap">
			<table class="memberList" border="1">
				<thead>
					<tr>
						<th class=id_width>아이디</th>
						<th class=name_width>이름</th>
						<th class=tel_width>전화번호</th>
						<th class=addr1_width>주소</th>
						<th class=addr2_width>상세 주소</th>
						<th class=email_width>이메일</th>
						<th class=adminCk_width>상태</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.id }" /></td>
						<td><c:out value="${list.name }" /></td>
						<td><fmt:formatNumber var="licsNo" pattern="+82)###,####,####"
								value="${list.tel }" /> <c:out
								value="${fn:replace(licsNo, ',', '-')}" /></td>
						<td><c:out value="${list.addr1 }" /></td>
						<td><c:out value="${list.addr2 }" /></td>
						<td><c:out value="${list.email }" /></td>
						<td><c:out value="${list.adminCk }" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!-- 페이지 이동 -->
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">

				<ul id="pageInfo" class="pageInfo">
					<!-- 이전 페이지 버튼 -->
					<c:if test="${pageMaker.prev }">
						<li class="pageInfo_btn previous"><a
							href="${pageMaker.startPage - 1 }">&lt;</a></li>
					</c:if>

					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? 'active':'' }">
						<a href="${num }">${num }</a></li>
					</c:forEach>

					<!-- 다음 페이지 버튼 -->
					<c:if test="${pageMaker.next }">
						<li class="pageInfo_btn next"><a
							href="${pageMaker.endPage + 1 }">&gt;</a></li>
					</c:if>
				</ul>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		</form>
	
	</div>
	
	<!-- footer -->
	<%@include file="../include/adminFooter.jsp" %>
	
	<script>
	let moveForm = $("#moveForm");
	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();
				moveForm.submit();

			});

	$(".pageInfo a").on("click", function(e) {

		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/adminMember/memberList");
		moveForm.submit();
	});
	</script>

</body>
</html>