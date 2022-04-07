<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head></head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div {
	margin: 0 auto;
	display: block;
}

.categoryCon, .menueContainer, .menueInfo_container, .category_names {
	border: 1px solid black;
}

button {
	cursor: pointer;
}

.mainContainer {
	width: 1080px;
	height: 800px;
}

#insert_btn {
	width: 100%;
	margin: 0 auto;
}

.categoryCon {
	width: 320px;
	height: 800px;
	float: left;
	height: 100%;
}

.category_names {
	width: 300px;
	height: 50px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
}

.menueContainer {
	width: 700px;
	float: right;
	height: 100%;
	overflow: auto;
}

#manage_btn {
	display: block;
}

#detailMenue_open {
	width: 50px;
	height: 50px;
	margin: 5px auto;
	float: right;
}

.menue_text {
	margin: 0 20px 0 10px;
}

.menue_text_top {
	
}

.menueInfo_container {
	height: 70px;
}

.menueInfo {
	margin: 5px 0 10px;
}

.menueInfo_top, .menueInfo_bottom {
	width: 550px;
	float: left;
}
</style>
<body>
	<h1>카테고리페이지입니다</h1>
	<div class="mainContainer">
		<div class="categoryCon">
			<c:forEach items="${cateList}" var="cateList">
				<button value="${cateList.category_num}" class="category_names"
					onclick="moveCategory(this)" style="color: blue;">${cateList.category_name}</button>
			</c:forEach>
		</div>
		<div class="menueContainer">
			<div class="manage_con">
				<button value="${nowPage.nowCate}" type="button" id="manage_btn">메뉴관리</button>
			</div>
			<div id="menue_eachform">
				<c:choose>
					<c:when test="${!empty cateTest }">
						<c:forEach items='${cateTest}' var='cateTest'>
							<div class='menueInfo_container'>
								<button name="${cateTest.menue_name}"
									value="${cateTest.category_num}" id="detailMenue_open">상세보기</button>
								<div class="menueInfo menueInfo_top">
									<span class="menue_text menue_text_top menue_info_name">음식명
										: ${cateTest.menue_name}</span> <span
										class="menue_text menue_text_top menue_info_price">가격 :
										<fmt:formatNumber value="${cateTest.menue_price}"></fmt:formatNumber>&nbsp;원
									</span>
								</div>
								<div class="menueInfo menueInfo_bottom">
									<span class="menue_text menue_info_detail">${cateTest.etc}</span>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div>
							<button value="${nowPage.nowCate}" id="insert_btn">메뉴등록</button>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<form id="moveForm" method="get">
		<%-- <input type="text" name="nowCate" value="${nowCate.nowCate}"/> --%>
	</form>
	<script>
	let form = $("#moveForm");
	$('#insert_btn').on(
			'click',
			function() {
				form.attr('method', 'get');
				form.attr('action', '/test/insertMenue');
				form.append('<input type="hidden" name="nowCate" value="'
						+ $(this).val() + '"/>');
				form.submit();
			});
		$(document)
				.ready(
						function() {
							$(document)
									.on(
											'click',
											'button[id="detailMenue_open"]',
											function(e) {

												var menueName = $(this).attr(
														'name');
												console.log(menueName);
												form
														.append("<input type='hidden' name='menue_name' value='"+ menueName + "' />");
												form.attr("action",
														"/test/detailInfo");
												form.submit();
											});
						});
		$(document).on(
				"click",
				"#manage_btn",
				function() {
					form.append(
							'<input type="text" name="cateTest" value="'
									+ $(this).val() + '"/>');
					form.attr('action', '/test/menueManage');
					form.submit();
				});
		function moveCategory(e) {
			var cateVal = $(e).val();
			location.href = "/test/cateList?cateTest=" + cateVal;
		};
		/* ajax를 통해 화면 전환을 시키니 2번씩 실행되어서 ajax를 삭제함. */
	</script>
</body>
</html>