<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap"
	rel="stylesheet">
<!-- Bootstrap -->
<script src="http://code.jquery.com/jquery.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<style>
#selBtn {
	font-family: 'Russo One', 'Do Hyeon', sans-serif;
}
</style>
<script>
	$(document).ready(function() {
		var logininfo = "${login.mname}";

		if (logininfo != "") {
			alert(logininfo + "님 반갑습니다")
			$("div[name=barRight1]").hide();
		}

		else {
			$("div[name=barRight2]").hide();
		}
	});

	function myTicket() {
		var logininfo = "${login.mname}";
		var url = "/myTicket?mid=${login.mid}"
		var name = "이용권조회"
		var option = "width =700, height=800, top = 100 , left = 200, location= no"
		if (logininfo != "") {
			window.open(url, name, option);
		} else {
			alert("로그인이 필요합니다");
		}
	}
</script>
<script>
	function idCheck() {
		if ($('#id').val() == "") {
			modalContents.text("아이디를 입력하여 주시기 바랍니다.");
			modal.modal('show');
			$('#id').focus();
			return false;
		} else {
		
		
		
		
		$.ajax({
			url : "/idChk",
			type : "POST",
			dataType : "json",
			data : JSON.stringify({"mid" : $("#id").val()}),
			contentType: "application/json",
			success : function(data) {
				if (data.count == 1) {
					alert("중복된 아이디 입니다.");
				} else if (data.count == 0) {
					alert("사용 가능한 아이디입니다.");
					document.getElementById("id").setAttribute('readonly', 'readonly');
				}
			},
			error : function() {
				alert("실패" );
			}

		})
	}}

	$(function() {
		//모달을 전역변수로 선언
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");

		$('.onlyAlphabetAndNumber').keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
			}
		});

		$(".onlyHangul").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
			}
		});

		$(".onlyNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});

		//------- 검사하여 상태를 class에 적용
		$('#id').keyup(function(event) {

			var divId = $('#divId');

			if ($('#id').val() == "") {
				divId.removeClass("has-success");
				divId.addClass("has-error");
			} else {
				divId.removeClass("has-error");
				divId.addClass("has-success");
			}
		});

		$('#password').keyup(function(event) {

			var divPassword = $('#divPassword');

			if ($('#password').val() == "") {
				divPassword.removeClass("has-success");
				divPassword.addClass("has-error");
			} else {
				divPassword.removeClass("has-error");
				divPassword.addClass("has-success");
			}
		});

		$('#passwordCheck').keyup(function(event) {

			var passwordCheck = $('#passwordCheck').val();
			var password = $('#password').val();
			var divPasswordCheck = $('#divPasswordCheck');

			if ((passwordCheck == "") || (password != passwordCheck)) {
				divPasswordCheck.removeClass("has-success");
				divPasswordCheck.addClass("has-error");
			} else {
				divPasswordCheck.removeClass("has-error");
				divPasswordCheck.addClass("has-success");
			}
		});

		$('#name').keyup(function(event) {

			var divName = $('#divName');

			if ($.trim($('#name').val()) == "") {
				divName.removeClass("has-success");
				divName.addClass("has-error");
			} else {
				divName.removeClass("has-error");
				divName.addClass("has-success");
			}
		});

		$('#nickname').keyup(function(event) {

			var divNickname = $('#divNickname');

			if ($.trim($('#nickname').val()) == "") {
				divNickname.removeClass("has-success");
				divNickname.addClass("has-error");
			} else {
				divNickname.removeClass("has-error");
				divNickname.addClass("has-success");
			}
		});

		$('#email').keyup(function(event) {

			var divEmail = $('#divEmail');

			if ($.trim($('#email').val()) == "") {
				divEmail.removeClass("has-success");
				divEmail.addClass("has-error");
			} else {
				divEmail.removeClass("has-error");
				divEmail.addClass("has-success");
			}
		});

		$('#phoneNumber').keyup(function(event) {

			var divPhoneNumber = $('#divPhoneNumber');

			if ($.trim($('#phoneNumber').val()) == "") {
				divPhoneNumber.removeClass("has-success");
				divPhoneNumber.addClass("has-error");
			} else {
				divPhoneNumber.removeClass("has-error");
				divPhoneNumber.addClass("has-success");
			}
		});

		$('#birthDay').keyup(function(event) {

			var divPhoneNumber = $('#divBirth');

			if ($.trim($('#birthDay').val()) == "") {
				divPhoneNumber.removeClass("has-success");
				divPhoneNumber.addClass("has-error");
			} else {
				divPhoneNumber.removeClass("has-error");
				divPhoneNumber.addClass("has-success");
			}
		});

		//------- validation 검사
		$("form").submit(
				function(event) {
					var divId = $('#divId');
					var divPassword = $('#divPassword');
					var divPasswordCheck = $('#divPasswordCheck');
					var divName = $('#divName');
					var divEmail = $('#divEmail');
					var divPhoneNumber = $('#divPhoneNumber');
					var divBirth = $('#divBirth');

					//회원가입약관

					//아이디 검사
					if ($('#id').val() == "") {
						modalContents.text("아이디를 입력하여 주시기 바랍니다.");
						modal.modal('show');
				
						divId.removeClass("has-success");
						divId.addClass("has-error");
						$('#id').focus();
						return false;
					} 
					
					if(document.getElementById("id").getAttribute('readonly')== null){
						modalContents.text("아이디 중복체크를 해주시기 바랍니다.");
						modal.modal('show');
				
						divId.removeClass("has-success");
						divId.addClass("has-error");
						$('#id').focus();
						return false;
					}
					
					else {
						
						divId.removeClass("has-error");
						divId.addClass("has-success");
					}

					//패스워드 검사
					if ($('#password').val() == "") {
						modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
						modal.modal('show');

						divPassword.removeClass("has-success");
						divPassword.addClass("has-error");
						$('#password').focus();
						return false;
					} else {
						divPassword.removeClass("has-error");
						divPassword.addClass("has-success");
					}

					//패스워드 확인
					if ($('#passwordCheck').val().length < 8) {
						modalContents.text("패스워드를 8자 이상 입력하여 주시기 바랍니다.");
						modal.modal('show');

						divPasswordCheck.removeClass("has-success");
						divPasswordCheck.addClass("has-error");
						$('#passwordCheck').focus();
						return false;
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}

					//패스워드 비교
					if ($('#password').val() != $('#passwordCheck').val()
							|| $('#passwordCheck').val() == "") {
						modalContents.text("패스워드가 일치하지 않습니다.");
						modal.modal('show');

						divPasswordCheck.removeClass("has-success");
						divPasswordCheck.addClass("has-error");
						$('#passwordCheck').focus();
						return false;
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}

					//이름
					if ($('#name').val() == "") {
						modalContents.text("이름을 입력하여 주시기 바랍니다.");
						modal.modal('show');

						divName.removeClass("has-success");
						divName.addClass("has-error");
						$('#name').focus();
						return false;
					} else {
						divName.removeClass("has-error");
						divName.addClass("has-success");
					}

					//생일
					if ($('#birthDay').val().length < 8) {
						modalContents.text("생일을 제대로 입력해주세요.");
						modal.modal('show');

						divName.removeClass("has-success");
						divName.addClass("has-error");
						$('#birthDay').focus();
						return false;
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}

					//이메일
					if ($('#email').val() == "") {
						modalContents.text("이메일을 입력하여 주시기 바랍니다.");
						modal.modal('show');

						divEmail.removeClass("has-success");
						divEmail.addClass("has-error");
						$('#email').focus();
						return false;
					} else {
						divEmail.removeClass("has-error");
						divEmail.addClass("has-success");
					}

					//휴대폰 번호
					if ($('#phoneNumber').val() == "") {
						modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
						modal.modal('show');

						divPhoneNumber.removeClass("has-success");
						divPhoneNumber.addClass("has-error");
						$('#phoneNumber').focus();
						return false;
					} else {
						divPhoneNumber.removeClass("has-error");
						divPhoneNumber.addClass("has-success");
						alert("회원 가입 완료!")
					}

				});

	});
