<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#sidebar-wrapper {
	position: absolute;
	top: 90px;
	left: 0;
	height: 100%;
	width: 200px;
	background: #3b5d50;
	border-left: 1px solid rgba(255, 255, 255, 0.1);
	text-align: center;
}

.sidebar-nav {
	top: 0;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li.sidebar-nav-item a {
	display: block;
	text-decoration: none;
	color: #fff;
	padding: 15px;
}

.sidebar-nav li a:hover {
	text-decoration: none;
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
	text-decoration: none;
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.2rem;
	background: rgba(52, 58, 64, 0.1);
	height: 80px;
	line-height: 50px;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 15px;
}

.sidebar-nav>.sidebar-brand a {
	color: #fff;
	text-decoration: none;
}

.sidebar-nav>.sidebar-brand a:hover {
	color: #fff;
	background: none;
}

.mycontainer {
	margin-left: 200px;
}

.cartInfo-td {
	padding-left: 50px;
	padding-top: 30px;
}

.cartCnt {
	width: 50px;
}

#totalCart {
	margin-left: 300px;
	width: 500px;
}

.totalCart-td {
	width: 270px;
}
</style>
</head>

<body>
	<c:set var="no" value="0"></c:set>
	<table class="mycontainer">
		<tr>
			<td><c:choose>
					<c:when test="${grade=='s'}">
						<nav id="sidebar-wrapper" class="active">
							<ul class="sidebar-nav">
								<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
								<li class="sidebar-nav-item"><a href="#page-top">판매 내역<br>(매출현황)
								</a></li>
								<li class="sidebar-nav-item"><a href="#about">상품현황</a></li>
								<li class="sidebar-nav-item"><a href="#services">주문현황</a></li>
								<li class="sidebar-nav-item"><a href="#portfolio">배송현황</a></li>
								<li class="sidebar-nav-item"><a href="#">문의내역</a></li>
							</ul>
						</nav>
					</c:when>
					<c:otherwise>
						<nav id="sidebar-wrapper" class="active">
							<ul class="sidebar-nav">
								<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
								<li class="sidebar-nav-item"><a href="myCart.do">장바구니</a></li>
								<li class="sidebar-nav-item"><a href="orderDetail.do">주문현황</a></li>
								<li class="sidebar-nav-item"><a href="wishList.do">관심상품</a></li>
								<li class="sidebar-nav-item"><a href="myQnaList.do">문의내역</a></li>
							</ul>
						</nav>
					</c:otherwise>
				</c:choose></td>
			<td class="cartInfo-td">
				<h3>장바구니</h3> 
				<c:if test="${myCartList[0]!=null }">
					<table class="table" id="cartInfo">
						<tr>
							<th>no</th>
							<th>사진</th>
							<th>제품명</th>
							<th>가격</th>
							<th>주문수량</th>
							<th></th>
						</tr>
						<c:forEach var="myCart" items="${myCartList }">
							<tr class="myCart" data-detailno=${myCart.orderDetailNo }
								data-main-category-no=${myCart.mainCategoryNo }
								data-sub-category-no=${myCart.subCategoryNo }>
								<td><c:out value="${no=no+1}"></c:out></td>
								<td><img src="images/${myCart.boardThumbnail }" width="200"
									height="100" style="overflow: hidden"></td>
								<td>${myCart.productName }</td>
								<td>${myCart.price }<span>원</span></td>
								<td><input type="number" value=${myCart.orderCount }
									class="cartCnt" min="0"></td>
							</tr>
						</c:forEach>
					</table>
				</c:if> 
				<c:if test="${myCartList[0]==null }">
					장바구니가 비었습니다.					
				</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${myCartList[0]!=null }">
		<table id="totalCart">
			<tr>
				<td class="totalCart-td">선택상품 가격 :</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="totalCart-td">기본 배송비 :</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="totalCart-td">추가 배송비 :</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="totalCart-td">설치 여부 <input type="checkbox"
					name="setting" id="settingCheck"> (선택시 3만원 추가) :
				</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="totalCart-td">총 비용 :</td>
				<td>0</td>
			</tr>
			<tr>
				<td><button type="button" id="payBtn">결제</button></td>
			</tr>
		</table>
	</c:if>
