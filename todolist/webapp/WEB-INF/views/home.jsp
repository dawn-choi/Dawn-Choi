<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<html>
<head>
<title>해야할일</title>
<style>
#section {
	position: absolute;
	top: 20%;
	left: 20%;
	border: solid 1px gray;
}

.typo {
	text-align: left;
	background-color: black;
	color: white;
	padding: 10px;
	margin: 5px;
	width: 200px;
	font-size: 25x;
}

.list {
	float: left;
	clear: right;
}

.content {
	background-color: #CEE5EF;
	padding: 10px;
	margin: 5px;
	width: 400px;
	font-size: 20x;
	height: 70px;
	line-height: 200%;
}

a {
	text-decoration: none;
	color: white;
}

#nav {
	background-color: blue;
	float: right;
	width: 100px;
	height: 30px;
	text-align: center;
	line-height: 2;
	font-size: 15px;
}
</style>
<script>
//DB에서  할일 리스트를 가져와 뿌리는 함수 
	function loadMain() {
		var arrTypo = [ "TODO", "DOING", "DONE" ]
		$
				.ajax({
					url : "ajax",
					type : "POST",
					dataType : "json",
					async : false,
					success : function(datas) {
						strHTML = "<div id='nav'> <a href='insertForm'> 새로운 TODO등록</a></div>";
						for (var i = 0; i < 3; i++) {
							strHTML += "<div class='list'>";
							strHTML += "<div class='typo' id='"+arrTypo[i]+"'>"
									+ arrTypo[i] + " </div>"
							$
									.each(
											datas,
											function(index, item) {
												if (item.typo == arrTypo[i]) {
													strHTML += "<div class='content' id='"+item.ids+"'><font size='3px' b>"
															+ item.title
															+ "</font></br>"
															+ "등록날짜:"
															+ item.regisdate
															+ ","
															+ item.names
															+ ","
															+ "우선순위"
															+ item.seqs
															+ "<br/><input type='image' class='update' id='"+item.ids+"' typo='"+item.typo+"' title='"+item.title+"'names='"+item.names+"'"
															+ "src=\"https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png\" width='15px'"
															+ "style=\"background-color:white;\">"
															+ "<input type='image'class='delete' id='"+item.ids+"' typo='"+item.typo+"' "
															+ "src='https://img.icons8.com/ios/452/delete-message.png' height=15px width=15px style=\"background-color:white; \">";
													if (item.typo != arrTypo[2]) {
														strHTML += "<input type='image' class='move' id='"+item.ids+"' typo='"+item.typo+"'";
														strHTML += "src=\"";
														strHTML += "https://previews.123rf.com/images/";
														strHTML += "get4net/get4net1709/get4net170901354/86307988-%";
														strHTML += "EC%98%A4%EB%A5%B8%EC%AA%BD-%ED%99%94%EC%82%B4%ED%91%9C.jpg\"";
														strHTML += "height=15px width=15px style=\"background-color:white; \"/>";
													}
													strHTML += "</div>";
												}
											});
							strHTML += "</div>";
							$("#section").html(strHTML);
						}
					},
					error : function() {
						alert("err");
					}
				})

	}

	 
//첫 화면 뿌리는 동작
	$(function() {
		loadMain();
	})

// ajax 로 할일을 다음 단계로 이동 시킴
	$('html').off('click.move', 'div input[class="move"]').on('click.move',
			'div input[class="move"]', function(e) {
				var btn = e.target;
				$.ajax({
					url : "move",
					type : "POST",
					async : false,
					dataType : "json",
					data : {
						"ids" : btn.id,
						"typo" : btn.getAttribute('typo')
					},
					success : function(data) {
						if (data > 0) {
							loadMain();
						}
					},
					error : function() {
						alert("err");
					}
				});
			});
// 할일 삭제
	$(document).off('click.delete', 'div input[class="delete"]').on(
			'click.delete', 'div input[class="delete"]', function(e) {
				var btn = e.target;
				$.ajax({
					url : "delete",
					type : "POST",
					dataType : "json",
					async : false,
					data : {
						"ids" : btn.id,
						"typo" : btn.getAttribute('typo')
					},
					success : function(data) {
						if (data > 0) {
						}
						loadMain();
					},
					error : function() {
						alert("err");
					}
				});
			});

// 할일 수정 화면으로 이동
	$(document).off('click.update', 'div input[class="update"]').on('click.update','div input[class="update"]', function(e) {
		 var btn2 = e.target;
		 location.href="updateForm?ids="+btn2.id+"&title="+btn2.getAttribute('title')+"&names="+btn2.getAttribute('names')+"";
		 })
		 
</script>

</head>
<body>
	<div id=wrap>

		<div id="section"></div>

	</div>

</body>
</html>