</script>


</head>
<body>
	<div id="topNav">
		<div id="logo">
			<span>로고 위치</span>
		</div>
		<input id="selBtn" type="button" value="이용권 조회" onclick="myTicket()" />
		<div id="barRight" name="barRight1">
			<ul>
				<li><a href="/LoginForm"> <img class="imgSet" width="35px"
						height="35px" alt="Login" src="/img/login.png">
						<div>로그인</div>
				</a></li>
				<li><a href="/AssignForm"> <img class="imgSet" width="35px"
						height="35px" alt="SignUp" src="/img/submit.png">
						<div>회원가입</div>
				</a></li>
			</ul>
		</div>
		<div id="barRight" name="barRight2">
			<ul>
				<li><img class="imgSet" width="35px" height="35px" alt="Login"
					src="/img/login.png">
					<div>${login.mname}님</div></li>
				<li><a href="/logout"> <img class="imgSet" width="35px"
						height="35px" alt="SignUp" src="/img/submit.png">
						<div>로그아웃</div>
				</a></li>
			</ul>
		</div>
	</div>
	<!-- 왼쪽 네비게이션 -->
	<div id="leftNav">
		<div id="toHome">
			<a href="/"><img width="40px" height="40px" alt="HOME"
				src="/img/home.png"></a>
		</div>
		<ul>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Schedule" src="/img/calendar.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Class register" src="/img/registration.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Product List" src="/img/gym.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Statistics" src="/img/result.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Board" src="/img/meeting.png"></a></li>
			<!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
		</ul>
	</div>

	<!-- 메인 -->
	<div id="wrapper">
		<div id="wrapMain">
			<div id="mainImg">
			
					<div class="container"
						style="overflow: scroll; width: 1000px; height: 500px;">
						<div class="modal fade" id="defaultModal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title">알림</h4>
									</div>
									<div class="modal-body">
										<p class="modal-contents"></p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
						<!--// 모달창 -->
						<hr />
						<!-- 본문 들어가는 부분 -->


	<form class="form-horizontal" role="form" method="POST" action="/assign">

						<div class="form-group" id="divId">
							<label for="inputId" class="col-lg-2 control-label">아이디</label>
							<div class="col-lg-10">
								<input type="text" class="form-control onlyAlphabetAndNumber"
									id="id" data-rule-required="true" name="mid"
									placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다."
									maxlength="30"> <input type="button"
									class="col-lg-2 control-label" onclick="idCheck()"
									value="ID 중복체크">
							</div>
						</div>
						<div class="form-group" id="divPassword">
							<label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
							<div class="col-lg-10">
								<input type="password"
									class="form-control onlyAlphabetAndNumber" id="password"
									name="mpwd" data-rule-required="true"
									placeholder="영문 숫자만 가능합니다 대소문자 구별" maxlength="30" minlength="8">
							</div>
						</div>
						<div class="form-group" id="divPasswordCheck">
							<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
								확인</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="passwordCheck"
									data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
							</div>
						</div>
						<div class="form-group" id="divName">
							<label for="inputName" class="col-lg-2 control-label">이름</label>
							<div class="col-lg-10">
								<input type="text" class="form-control onlyHangul" id="name" name="mname"
									data-rule-required="true" placeholder="한글만 입력 가능합니다."
									maxlength="15">
							</div>
						</div>

						<div class="form-group" id="divEmail">
							<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
							<div class="col-lg-10">
								<input type="email" class="form-control" id="email" name="memail"
									data-rule-required="true" placeholder="이메일" maxlength="40">
							</div>
						</div>
						<div class="form-group" id="divBirth">
							<label for="inputBirthDay" class="col-lg-2 control-label">생년월일</label>
							<div class="col-lg-10">
								<input type="tel" class="form-control onlyNumber" id="birthDay" name="mbirth"
									data-rule-required="true"
									placeholder="-를 제외하고 숫자만 입력하세요. ex:)19910327" maxlength="8">
							</div>
						</div>
						<div class="form-group">
							<label for="inputGender" class="col-lg-2 control-label">성별</label>
							<div class="col-lg-10">
								<select class="form-control" id="gender" name ="mgender">
									<option value="M">남</option>
									<option value="F">여</option>
								</select>
							</div>
						</div>

						<div class="form-group" id="divPhoneNumber">
							<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
								번호</label>
							<div class="col-lg-10">
								<input type="tel" class="form-control onlyNumber" name="mtel"
									id="phoneNumber" data-rule-required="true"
									placeholder="-를 제외하고 숫자만 입력하세요."  maxlength="11">
							</div>
						</div>
						<div class="form-group" id="divAddr">
							<label for="inputId" class="col-lg-2 control-label">집주소</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="addr" name="maddr"
									data-rule-required="true" placeholder="집 주소를 입력해주세요"
									maxlength="90">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button type="submit" class="btn btn-primary">회원가입</button>
							</div>
						</div>


				</form>


					</div>

			</div>
		</div>
	</div>
</body>
</html>