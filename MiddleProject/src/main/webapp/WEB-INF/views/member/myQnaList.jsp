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
article {
    caption-side: bottom;
    border-collapse: collapse;
    position: revert;
    padding-left: 250px;
    padding-right: 50px;
    padding-top: 10px;
    width: 100%;
    display: inline-block;
    margin: 0 auto;
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
	font-weight: bold;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 12px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #3b5d50;
	color: white;
	border: 1px solid #3b5d50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>


<div>
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
					<li class="sidebar-nav-item"><a href="myCart.do">장바구니</a></li>
					<li class="sidebar-nav-item"><a href="orderDetail.do">주문현황</a></li>
					<li class="sidebar-nav-item"><a href="wishList.do">관심상품</a></li>
					<li class="sidebar-nav-item"><a href="myQnaList.do">문의내역</a></li>
				</ul>
			</nav>
		</c:otherwise>
	</c:choose>
</div>
<article>
	<table class="table">
		<thead>
			<tr>
				<th>순번</th>
				<th>게시물</th>
				<th>문의명</th>
				<th>문의 내용</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody id="tlist">
			<c:forEach var="qna" items="${list}">
			<tr>
				<td><c:out value="${no=no+1 }"></c:out></td>
				<td>${qna.boardTitle}</td>
				<td>${qna.qnaTitle}</td>
				<td>${qna.qnaContent }</td>
				<td>${qna.name}</td>
			</tr>
				<c:if test="${grade=='s' }">
					<c:if test="${qna.qnaAnswer==null }">
						<tr data-qna-no=${qna.qnaNo }><td>답변 : </td><td colspan="4"><textarea cols="50"></textarea></td><td><button type="button" class="saveAnswer">저장</button></td></tr>
					</c:if>
					<c:if test="${qna.qnaAnswer!=null }">
						<tr data-qna-no=${qna.qnaNo }><td>답변 : </td><td colspan="4">${qna.qnaAnswer }</td><td><button type="button" class="modifyAnswer">수정</button></td></tr>
					</c:if>
					</c:if>
					<c:if test="${grade=='c' }">
					<c:if test="${qna.qnaAnswer==null }">
						<tr data-qna-no=${qna.qnaNo }><td>답변 : </td><td colspan="4">답변이 아직 달리지 않았어요.</td></tr>
					</c:if>
					<c:if test="${qna.qnaAnswer!=null }">
						<tr data-qna-no=${qna.qnaNo }><td>답변 : </td><td colspan="4">${qna.qnaAnswer }</td></tr>
					</c:if>
				</c:if>		
			</c:forEach>
		</tbody>
	</table>
	<table style="display:none">
		<tr class="template"><td>답변 : </td><td colspan="4"><textarea id="answer" cols="50"></textarea></td><td><button type="button">저장</button></td></tr>
	</table>
	<hr>
	<div class="center">
		<div class="pagination">
			<c:if test="${pageInfo.prev }">
				<a href="myQnaList.do?page=${pageInfo.startPage-1 }">Previous</a>
			</c:if>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<a class="${i == pageInfo.pageNum ? 'active' : '' }" href="myQnaList.do?page=${i}">${i } </a>
			</c:forEach>
			<c:if test="${pageInfo.next }">
				<a href="myQnaList.do?page=${pageInfo.endPage+1 }">Next</a>
			</c:if>
		</div>
	</div>
</article>

<script>
	document.querySelectorAll('.modifyAnswer').forEach(modify=>{
		modify.addEventListener('click',function(){
			let template = document.querySelector('.template').cloneNode(true);
			console.log(this.parentNode.parentNode.dataset.qnaNo);
			console.log(this.parentNode.parentNode);
			template.dataset.qnaNo = this.parentNode.parentNode.dataset.qnaNo;
			template.children[1].children[0].innerText=this.parentNode.parentNode.children[1].innerText;
			template.children[2].children[0].addEventListener('click',function(){
				fetch("updateQna.do?qnaNo="+template.dataset.qnaNo+"&qnaAnswer="+template.children[1].children[0].value)
				.then(resolve=>resolve.json())
				.then(result=>{
					modify.parentNode.parentNode.children[1].innerText=template.children[1].children[0].value;
					document.getElementById('tlist').replaceChild(modify.parentNode.parentNode,template);
				})
				.catch(err=>console.log(err));
				
			})
			document.getElementById('tlist').replaceChild(template,modify.parentNode.parentNode);
			
		})
		
	})
	
	document.querySelector('.saveAnswer').addEventListener('click',function(){
		console.log(this.parentNode.parentNode.children[1].children[0].value);
		fetch("updateQna.do?qnaNo="+this.parentNode.parentNode.dataset.qnaNo+"&qnaAnswer="+this.parentNode.parentNode.children[1].children[0].value)
		.then(resolve=>resolve.json())
		.then(result=>{
			let temp=this.parentNode.parentNode.children[1].children[0].value;
			this.parentNode.parentNode.children[1].removeChild(this.parentNode.parentNode.children[1].firstChild);
			this.parentNode.parentNode.children[1].innerText=temp;
			this.innerText = "수정";
			this.className="modifyAnswer";
		})
		.catch(err=>console.log(err));
	})
</script>
