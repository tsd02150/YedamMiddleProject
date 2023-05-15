<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/style.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>Insert title here</title>
<style>
#search {
	margin: 0 auto;
	text-align: center;
	background-color: #3B5D50;
	color: #ffffff;
}

#search input {
	width: 500px;
}

#searchDetail {
	margin: 0 auto;
	width: 800px;
	vertical-align: baseline;
}

#searchDetail table tbody {
	position: relative;
	left: 20px;
}

#mainBody {
	text-align: center;
	width: 100%;
}

#carouselExample {
	margin: 0 auto;
	margin-top: 50px;
	width: 1200px;
}

#searchItemList {
	position: absolute;
	border: solid 1px black;
	background-color: white;
	z-index: 100;
	color: black;
	display: none;
}

#searchItemList ul {
	list-style: none;
	width: 500px;
	text-align: left;
}

.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}
.modal {
	width: 1200px;
	background-color: white;
	display: none;
	border: solid 1px black;
	height: 550px;
	position: fixed;
	margin: 0 auto;
	top: 200px;
	left: 0;
	right: 0;
}

.modal img {
	width: 1200px;
}

#check {
	text-align: right;
}

#check p {
	display: inline-block;
}

#category {
	margin-right: 10px;
	font-weight: bold;
	font-size: large;
}

#categoryList {
	position: absolute;
	z-index: 1000;
	background-color: #f5f5f5;
	width: 590px;
	height: 500px;
	margin: 0 auto;
	left: 12%;
	display: none;
	align-items: center;
}

#categoryList ul {
	list-style: none;
}

#categoryList>div {
	height: 90%;
}

#mainCategory {
	top: 100px;
	padding-top: 90px;
	padding-right: 35px;
	border-right: solid 1px black;
	width: 135px;
	letter-spacing: 5px;
	font-size: x-large;
}

#mainCategory li {
	height: 225px;
	font-weight: bold;
	font-size: x-large;
	letter-spacing: 5px;
}

#subCategory {
	display: none;
	width: 300px;
	flex-direction: column;
}

#subCategory li {
	height: 50px;
	font-weight: bold;
	font-size: larger;
	vertical-align: middle;
	letter-spacing: 5px;
	width: 380px;
	padding-top: 10px
}

#mainCategory li:hover {
	font-size: x-large;
	color: lightgray;
	letter-spacing: 5px;
}

#subCategory li:hover {
	color: #F9BF29;
	letter-spacing: 5px;
	font-size: xx-large;
}

.sub-name {
	text-align: left;
}

.footer-logo {
	border-bottom: 2px solid #121212;
	padding-left: 40px;
	padding-right: 40px;
}

.list-unstyled {
	font-weight: bold;
}

#categoryList {
	margin-left: 200px;
}

#subCategory {
	padding-top: 40px;
	word-spacing: 10px;
}

notice-li {
	font-size: larger;
}

.search-by-price {
	width: 150px;
}

#sidebar-wrapper {
	position: absolute;
	top: 90px;
	left: 0;
	height: 97%;
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
	color: black;
	padding-top: 20px;
	padding-bottom: 20px;
}

