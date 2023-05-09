<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, em, img, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    font-family: 'Noto Sans KR','Malgun Gothic',sans-serif;
    line-height: 1.4;
    letter-spacing: -0.5px;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: top;
    box-sizing: border-box;
    word-break: break-word;
}

ol, li, figure {
    list-style-type: none;
		display: inline-block;
}

li {
    text-align: -webkit-match-parent;
		display: inline-block;
}

div.review-image img{
	width: 200px;
	height: 200px;
}

div.bi-star-fill {
float:left;
}

li.review-li {
	margin-right: 20px;
}

div.review-date{
float:right;
}
div.renew-imange img{
width: 30px;
height: 30px;
float : right;

}
</style>

<form action="modifyBoard.do" method="GET">
	<div class="md-prod-page">
		<div class="md-prod-page-in">
			<div class="page-preview">
				<div class="preview">

					<div class="container px-4 px-lg-5 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
							<div class="col-md-6">

								<table>
									<tr>
										<td><input type="text" name="bno" value="${boardInfo.boardNo }" style="display:none;"></td>
									</tr>
								</table>
								<h4 class="mb-1">${boardInfo.boardTitle } </h4>
								<img class="card-img-top" src="images/${boardInfo.boardAttach }" alt="..." />
							</div>
							<div class="col-md-6">
								<h3 class="display-5 fw-bolder">${boardInfo.productName}</h3>
								<div class="fs-5 mb-5">
									<span>
										<fmt:formatNumber value="${boardInfo.price}" pattern="#,###" /></span>
								</div>
							</div>
							<table>
								<tr>
									<td><button type="submit">저장(수정)</button>
										<button type="button" onclick="deleteBoard()">삭제 </button>
										<a href="addBoardForm.do?cno=${companyNo }"><button type="button" id="addBtn">판매 등록</button></a>
									</td>
								</tr>
							</table>
							<a href="#"><i class="fa fa-star" aria-hidden="true"></i>장바구니</a>
							<div class="col-md-6">
								게시글 내용 : ${boardInfo.boardContent}
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</form>
<br>
<ul>
	<li id="review">상품후기</li>
	<li id="qna">문의내역</li>
	<li id="company">업체정보</li>
</ul>
<hr>

<ul id="rtd">
<li>
	<div class="review_cont">
		<div class="review_writer"></div>
		<div class="review_img"><img class="img"> </div>
		<div class="review_exp">
			<div class="review_score"> </div>
			<div class="review_date"> </div>
			<div class="review_content"> </div>
		</div>
	</div>
</li>
</ul>



<script>
	let review = document.getElementById('review');
	let rtd = document.getElementById('rtd');
	let qna = document.getElementById('qna');
	let company = document.getElementById('company');

	review.addEventListener('click', function(){
		fetch('reviewList.do?bno=${boardInfo.boardNo }', {
			method : "GET",
			})
		.then(resolve=>resolve.json())
		.then(result=>{
			rtd.innerHTML="";
			
			result.forEach(rlist=>{
				console.log(rlist);
			let li = document.createElement('li');
			li.className="review-li";
			let br = document.createElement('br');
			li.append(br);
			
			let div = document.createElement('div');
			div.innerText = rlist.name;
			li.append(div);
			
			if('${id}'==rlist.id){
			let imgdiv = document.createElement('div');
			imgdiv.className = "renew-imange";
			let img = document.createElement('img');
			img.src="images/renew.png";
			imgdiv.append(img);
			li.append(imgdiv);
			}
			
			div = document.createElement('div');
			div.className = "review-date";
			div.innerText = rlist.reviewDate;
			li.append(div);
			
			div = document.createElement('div');
			div.className="stars";		
			for(let i=0; i<rlist.score; i++){
				let stardiv = document.createElement('div');
				stardiv.className="bi-star-fill";
				div.append(stardiv);
			}
			li.append(div);
			br = document.createElement('br');
			li.append(br);
			
			div = document.createElement('div');
			div.className="review-image";
			img = document.createElement('img');
			img.src="images/"+rlist.reviewAttach;
			div.append(img);
			li.append(div);
			
			div = document.createElement('div');
			let textarea = document.createElement('textarea');
			textarea.value = rlist.reviewContent;
			div.append(textarea);
			if('${id}'!=rlist.id){
				textarea.readonly = true;
			}
			li.append(div);
			rtd.append(li);
			
			imgdiv.addEventListener('click', function(){
				fetch('modifyReview.do?rno='+rlist.reviewNo, {
					method : "POST",
					headers: {
				          'Content-Type': 'application/x-www-form-urlencoded'
				        },
					})
				.then(response=>response.json())
				.then(newresult=>{
					newresult.forEach(rlist=>{
					if('${id}'==rlist.id){
						div = document.createElement('div');
						let button1 = document.createElement('button');
						button1.innerText = "수정";
						button1.type = 'button';
						button1.id = 'submit';
						button1.value='Submit';
						div.append(button1);
						li.append(div);
		
						let button2 = document.createElement('button');
						button2.innerText = "삭제";
						button2.type = 'button';
						button2.id = 'submit';
						button2.value='Submit';
						div.append(button2);
						li.append(div);
				}
			
			})
		})
	})
</script>