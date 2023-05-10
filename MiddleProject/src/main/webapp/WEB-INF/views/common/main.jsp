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
	border: solid 1px gray;
	height: 600px;
	position: fixed;
	margin: 0 auto;
	top: 100px;
	left: 0;
	right: 0;
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
	width: 550px;
	height: 500px;
	margin: 0 auto;
	left: 20%;
	display: none;
	align-items: center;
	border: solid 1px black;
}

#categoryList ul {
	list-style: none;
}

#categoryList>div {
	height: 90%;
}

#mainCategory {
	border-right: solid 1px black;
	width: 200px;
}

#mainCategory li{
	height: 225px;
	padding : 100px 0px;
	font-weight: bold;
	font-size: large;
}
#subCategory {
	display: none;
	width: 300px;
	flex-direction: column;
}
#subCategory li{
	height: 50px;
	font-weight: bold;
	font-size: larger;
	vertical-align: middle;
}

#subCategory li:hover{
	background-color: #F9BF29;
	color: black;
}


</style>

</head>
<body id="mainBody">
	<div class="modal animate">
		<img src="" alt="#" />
		<div id="check">
			<input type="checkbox" id=xCheck>
			<p>다시 열지 않겠습니다.&nbsp &nbsp</p>
			<a href="main.do?checked=false&close=close" id="closeModal">[닫기]</a>
		</div>
	</div>
	<div style="background-color: #3B5D50;">
		<div id="search">
			<div id="searchDetail">
				<table>
					<tr>
						<td><div id="category"><span>Category</span></div></td>
						<td><input type="text" id="searchItem"></td>
						<td><button type="button">검색</button></td>
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
					<c:forEach var="board" items="${boardList }">
						<div class="col-12 col-md-4 col-lg-3 mb-5">
							<a class="product-item"
								href="getBoard.do?page=${pageInfo.pageNum}&bno=${board.boardNo}">
								<img src="images/${board.boardThumbnail}"
								class="img-fluid product-thumbnail">
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
		<div class="footer-section" style="background-color: #eff2f1">
			<div class="row g-5 mb-5">
				<div class="col-lg-4">
					<div class="mb-4 footer-logo-wrap">
						<a href="#" class="footer-logo">고객센터</a>
					</div>
					<p class="mb-4">
						전화상담 : 0000-0000<br>온라인 상담 : 1:1 문의
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
						<a href="#" class="footer-logo">공지사항</a>
					</div>
					<ul class="list-unstyled">
						<li><a href="#">test1</a></li>
						<li><a href="#">test2</a></li>
						<li><a href="#">test3</a></li>
						<li><a href="#">test4</a></li>
					</ul>
				</div>
				<div class="col-lg-4">
					<div class="mb-4 footer-logo-wrap">
						<a href="faq.do" class="footer-logo">자주묻는 질문</a>
					</div>
					<ul class="list-unstyled">
						<li><a href="#">test1</a></li>
						<li><a href="#">test2</a></li>
						<li><a href="#">test3</a></li>
						<li><a href="#">test4</a></li>
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
			let productName = itemList.children[index].innerText;
		}
	});
	let date = new Date();
	console.log(date);
	console.log(date.getHours());
	
	if('${checked}'=="false" && date.getHours()==9){
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