.sidebar-nav li.sidebar-nav-top a {
	display: block;
	text-decoration: none;
	color: black;
	padding-top: 40px;
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
</style>

</head>
<body id="mainBody" style="text-align: center">

	<div class="modal animate">
		<a href="hotDeal.do"><img src="images/hotdeal.png" alt="#" /></a>
		<div id="check">
			<input type="checkbox" id=xCheck>
			<p>다시 열지 않겠습니다.&nbsp &nbsp</p>
			<a href="main.do?checked=false&close=close" id="closeModal">[닫기]</a>
		</div>
	</div>
	<div style="background-color: #3B5D50;">
		<div id="search" style="padding-top: 20px">
			<div id="searchDetail">
				<table>
					<tr>
						<td><div id="category">
								<span>Category</span>
							</div></td>
						<td><input type="text" id="searchItem"></td>
						<td><img src="images/search.png" id=searchImg width=40
							height=30 style="margin-left: 5px"></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<div id="searchItemList">
								<ul>
								</ul>
							</div>
						</td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="categoryList">

			<div id="mainCategory">
				<ul>
					<c:forEach var="mainCategory" items="${mainCategoryList}">
						<li class="mainCategory" value="${mainCategory.mainCategoryNo }">${mainCategory.mainCategoryName }</li>
					</c:forEach>
				</ul>
			</div>
			<div id="subCategory">
				<ul>
				</ul>
			</div>

		</div>
		<div>
			<a href="theme.do"><img src="images/maintheme.png"></a>
		</div>
	</div>
	<div style="width: 1200px; margin: 0 auto;">
		<div class="untree_co-section product-section before-footer-section"
			style="width: 1200px; display: inline-block">
			<div class="container">
				<div class="row">

				<h1><a href="topCountList.do">Best Seller</a></h1>
					<c:forEach var="board" items="${topCountList}" begin="0" end="7" step="1">

						<div class="col-12 col-md-4 col-lg-3 mb-5">
							<a class="product-item"
								href="getBoard.do?page=${pageInfo.pageNum}&bno=${board.boardNo}">
								<img src="images/${board.boardThumbnail}"
								class="img-fluid product-thumbnail">
								<p class="sub-name" style="text-align: left;">${board.subCategoryName}</p>
								<h3 class="product-title">${board.boardTitle}</h3> <strong
								class="product-price"> <fmt:formatNumber
										value="${board.price}" pattern="#,###" />
							</strong> <span class="icon-cross"> <img src="images/cross.svg"
									class="img-fluid">
							</span>
							</a>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
		<div class="footer-section"
			style="background-color: #eff2f1; margin: 0 auto;">
			<div class="row g-5 mb-5" style="width: 1200px">
				<div class="col-lg-4">
					<div class="mb-4 footer-logo-wrap">
						<a href="customerCenter.do" class="footer-logo">고객센터</a>
					</div>
					<p class="mb-4" style="font-weight: bold; font-size: large">
						전화상담 053-123-0123<br> 온라인상담 1:1문의
					</p>

					<ul class="list-unstyled custom-social">
						<li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
						<li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
						<li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
						<li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
					</ul>
				</div>

				<div class="col-lg-4">
					<div class="mb-4 footer-logo-wrap">
						<a href="noti.do" class="footer-logo">공지사항</a>
					</div>
					<ul class="list-unstyled">
						<c:forEach var="notice" items="${noticeList }">
							<li class="notice-li" style="text-overflow: ellipsis;"><a
								href="getNoti.do?no=${notice.noticeNo}">${notice.noticeTitle }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-lg-4">
					<div class="mb-4 footer-logo-wrap">
						<a href="faq.do" class="footer-logo">자주묻는 질문</a>
					</div>
					<ul class="list-unstyled">
						<c:forEach var="faq" items="${faqList }">
							<li style="text-overflow: ellipsis;">${faq.noticeTitle }</li>
						</c:forEach>
					</ul>
				</div>
				
			</div>
		</div>
	</div>
</body>
<script>
	console.log(document.querySelector('#categoryList'));
	document.querySelector('#category').addEventListener('click',function(){
		if(document.querySelector('#categoryList').style.display=="none"){
			document.querySelector('#categoryList').style.display="flex";		
		}else{
			document.querySelector('#categoryList').style.display="none";
		}		
	})

	let mainList = document.querySelectorAll(".mainCategory");
	let subList = document.querySelector("#subCategory").children[0];
	mainList.forEach(main=>{
		main.addEventListener('click',function(){
			while(subList.firstChild) {
				subList.removeChild(subList.firstChild);
			}
			fetch('ctgSub.do?mctgNo='+main.value)
			.then(resolve=>resolve.json())
			.then(result=>{
				result.forEach(data=>{
					let li = document.createElement('li');
					li.innerText=data.subCategoryName;
					li.value = data.subVategoryNo;
					li.addEventListener('click',function(){
						location.href="categoryBoard.do?page=1&sno="+data.subCategoryNo;
					})
					subList.append(li);
					subList.parentElement.style.display="flex";
				})	
			})
			.catch(err=>console.log(err))
		})
	})
	
	
	let itemList = document.querySelector('#searchItemList').children[0];
	let index;
	document.querySelector('#searchItem').addEventListener('keyup',function(e){
		document.querySelector('#searchItemList').style = "display:block;";
		console.log(e.keyCode);
		if(e.keyCode!=40 && e.keyCode!=38 && e.keyCode!=13){
			if(this.value==""){
				document.querySelector('#searchItemList').style = "display:none;";
			}
			let search = this.value;
			index=-1;
			fetch('searchProductName.do?search='+search)
			.then(resolve=>resolve.json())
			.then(result=>{
				while(itemList.firstChild) {
					itemList.removeChild(itemList.firstChild);
				}
				result.forEach(data=>{
					let li = document.createElement('li');
					console.log(data);
					li.innerText = data;
					li.className="item";
					li.addEventListener('click',function(){
						location.href="#";
					});
					itemList.append(li);
				})
			})
			.catch(err=>console.log(err));
		}
		if(e.keyCode==40){
			if(index < document.querySelectorAll('.item').length-1){
				index += 1;
				console.log(index);
				if(index!=0){
					itemList.children[index-1].style="background-color: white";
				}
				itemList.children[index].style="background-color: gray";
				this.value = itemList.children[index].innerText;
			}
		}
		if(e.keyCode==38){
			if(index>0){
				index -= 1;			
				itemList.children[index].style="background-color: gray";
				this.value = itemList.children[index].innerText;
				itemList.children[index+1].style="background-color: white";
			}
		}

		if(e.keyCode==13){
			let productName = document.querySelector('#searchItem').value;
			console.log(productName);
			fetch("searchBoardFromName.do?productName="+productName)
			.then(resolve=>resolve.json())
			.then(result=>{
				location.href="categoryBoard.do?sno="+result.subNo;
			})
			.catch(err=>console.log(err));
		}
	});
	let date = new Date();
	console.log(date);
	console.log(date.getHours());
	
	if('${checked}'=="false" && date.getHours()==17){
		document.querySelector('.modal').style.display="block";	
	}
	if('${checked}'=="true" || '${close}'=="close"){
		document.querySelector('.modal').style.display="none";			
	}
	

	document.querySelector('#xCheck').addEventListener('click',function(){
		console.log(this);
		console.log(this.checked);
		if(this.checked){
			check="true";
		}else{
			check="false";
		}	
		document.querySelector('#closeModal').href="main.do?checked="+check+"&close=close";
	})
</script>
</html>