<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 결제위젯 SDK 추가 -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
</head>
<body>

<div style="width:1200px; margin:0 auto;">
	<div>
		
	</div>
  	<!-- 결제위젯, 이용약관 영역 -->
  	<div id="payment-method"></div>
  	<div id="agreement"></div>
 	<!-- 결제하기 버튼 -->
  	<button id="payment-button">결제하기</button>
  	</div>
  	<script>
    const clientKey = "test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq"
    const customerKey = "2eZ9NPmmdmszJ18766-6Z" // 내 상점의 고객을 식별하는 고유한 키
    const button = document.getElementById("payment-button")

    // ------  결제위젯 초기화 ------ 
    // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제

    // ------  결제위젯 렌더링 ------ 	
    // 결제위젯이 렌더링될 DOM 요소를 지정하는 CSS 선택자 및 결제 금액을 넣어주세요. 
    // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액
    paymentWidget.renderPaymentMethods("#payment-method", '${price}')

    // ------  이용약관 렌더링 ------
    // 이용약관이 렌더링될 DOM 요소를 지정하는 CSS 선택자를 넣어주세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자
    const paymentAgreement = paymentWidget.renderAgreement('#agreement')

    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자
    button.addEventListener("click", function () {
    	if(paymentAgreement.getAgreementStatus().agreedRequiredTerms==false){
    		alert("약관에 동의해 주십시오.");
    		return;
    	}
      paymentWidget.requestPayment({
        orderId: "u0XHU8mFoZkItvhSh697l",            // 주문 ID(직접 만들어주세요)
        orderName: '${productName}',                 // 주문명
        successUrl: "https://my-store.com/success",  // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
        failUrl: "https://my-store.com/fail",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
        customerEmail: "admin@admin.com",
        customerName: "내일의 집"
      })
    })
  	</script>
	</body>
</html>