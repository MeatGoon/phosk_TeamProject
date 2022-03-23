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
div {
	margin: 0 auto;
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

#detailMenue_open, #checked_menue {
	width: 50px;
	height: 50px;
	margin: 5px auto;
}

#detailMenue_open {
	float: right;
}

#checked_menue {
	float: left;
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

/* 모달 스타일 */
#modal {
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	width: 300px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>
<body>
	<script>
		$(document)
				.ready(
						function() {
							console.log('레디까지 완료');
							$(document)
									.on(
											"click",
											"button[class='category_names']",
											function() {
												var carNum = $(this).val();
												console.log(carNum);
												$(".menueInfo_container")
														.remove();

												<c:forEach items='${meList}' var='meList'>

												var test123 = <c:out value="${meList.category_num}"/>;

												if (test123 == carNum) {
													console.log("아니 여기옴?");
													$(".menueContainer")
															.prepend(
																	"<div class='menueInfo_container'>"
																			+ "<button name='${meList.menue_name}/${meList.category_num}' id='detailMenue_open'>상세보기</button>"
																			+ "<div class='menueInfo menueInfo_top'>"
																			+ "<span class='menue_text menue_text_top menue_info_name'>음식명 : ${meList.menue_name}</span>"
																			+ "<span class='menue_text menue_text_top menue_info_price'>가격 : <fmt:formatNumber value='${meList.menue_price}'></fmt:formatNumber>&nbsp;원</span>"
																			+ "</div>"
																			+ "<div class='menueInfo menueInfo_bottom'>"
																			+ "<span class='menue_text menue_info_detail'>${meList.etc}</span>"
																			+ "</div>"
																			+ "</div>");
													console.log("분리후실행중");
													/* 추후 클릭시 버튼 수정이 아닌 카테고리 번호를 저장하여 상세목록 이동시 같이 값을 보낸후
													다시 메뉴 목록으로 돌아올떄 기존 값을 유지할수 있게 해야함. */
												}
												console.log("실행중");
												</c:forEach>

											});
						});
	</script>
	<h1>메뉴관리페이지입니다</h1>
	<div class="mainContainer">
		<div class="categoryCon">
			<c:forEach items="${cateList}" var="cateList">
				<button value="${cateList.category_num}" class="category_names"
					style="color: blue;">${cateList.category_name}</button>
			</c:forEach>
		</div>
		<div class="menueContainer">
			<div>
				<input type="text" value="카테고리 이름이 들어갈 자리입니다." />
				<button>수정</button>
				* 현재 기능 미구현
			</div>
			<c:forEach items='${meList}' var='meList'>
				<c:if test='${meList.category_num eq 2}'>
					<div class='menueInfo_container'>
						<div>
							<button name="${meList.menue_name}/${meList.category_num}"
								id="detailMenue_open">상세보기</button>
						</div>
						<div>
							<input type="checkbox" name="menue_name" id="checked_menue"
								value="${meList.menue_name}" />
						</div>
						<div class="menueInfo menueInfo_top">
							<span class="menue_text menue_text_top menue_info_name">음식명
								: ${meList.menue_name}</span> <span
								class="menue_text menue_text_top menue_info_price">가격 : <fmt:formatNumber
									value="${meList.menue_price}"></fmt:formatNumber>&nbsp;원
							</span>
						</div>
						<div class="menueInfo menueInfo_bottom">
							<span class="menue_text menue_info_detail">${meList.etc}</span>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<button id="insert_btn" onclick="deleteChecked();">선택 삭제</button>
			<!-- 메뉴관리 페이지에 옮길 예정 이며 카테고리 값이 없어도.. 게시판처럼 기준 vo객체를 생성후 이용한다면 가능할지도..?-->

		</div>
		<div></div>
	</div>
	<div id="modal" style="display: none">
		<div class="modal_content">
			<button type="button" id="detailMenue_close">모달 창 닫기</button>
			<h2>모달창 테스트</h2>
			<p>모달창 정상 작동</p>
			<div class="input_wrap"></div>
		</div>
		<div class="modal_layer"></div>
	</div>

	<form id="moveForm" method="get">
		<!-- 추후 게시판처럼 기준vo 객체를 생성한다면 사용하게될 form -->
	</form>
	<!-- 모달 jquery -->
	<script>
		$(document)
				.ready(
						function() {
							$(document)
									.on(
											'click',
											'button[id="detailMenue_open"]',
											function(e) {
												/* 페이지 이동 테스트중 */
												e.preventDefault();
												let moveForm = $("#moveForm");
												var test22 = $(this).attr(
														'name');
												test22 = test22.split("/");
												$(".menue_info_name").find(
														"span");
												console.log(test22[0]);
												console.log(test22[1]);
												moveForm
														.append("<input type='hidden' name='category_num' value='"+ test22[1] + "'>");
												moveForm
														.append("<input type='hidden' name='menue_name' value='"+ test22[0] + "'>");
												moveForm.attr("action",
														"/test/detailInfo");
												moveForm.submit();
												/* $("#modal").fadeIn(); */

												/* 또다시 foreach를 사용하면 데이터 사용낭비가 심함 */
											});
						});

		$('#manage_btn').on('click', function() {
			window.location.href = "/test/menueManage"
		});

		$("#detailMenue_close").click(function() {
			$("#modal").fadeOut();
		});
		function deleteChecked() {
			var checkedbtn = new Array();
			$("input:checkbox[name='menue_name']:checked").each(function() {
				checkedbtn.push($(this).val());
				console.log(checkedbtn);
			});
			$.ajax({
				url : "/test/deleteChk",
				type : "POST",
				traditional : true,
				data : {
					checkedbtn : checkedbtn
				},
				success : function(testdata) {
					if (testdata = 1) {
						alert('삭제완료');
					}
					location.reload();
				}
			});
		}
	</script>
</body>
</html>