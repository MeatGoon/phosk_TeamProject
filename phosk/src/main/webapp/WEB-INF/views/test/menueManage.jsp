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

.categoryCon, .menueContainer {
	overflow: auto;
}

.menueContainer {
	width: 700px;
	float: right;
	height: 100%;
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

#delCategory_btn, #list_btn {
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
/* 		$(document)
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
..
												var test123 = <c:out value="${meList.category_num}"/>;

												if (test123 == carNum) {
													console.log("아니 여기옴?");
													$(".menue_eachform")
															.prepend(
																	"<div class='menueInfo_container'>"
																			+ "<div>"
																			+ "<button name='${meList.menue_name}' value='${meList.category_num}' id='detailMenue_open'>상세보기</button>"
																			+ "</div>"
																			+ "<div>"
																			+ "<input type='checkbox' name='menue_name' id='checked_menue' value='${meList.menue_name}' />"
																			+ "</div>"
																			+ "<div class='menueInfo menueInfo_top'>"
																			+ "<span class='menue_text menue_text_top menue_info_name'>음식명 : ${meList.menue_name}</span> "
																			+ "<span class='menue_text menue_text_top menue_info_price'>가격 : <fmt:formatNumber value='${meList.menue_price}'></fmt:formatNumber>&nbsp;원</span>"
																			+ "</div>"
																			+ "<div class='menueInfo menueInfo_bottom'>"
																			+ "<span class='menue_text menue_info_detail'>${meList.etc}</span>"
																			+ "</div>"
																			+ "</div>");
													console.log("분리후실행중");
													추후 클릭시 버튼 수정이 아닌 카테고리 번호를 저장하여 상세목록 이동시 같이 값을 보낸후
													다시 메뉴 목록으로 돌아올떄 기존 값을 유지할수 있게 해야함.
												}
												console.log("실행중");
												</c:forEach>

											});
						}); */
	</script>
	<h1>메뉴관리페이지입니다</h1>
	<div class="mainContainer">
		<div class="categoryCon">
			<div>
				<button id="add_cate_btn">카테고리 추가</button>
			</div>
			<div class="categort_btns">
				<c:forEach items="${cateList}" var="cateList">
					<button value="${cateList.category_num}" class="category_names"
						style="color: blue;">${cateList.category_name}</button>
				</c:forEach>
			</div>
		</div>
		<div class="menueContainer">
			<div>
				<input type="text" value="카테고리 이름이 들어갈 자리입니다." readonly="readonly" />
				<button>수정</button>
				<button id="list_btn" onclick="moveList()">목록이동</button>
				<button value="" id="delCategory_btn">삭제</button>
				<!-- value의 값은 ajax 혹은 moveForm 이용하여 카테고리 불러올 예정 -->
				* 현재 기능 미구현
			</div>
			<div class="menue_eachform">
				<c:forEach items='${cateTest}' var='cateTest'>
						<div class='menueInfo_container'>
							<div>
								<button name="${cateTest.menue_name}/${cateTest.category_num}"
									id="detailMenue_open">상세보기</button>
							</div>
							<div>
								<input type="checkbox" name="menue_name" id="checked_menue"
									value="${cateTest.menue_name}" />
							</div>
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
			</div>
			<button id="checked_btn" onclick="deleteChecked();">선택 삭제</button>
		</div>
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
	<form id="moveForm" method="post">
		<!-- 추후 게시판처럼 기준vo 객체를 생성한다면 사용하게될 form -->
		<input type="text" name="nowCate" value="${nowCate.categoryNum}"/>
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
												/* 페이지 이동 테스트중 */
												e.preventDefault();
												let moveForm = $("#moveForm");
												var menueName = $(this).attr(
														'name');
												var cateNum = $(this).val();
												moveForm
														.append("<input type='hidden' name='category_num' value='"+ cateNum + "'>");
												moveForm
														.append("<input type='hidden' name='menue_name' value='"+ menueName + "'>");
												moveForm.attr("action",
														"/test/detailInfo");
												moveForm.submit();
												/* $("#modal").fadeIn(); */

												
											});
						});

		$('#manage_btn').on('click', function() {
			window.location.href = "/test/menueManage"
		});

		$("#detailMenue_close").click(function() {
			$("#modal").fadeOut();
		});
		function moveList() {
			$('#moveForm').attr()
			$('#moveForm').attr('action', '/test/cateList');
			$('#moveForm').submit();
		};
		
		$('#add_cate_btn')
				.on(
						'click',
						function() {
							let form = $('#moveForm');
							form.attr('action', '/test/insrtCategory');
							form
									.append("<input type='hidden' name='category_name' value='새 카테고리'>");
							form.submit();
						});

		function deleteChecked() {
			var checkedbtn = new Array(); /* 체크된 value의 값을 저장할 배열 생성 */
			$("input:checkbox[name='menue_name']:checked").each(function() {
				/* input 태그의 checkbox의 name='menue_name'가 체크 가된 만큼 .each로 반복 하여 이벤트 발생 */
				checkedbtn.push($(this).val()); /* 배열에 담을 checkbox의 value 값 */
				console.log(checkedbtn); /* 배열에 담기는지 테스트 */
			});
			$.ajax({
				url : "/test/deleteChk", // controller에서 설정해둔 postmapping의 url
				type : "POST", // controller 의 mapping 타입이 Get 인지 Post 인지 설정
				traditional : true, // 전통성 ex) true = checkedbtn='볶음밥', false = checkedbtn[]='볶음밥'
				data : {
					checkedbtn : checkedbtn
				/* 담아둔 배열을 controller로 보낸다 */
				},
				success : function(testdata) {
					if (testdata = 1) {
						alert(checkedbtn.length + '개의 메뉴가 삭제 되었습니다.');
					}
					location.reload();
				}
			});
		}
		$(document).on("click", "button[class='category_names']", function() {
			var cateTest = $(this).val();
			/* console.log(cateTest + " ajax 부분"); */
			$.ajax({
				url : "/test/menueManage",
				type : "GET",
				data : {
					cateTest : cateTest
				},
				success : function(testData) {
					document.body.innerHTML = testData;
					console.log(cateTest);
					$('#moveForm').append('<input type="text" name="cateTest" value="' + cateTest + '"/>')
					/*$('body').html(testData);*/

					/*
					 * body 부분 내용을 testData로 수정
					 */

					/*
					 * 현재 수정 부분 pom.xml 의 mybatis 업데이트 mybatis 3.4.6 -> 3.5.3 mybatis
					 * spring 1.3.2 -> 2.0.5 으로 변경후 $('body').html(testData); 추가 하니 됬음
					 * 변경전 테스트 안해봄 현재 발생한 문재점 기존 데이터가 않보이는 곳에 쌓이는거 같다 페이지 F12 를 눌렀을때
					 * network 부분에서 느려지는것을 확인
					 */

				}
			});

		});
	</script>
</body>
</html>