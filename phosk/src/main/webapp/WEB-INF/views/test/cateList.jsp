<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head></head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
/* overflow: hidden 해야 카테고리 변경시 둠칫둠칫두둠칫 안움직임 */
	overflow: scroll;
	display: block;
}
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
					style="color: blue;">${cateList.category_name}</button>
			</c:forEach>
		</div>
		<div class="menueContainer">
			<div class="manage_con">
				<button value="${nowPage.nowCate}" type="button" id="manage_btn">메뉴관리</button>
			</div>
			<div id="menue_eachform">
				<c:forEach items='${cateTest}' var='cateTest'>
					<div class='menueInfo_container'>
						<button name="${cateTest.menue_name}"
							value="${cateTest.category_num}" id="detailMenue_open">상세보기</button>
						<div class="menueInfo menueInfo_top">
							<span class="menue_text menue_text_top menue_info_name">음식명
								: ${cateTest.menue_name}</span> <span
								class="menue_text menue_text_top menue_info_price">가격 : <fmt:formatNumber
									value="${cateTest.menue_price}"></fmt:formatNumber>&nbsp;원
							</span>
						</div>
						<div class="menueInfo menueInfo_bottom">
							<span class="menue_text menue_info_detail">${cateTest.etc}</span>
						</div>
					</div>

				</c:forEach>
				<!-- 밥먹고와서 해야할부분 해당 카테고리 안에 메뉴가 없을경우 나타낼방법 생각하기 -->
			</div>
		</div>
	</div>

	<form id="moveForm" method="get">
		<!-- cateTest 라는 name으로 menueManage 페이지 이동시키면 현재 보고있던 카테고리 바로뜰수 있을거 같음 -->
		<%-- <input type="text" name="nowCate" value="${nowCate.nowCate}"/> --%>
	</form>

	<script>
		$(document)
				.ready(
						function() {
							$(document)
									.on(
											'click',
											'button[id="detailMenue_open"]',
											function(e) {
												let form = $("#moveForm");
												var menueName = $(this).attr(
														'name');
												console.log(menueName);
												form
														.append("<input type='hidden' name='menue_name' value='"
													+ menueName + "' />");
												form.attr("action",
														"/test/detailInfo");
												form.submit();
											});
						});
		$(document).on("click", "#manage_btn", function() {
			$('#moveForm').append('<input type="text" name="cateTest" value="' + $(this).val() + '"/>');
			$('#moveForm').attr('action', '/test/menueManage');
			$('#moveForm').submit();
		});
		$(document).on("click", "button[class='category_names']", function() {
			var cateTest = $(this).val();
			/* console.log(cateTest + " ajax 부분"); */
			$.ajax({
				url : "/test/cateList",
				type : "GET",
				data : {
					cateTest : cateTest
				},
				success : function(testData) {
					/* document.body.innerHTML = testData; */
					
					/* body 전체를 수정할경우 단점 */
					/* 페이징이 안됨, html의 하위 태그 전부 body에 복사되니 style title등 모두 한번더 생성됨 */
					console.log(cateTest);
					$('#manage_btn').val(cateTest);
					
					
					$('#moveForm').append('<input type="text" name="cateTest" value="' + cateTest + '"/>');
					$('#moveForm').attr('action', '/test/cateList');
					$('#moveForm').submit();
					
					/* form 으로 페이징 할경우 잘작동됨 하지만 페이징 번호와 선택한 카테고리를 get방식으로 다 보내니 url이 지저분해지는 느낌... */
					/* 해결 방법은...? cateTest 하나로 페이징 할수있나..? */
					/* 할수있다면 백에서 cateTest의 받아온 값으로 임의적으로 nowCate에 넣었을경우 생기는 문제점은? */
					
					/* location.replace('/test/cateList?nowCate=${nowPage.nowCate}&cateTest=' + cateTest); */

					/* replace 의 단점 페이징의 기준이 되는 카테고리를 저장할수없음. */
					
					/* 내일 등원해서 테스트 할것 ajax가 아닌 moveForm을 이용한 카테고리 메뉴 이동 */
				}
			});

		});
	</script>
</body>
</html>