<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="signIn.do" method="post">
		<table class="table">
			<tr>
				<th>id</th>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr>
				<td><button type="submit">로그인</button></td>
			</tr>
		</table>
	</form>
	<ul>
		<li>
			<div id="naverIdLogin">
				<a id="naverIdLogin_loginButton" href="#" role="button"><img
					src="https://static.nid.naver.com/oauth/big_g.PNG" width=320></a>
			</div>
		</li>
		<li onclick="naverLogout(); return false;"><a
			href="javascript:void(0)"> <span>네이버 로그아웃</span>
		</a></li>
		
	</ul>
	<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>
	<a href="signUp.do">회원가입</a>
	<a href="searchId.do">ID 찾기</a>
	<a href="searchPw.do">PW 찾기</a>




<!-- 네이버 스크립트 -->
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>

<script>
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "NoqCJJA8y8apy_2fhbFi", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl : "http://localhost:8081/MiddleProject/naverLogin.do", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
		isPopup : false,
		callbackHandle : true
	});
/* 
	window.addEventListener('load', function() {
		naverLogin.getLoginStatus(function(status) {
			console.log(status);
			if (status) {
				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
				if (email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}
				
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	}); */

	/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();


	 var testPopUp;
	 function openPopUp() {
	 	testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	 }
	 function closePopUp(){
	 	testPopUp.close();
	 }

	 function naverLogout() {
		 openPopUp();
		 setTimeout(function() {closePopUp();}, 1000);
	 }
	 
	 
	 
	 
</script>
	


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('d76f35caf7c8654e7ca5241a2807b2ab'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인	
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response);
        	  console.log(response.kakao_account.profile.nickname);
        	  location.href="otherLogin.do?name="+response.kakao_account.profile.nickname+"&id="+response.id+"&email="+response.kakao_account.email+"&gender="+response.kakao_account.gender;
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>


</body>
</html>