</body>
<script>
   let total = document.querySelector('#totalCart').children[0];
   let myCartList = document.querySelectorAll('.myCart');
   let selectPrice;
   let checkCnt = 0;

   myCartList.forEach(myCart => {
      total.children[0].children[1].innerText = parseInt(total.children[0].children[1].innerText) + parseInt(
         myCart.children[3].innerText) * parseInt(myCart.children[4].children[0].value);
      total.children[1].children[1].innerText = 3000;
      console.log(myCart.dataset.mainCategoryNo);
      if(myCart.dataset.mainCategoryNo!=2&&myCart.dataset.subCategoryNo!=3){
         total.children[2].children[1].innerText = 20000;    	  
      }
      total.children[4].children[1].innerText = parseInt(total.children[0].children[1].innerText) + parseInt(total
         .children[1].children[1].innerText) + parseInt(total.children[2].children[1].innerText) + parseInt(
         total.children[3].children[1].innerText);
   })


   document.querySelector('#settingCheck').addEventListener('click', function () {
      if (this.checked == true) {
         total.children[3].children[1].innerText = 30000;
      } else {
         total.children[3].children[1].innerText = 0;
      }
      total.children[4].children[1].innerText = parseInt(total.children[0].children[1].innerText) + parseInt(total
         .children[1].children[1].innerText) + parseInt(total.children[2].children[1].innerText) + parseInt(
         total.children[3].children[1].innerText);
   })

   let cartCntList = document.querySelectorAll('.cartCnt');
   cartCntList.forEach(cartCnt => {
      cartCnt.addEventListener('change', function () {
         let cnt;
         myCartList.forEach((myCart, index) => {
            console.log(index);
            if (index == 0) {
               total.children[0].children[1].innerText = 0;
               cnt = 0;
            }
            total.children[0].children[1].innerText = parseInt(total.children[0].children[1]
               .innerText) + parseInt(myCart.children[3].innerText) * parseInt(myCart.children[4]
               .children[0].value);
            if (myCart.children[4].children[0].value != 0) {
               cnt++;
            }
            total.children[1].children[1].innerText = 3000; 
            <c:if test = "${myCart.mainCategoryNo != 2 && myCart.subCategoryNo != 3}" >
               total.children[2].children[1].innerText = 20000; 
            </c:if>
            total.children[4].children[1].innerText = parseInt(total.children[0].children[1]
               .innerText) + parseInt(total.children[1].children[1].innerText) + parseInt(total
               .children[2].children[1].innerText) + parseInt(total.children[3].children[1]
               .innerText);
         })
         if (cnt == 0) {
            total.children[1].children[1].innerText = 0;
            total.children[2].children[1].innerText = 0;
            total.children[4].children[1].innerText = parseInt(total.children[0].children[1].innerText) +
               parseInt(total.children[1].children[1].innerText) + parseInt(total.children[2].children[1]
                  .innerText) + parseInt(total.children[3].children[1].innerText);
         }

      })
   })

   document.querySelector('#payBtn').addEventListener('click', function () {

      let updateCartInfo = "";

      myCartList.forEach((myCart, index) => {
         updateCartInfo += '&orderDetailNo=' + myCart.dataset.detailno + "&orderCnt=" + myCart.children[4]
            .children[0].value;
      })

      console.log(updateCartInfo.substring(1));

      fetch("updateCart.do?" + updateCartInfo.substring(1))
         .then(resolve => resolve.json())
         .then(result => {
            console.log(result);
            location.href = "pay.do?totalPrice=" + total.children[4].children[1].innerText;
         })
         .catch(err => console.log(err))
   })
</script>