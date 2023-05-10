<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
@import
url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic")
body
{
width
:
100%
height:
100%
}
#sidebar-wrapper {
	position: relative;
	z-index: 2;
	top: 20px;
	right: 0;
	width: 150px;
	height: 100%;
	background: #3b5d50;
	border-left: 1px solid rgba(255, 255, 255, 0.1);
	text-align: center;
}

.sidebar-nav {
	top: 0;
	width: 150px;
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
.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}





</style>
<table class="mycontainer">
<tr>
<td>
<c:choose>
<c:when test="${grade=='s'}">
<nav id="sidebar-wrapper" class="active">
	<ul class="sidebar-nav">
		<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
		<li class="sidebar-nav-item"><a href="#page-top">판매 내역<br>(매출현황)</a></li>
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
		<li class="sidebar-nav-item"><a href="orderList.do">장바구니</a></li>
		<li class="sidebar-nav-item"><a href="orderDetail.do">주문현황</a></li>
		<li class="sidebar-nav-item"><a href="wishList.do">관심상품</a></li>
		<li class="sidebar-nav-item"><a href="myQnaList.do">문의내역</a></li>
	</ul>
</nav>
</c:otherwise>
</c:choose>
</td>
<td>
<form name="order" action="orderPage.do" method="post">
<table class="table">
	<c:set var = "totalPrice" value = "0"/>
		<tr><td><input type="checkbox" id="chkAll" value="selectall" onclick="allCheckboxes('chk', this.checked);calc();" />전체선택</td></tr>
	<c:forEach var="order" items="${list}">
		<tr>
			<td><input type="checkbox" name = "chk" class="c" onclick="isAllCheck(this.name, 'chkAll');calc();" value="${order.price * order.orderCount}" ></td>
			<td><img width="70px" src="images/${order.boardThumbnail}"></td>
			<td>제품명 : ${order.productName}</td>
			<td>제품 설명 : ${order.boardContent }</td>
			<td>가격 : ${order.price}</td>
			<td>주문 수량 : ${order.orderCount}</td>
			<td><button id="delbtn" type="button" name="orderNo" onClick="location.href='deleteOrder.do?orderNo=${order.orderNo }'">삭제</button>
		</tr>
			<c:set var = "totalPrice" value="${totalPrice + (order.price * order.orderCount)}"/>
	</c:forEach>
							<!-- <c:if test="c">
							<c:if test="${order.mainCategoryNo != 2 && order.subCategoryNo != 3}">
								20000
							</c:if>
							</c:if> -->
	<tr>
		<td>
			선택 상품 가격 : <span class="allPrice" ></span>
		</td>
		<td>기본 배송비 : <span class="nomalFee">0</span></td>
		<td>추가 배송비 : <span class="alphaFee">
							0
					   </span></td>
		<td>설치 여부 : <input type="checkbox" name="setting" class="setting" onClick="checkS();calc();"><br>체크시 30,000원 추가</td>
		<td>총 합계 : <span class="sumPrice"></span></td>
		
	</tr>
	<tr>
	<td colspan="2" align="right">
		<button type="submit">주문</button>
	</tr>
</table>
</form>
<div class="center">
	<div class="pagination">
		<c:if test="${pageInfo.prev }">
			<a href="wishList.do?page=${pageInfo.startPage-1 }">Previous</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<a class="${i == pageInfo.pageNum ? 'active' : '' }" href="wishList.do?page=${i}">${i } </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a href="wishList.do?page=${pageInfo.endPage+1 }">Next</a>
		</c:if>
	</div>
</div>

</td>
</tr>
</table>

<script>


function allCheckboxes(boxNames, chkMode){
	  const el = document.getElementsByName(boxNames);
	  for(let i = 0; i < el.length; i++){          
	   if(!el[i].disabled){
	     el[i].checked = chkMode;	
	   }
	  }
	  let checkBoxAll = document.querySelectorAll("#chkAll");
	  console.log(checkBoxAll);
	  let check = false;
		checkBoxAll.forEach(box=>{
			if(box.checked == true){
				check=true;
			}
		})
		if(check){
			document.querySelector(".nomalFee").innerText = 3000;
			<c:if test="${order.mainCategoryNo != 2 && order.subCategoryNo != 3}">
			document.querySelector(".alphaFee").innerText = 20000;
			</c:if>
			
		}else{
			document.querySelector(".nomalFee").innerText = 0;
			document.querySelector(".alphaFee").innerText = 0; 
		}
	  
	  
	}
	



	function isAllCheck(boxNames, allChkName){
	  const el = document.getElementsByName(boxNames);
	  let checkboxCnt = 0;
	  let checkedCnt = 0;
	  for(let i = 0; i < el.length; i++){
	    if(!el[i].disabled){
	      checkboxCnt += 1;
	      if(el[i].checked){
	        checkedCnt += 1;
	      }
	    }
	  }
	  
	  let chkMode = false;
	  if(checkboxCnt == checkedCnt){
	    chkMode = true;
	  } else {  
	    chkMode = false;
	  }  
	  document.getElementById(allChkName).checked = chkMode;
	  
	  
	  	let checkBox = document.querySelectorAll(".c"); 
	  	console.log(checkBox);
		let check = false;
		checkBox.forEach(box=>{
			if(box.checked == true){
				check=true;
			}
		})
		if(check){
			document.querySelector(".nomalFee").innerText = 3000;
			<c:if test="${order.mainCategoryNo != 2 && order.subCategoryNo != 3}">
			document.querySelector(".alphaFee").innerText = 20000;
			</c:if>
			
		}else{
			document.querySelector(".nomalFee").innerText = 0;
			document.querySelector(".alphaFee").innerText = 0; 
		}
		
		
		
		
		
		
		
		
	}

	
	function checkS() {
		
	let checkBox2 = document.querySelectorAll(".setting")
	let check2 = false;
	checkBox2.forEach(box=>{
		if(box.checked == true){
			check2=true;
		}
	})
	if(check2){
		document.querySelector(".setting").value = 30000;
	}else{
		document.querySelector(".setting").value = 0;
	}
    console.log(checkBox2);
	
	}
	
	var sum = 0;
    function calc(){ 
        a = document.getElementsByClassName("c");
        for(i = 0; i < a.length; i++){
            if(a[i].checked == true){
                sum += parseInt(a[i].value);
            }
        }
        
        document.querySelector(".allPrice").innerText = sum;
        
        if(document.querySelector(".setting").value > 0){
        document.querySelector(".sumPrice").innerText = sum + 
        	parseInt(document.querySelector(".nomalFee").innerText) +
        	parseInt(document.querySelector(".alphaFee").innerText) +
        	parseInt(document.querySelector(".setting").value);
	        sum=0;
        }else{
        	document.querySelector(".sumPrice").innerText = sum + 
        	parseInt(document.querySelector(".nomalFee").innerText) +
        	parseInt(document.querySelector(".alphaFee").innerText);
        	sum=0;
        }
        
        
        
    }
    
	
    
    
    
    
    
    
    
    		    
    
    
	
	
</script>


