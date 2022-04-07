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
body {
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

#insert_btn {
	width: 100%;
	margin: 0 auto;
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
				<button id="add_cate_btn" value="${nowPage.nowCate}">카테고리
					추가</button>
			</div>
			<div class="categort_btns">
				<c:forEach items="${cateList}" var="cateList">
					<button value="${cateList.category_num}" class="category_names"
						onclick="moveCategory(this)" style="color: blue;">${cateList.category_name}</button>
				</c:forEach>
			</div>
		</div>
		<div class="menueContainer">
			<div class="btnTest" style="position: sticky; top: 0; background-color: white; border-bottom: 1px solid black;">
				<form action="/test/updateCateName" method="post" id="modifyForm">
					<c:forEach var="cateList" items="${cateList}">
						<c:if test="${cateList.category_num eq nowPage.nowCate}">
							<input type="text" name="category_name"
								value='${cateList.category_name}' />
							<button type="button" value="${nowPage.nowCate}"
								id="modify_cateName">수정</button>
						</c:if>
					</c:forEach>
					<button type="button" value="${nowPage.nowCate}" id="list_btn">목록이동</button>
					<c:if test="${nowPage.nowCate ne 0}">
						<button type="button" value="${nowPage.nowCate}"
							id="delCategory_btn">카테고리 삭제</button>
					</c:if>
				</form>
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
								class="menue_text menue_text_top menue_info_price">가격 : <fmt:formatNumber
									value="${cateTest.menue_price}"></fmt:formatNumber>&nbsp;원
							</span>
						</div>
						<div class="menueInfo menueInfo_bottom">
							<span class="menue_text menue_info_detail">${cateTest.etc}</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div style="position: sticky; bottom: 0; background-color: white;">
				<c:if test="${nowPage.nowCate ne 0}">
					<div>
						<button value="${nowPage.nowCate}" id="insert_btn">메뉴등록</button>
					</div>
				</c:if>
				<c:choose>
					<c:when test="${nowPage.nowCate ne 0}">
						<button id="cheked_btn" class="del_checked_btn">선택 삭제</button>
						<button id="cheked_btn" class="best_checked_btn">인기 등록</button>
					</c:when>
					<c:otherwise>
						<button id="cheked_btn" class="del_bestMenu_btn">인기메뉴 해제</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<form id="moveForm">
		<!-- 추후 게시판처럼 기준vo 객체를 생성한다면 사용하게될 form -->
		<%-- <input type="text" name="nowCate" value="${nowPage.nowCate}" /> --%>
	</form>
	<script>
		/* 하나의 값만 변경후 복사가 되는 쿼리문이 없을경우 input 태그로 하나하나 입력후 새로 입력 */
		/* 등원후 해야할것 준현님 쿼림문 적용하기 */
		let moveForm = $("#moveForm");
		$('#insert_btn')
				.on(
						'click',
						function() {
							moveForm.attr('method', 'get');
							moveForm.attr('action', '/test/insertMenue');
							moveForm
									.append('<input type="hidden" name="nowCate" value="'
											+ $(this).val() + '"/>');
							moveForm.submit();
						});
		$('#modify_cateName')
				.on(
						'click',
						function() {
							let form = $('#modifyForm');
							form
									.append('<input type="hidden" name="category_num" value="'
											+ $(this).val() + '"/>');
							form.submit();
						});
		$('#delCategory_btn')
				.on(
						'click',
						function() {
							moveForm.attr('method', 'post');
							if (confirm('확인시 하위 메뉴와 같이 삭제됩니다') == true) {
								moveForm.attr('action', '/test/deleteCategory');
								moveForm
										.append('<input type="hidden" name="category_num" value="'
												+ $(this).val() + '"/>');
								moveForm.submit();
							} else {
								return;
							}
							moveForm.attr('action', '/test/deleteCategory');
							moveForm
									.append('<input type="hidden" name="category_num" value="'
											+ $(this).val() + '"/>');
							moveForm.submit();
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
												var cateNum = $(this).val();
												moveForm
														.append("<input type='hidden' name='category_num' value='"+ cateNum + "'>");
												moveForm
														.append("<input type='hidden' name='menue_name' value='"+ menueName + "'>");
												moveForm.attr("action",
														"/test/detailInfo");
												moveForm.submit();

											});
						});
		/* 수정페이지로 이동하기 */
		$(document)
				.on(
						"click",
						"#list_btn",
						function() {
							console.log('test');
							moveForm.attr('method', 'get');
							moveForm
									.append('<input type="hidden" name="cateTest" value="'
											+ $(this).val() + '"/>');
							moveForm.attr('action', '/test/cateList');
							moveForm.submit();
						});

		$('#add_cate_btn')
				.on(
						'click',
						function() {
							moveForm.attr('method', 'post');
							moveForm.attr('action', '/test/insrtCategory');
							moveForm
									.append('<input type="hidden" name="nowCate" value="'
											+ $(this).val() + '"/>');
							moveForm
									.append("<input type='hidden' name='category_name' value='새 카테고리'>");
							moveForm.submit();
						});

		$(document).ready(function() {
			$(document).on("click", "button[id='cheked_btn']", function() {
				var checkType = $(this).attr('class');
				var url;
				console.log(checkType);
				if (checkType == "del_checked_btn") {
					console.log("메뉴 선택 삭제");
					checkedBtnfun("/test/deleteChk");
				} else if (checkType == "best_checked_btn") {
					console.log("인기메뉴 등록");
					checkedBtnfun("/test/addBestMenu");
				} else if (checkType == "del_bestMenu_btn") {
					console.log("인기메뉴 삭제");
					checkedBtnfun("/test/deleteBestMenu");
				} else {
					alert('오류발생');
				}
			});
		});

		function checkedBtnfun(url) {
			var checkedbtn = new Array(); /* 체크된 value의 값을 저장할 배열 생성 */
			var btnArr;
			console.log(url + 'url 성공적 전송완료');
			$("input:checkbox[name='menue_name']:checked").each(function() {
				/* input 태그의 checkbox의 name='menue_name'가 체크 가된 만큼 .each로 반복 하여 이벤트 발생 */
				checkedbtn.push($(this).val()); /* 배열에 담을 checkbox의 value 값 */
				console.log(checkedbtn); /* 배열에 담기는지 테스트 */
			});
			$.ajax({
				url : url, // controller에서 설정해둔 postmapping의 url
				type : "POST", // controller 의 mapping 타입이 Get 인지 Post 인지 설정
				traditional : true, // 전통성 ex) true = checkedbtn='볶음밥', false = checkedbtn[]='볶음밥'
				data : {
					checkedbtn : checkedbtn
				/* 담아둔 배열을 controller로 보낸다 */
				},
				success : function(testdata) {
					if (testdata = 1) {
						alert(checkedbtn.length + '개의 메뉴 작업 성공.');
						/* 추후 rttr 이용 혹은 modle.addAttribute 이용하여 문자 받아와서 각자의 alert 알람 */
					}
					console.log('성공!');
					location.reload();
				}
			});
		}
		function moveCategory(e) {
			var cateVal = $(e).val();
			/* 			console.log(valtest);
			 console.log( $(e).attr('value')); */
			location.href = "/test/menueManage?cateTest=" + cateVal;
		};
		/* ajax를 통해 화면 전환을 시키니 2번씩 실행되어서 ajax를 삭제함. */
	</script>
</body>
</html>