<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
   rel="stylesheet" />
<style>
html, body, div, span, object, iframe, h1, h2, h3, h5, h6, p,
   blockquote, pre, abbr, address, em, img, dl, dt, dd, ol, ul, li,
   fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr,
   th, td {
   font-family: 'Noto Sans KR', 'Malgun Gothic', sans-serif;
   line-height: 1.4;
   letter-spacing: -0.5px;
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: top;
   box-sizing: border-box;
   word-break: break-word;
}

.span-price{
   font-family: 'Noto Sans KR', 'Malgun Gothic', sans-serif;
   line-height: 1.4;
   letter-spacing: -0.5px;
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: top;
   box-sizing: border-box;
   word-break: break-word;
   margin-left: 400px;
    font-size: x-large;
    font-weight: bold;
}

ol, li, figure {
   list-style-type: none;
   display: inline-block;
}

li {
   text-align: -webkit-match-parent;
   display: inline-block;
   padding-left: 20px;
   padding-right: 20px;
}

div.review-image img {
   width: 200px;
   height: 200px;
}

div.bi-star-fill {
   float: left;
}

li.review-li {
   margin-right: 20px;
}

div.review-date {
   float: right;
}

div.renew-imange img {
   width: 25px;
   height: 25px;
   float: right;
}

div.renew-imange img:hover {
   width: 30px;
   height: 30px;
   float: right;
}

@import
   url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.rate {
   display: inline-block;
   border: 0;
   margin-right: 15px;
}

.rate>input {
   display: none;
}

.rate>label {
   float: right;
   color: #ddd
}

.rate>label:before {
   display: inline-block;
   font-size: 1rem;
   padding: .3rem .2rem;
   margin: 0;
   cursor: pointer;
   font-family: FontAwesome;
   content: "\f005 ";
}

.rate .half:before {
   content: "\f089 ";
   position: absolute;
   padding-right: 0;
}

.rate input:checked ~label, .rate label:hover, .rate label:hover ~label
   {
   color: #f73c32 !important;
}

.rate input:checked+.rate label:hover, .rate input input:checked ~label:hover,
   .rate input:checked ~.rate label:hover ~label, .rate label:hover ~input:checked
   ~label {
   color: #f73c32 !important;
}

.qlist-table {
   width: 800px;
}

th, td {
   padding: 20px;
}

#qna-title {
   padding-left: 20px;
   padding-right: 20px;
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


.display-5 fw-bolder{
   text-align: left;
}
.mb-1-title {
    margin-bottom: 0.25rem !important;
    text-align: left;
}

.col-md-6{
   padding: 20px;
}
.order-count-minus{
   width: 35px;
   margin-left: 80px;
   border: none;
   font-weight: bold;
   font-size: x-large;
}
.order-count-plus{
   width: 35px;
   border: none;
   border: none;
   font-weight: bold;
   font-size: large;
   margin-bottom: 10px;
}

.addOrder-Btn{
   margin-top: 20px;
   margin-right: 10px;
   width: 120px;
   margin-left: 250px;
   border:solid 1px;
   border-radius: 15px;
   padding-left: 6px;
   padding-bottom: 10px;
   padding-top: 10px;
}
.addPay-Btn{
   width: 120px;
   border:none;
   border-radius: 15px;
   padding-left: 6px;
   padding-bottom: 10px;
   padding-top: 10px;
   background-color: lightgray;
}
.addOrder-Btn.hover{
   margin-top: 20px;
   margin-right: 70px;
   width: 120px;
   margin-left: 28px;
   border:solid 1px;
   border-radius: 15px;
   padding-left: 6px;
   padding-bottom: 10px;
   padding-top: 10px;
   background-color: lightgray;
}
.board-option{
   padding: 1px;
}

#chart_div{
   margin-top: 10px;
   margin-bottom: 10px;
   width: 1200px;
   text-align: center;
}

.col-md-6-content{
   margin-top: 20px;
   margin-bottom: 80px;
}

.quick-menu {
    position: fixed;
    top: 50%;
    right: 0;
    z-index: 101;
    box-sizing: border-box;
    width: 140px;
    padding: 34px 19px 29px;
    border: 1px solid #e2e2e2;
    border-radius: 10px 0 0 10px;
    background: #fff;
    transform: translateY(-50%);
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
   color: lightgray;
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
   text-decoration: none;
}

.sidebar-nav>.sidebar-brand a:hover {
   color: lightgray;
   background: none;
}
.sidebar-nav-top{
   text-align: center;
}

#comapny-div{
   width: 500px;
}

#comapny-div h4{
   border-bottom: solid 2px;
   padding-bottom: 10px;
}

#review{
   font-size: large;
   padding-right: 60px;
}
#review:hover{
   font-size: large;
   font-weight: bold;
   color: lightgray;
}
#qna{
   font-size: large;
}
#qna:hover{
   font-size: large;
   font-weight: bold;
   color: lightgray;
}
.review-button1 button{
   border-radius: 12px;
}
.review-button1 button:hover{
   border-radius: 12px;
   background-color: lightgray;
}
.board-modify{
   padding: 5px;
    margin-bottom: 30px;
    margin-left: 20px;
    width: 50px;
    border: none;
    background: lightgray;
}
.board-remove{
   padding: 5px;
    margin-bottom: 30px;
    margin-left: 20px;
    width: 50px;
    border: none;
    background: lightgray;
}

</style>
<article>
<form action="modifyBoard.do" method="GET" class="getBoard-form">
   <div class="md-prod-page">
      <div class="md-prod-page-in">
         <div class="page-preview">
            <div class="preview">

               <div>
                  <div class="row">
                     <div class="col-md-6">

                        <div id="top-position"></div>
                        <table>
                           <tr>
                              <td><input type="text" name="bno"
                                 value="${boardInfo.boardNo }" style="display: none;"></td>
                           </tr>
                        </table>
                        <h3 class="mb-1-title">${boardInfo.boardTitle }</h3>
                        
                        <img class="card-img-top"
                           src="images/${boardInfo.boardThumbnail }" alt="..." />
                     </div>
                     <div class="col-md-6">
                        <h3 class="display-5 fw-bolder">${boardInfo.productName}</h3>
                        <div class="fs-5 mb-5" style="width: 600px; height: 230px;">
                           
                        <div class="col-md-6-content">${boardInfo.boardContent}</div>
                          <c:choose>
		                     <c:when test="${boardInfo.memberNo eq mno}">
		                        <button class="board-modify" type="submit">수정</button>
		                        <button class="board-remove" type="button" onclick="deleteBoard()">삭제</button>
		                     </c:when>
		                  </c:choose>
                        <div class="getBoard-order-add">
                           <select style="width: 300px; margin-left: 15px;text-align: center; padding: 5px;">
                              <option value="${boardInfo.productNo }">${boardInfo.productName}</option>
                           </select>
                           <span>
                              <button type="button" class="order-count-minus">-</button>
                              <input class="order-count" type="text" name="count" title="수량입력" value="1" min="1" max="10" style="width: 35px; text-align: center;">
                              <button type="button" class="order-count-plus">+</button>
                           </span>
                           <div>
                              <span class="span-price">
                                 <fmt:formatNumber value="${boardInfo.price}" pattern="#,###" />원</span>
                           </div>
                        </div>
                              <button class="addOrder-Btn" type="button">장바구니</button>
                              <a href="#"><button class="addPay-Btn" type="button">구매하기</button></a>

                              
                        </div>
                     </div>
                     <img src="images/${boardInfo.boardAttach }" style="width:1250px"/>
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>
</form>
<br>
<div>
   <c:choose>
      <c:when test="${grade=='c'}">
      <nav class="quick-menu" class="active">
         <ul class="sidebar-nav">
            <li class="sidebar-nav-item"><a href="#">장바구니</a></li>
            <li class="sidebar-nav-item"><a href="#">관심상품</a></li>
            <li class="sidebar-nav-item"><a href="#">주문/배송</a></li>
            <li class="sidebar-nav-item"><a href="#">문의내역</a></li>
            <li class="sidebar-nav-top"><a href="#">TOP</a></li>
         </ul>
      </nav>
      </c:when>
      <c:when test="${grade=='s'}">
      <nav class="quick-menu" class="active">
         <ul class="sidebar-nav">
            <li class="sidebar-nav-item"><a href="addBoardForm.do?cno=${companyNo }">판매등록</a></li>
            <li class="sidebar-nav-item"><a href="#">목록/관리</a></li>
            <li class="sidebar-nav-item"><a href="#">주문/배송</a></li>
            <li class="sidebar-nav-item"><a href="#">문의내역</a></li>
            <li class="sidebar-nav-top"><a href="#top-position">TOP</a></li>
         </ul>
      </nav>
      </c:when>
   </c:choose>

</div>
</div>
<!-- 차트 -->
<div id="chart_div"></div>
   <div id="comapny-div" style="display: block;width: 1200px;">
      <h4>판매자 정보</h4>
      <table>
         <tr>
            <th>상호</th>
            <td>${boardInfo.companyName}</td>
         </tr>
         <tr>
            <th>주소</th>
            <td>${boardInfo.companyAddr}</td>
         </tr>
         <tr>
            <th>연락처</th>
            <td>${boardInfo.companyPhone}</td>
         </tr>
         <tr>
            <th>사업자등록번호</th>
            <td>${boardInfo.crn}</td>
         </tr>
      </table>
   
<hr>
<div id="tab-wrap">
<ul>
   <li id="review">상품후기</li>
   <li id="qna">문의내역</li>
</ul>
<hr>
<ul id="rtd">
</ul>
<div id="top"></div>
<div id="qna-table" style="width: 800px;display: none;padding-left: 50px;">
<button type="button" id="qnaBtn">문의 등록</button>
<table>
   <thead>
      <tr>
         <th>No</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
      </tr>
   </thead>
      <tbody>
   <c:forEach var="list" items="${qnaList }">
         <tr class="qnaInfo" data-member-no=${list.memberNo }>
            <td>${list.qnaNo }</td>
            <td>${list.qnaTitle }</td>
            <td id="${list.name}">${list.name }</td>
            <td>${list.qnaDate}</td>
            <!-- <td style="display: none;"><input id="qna-pw">입력</td> -->
         </tr>
         <tr class="qnaContent" style="display: none;">
            <td>문의내용 :</td>
            <td colspan="3"><span>${list.qnaContent }</span></td>
         </tr>
         <c:if test="${list.memberNo==mno }">
         	<tr>
         	<td></td>
         	<td></td>
         	<td class="review-button1"><button>수정</button></td>
            <td class="review-button2"><button>삭제</button></td>
            </tr>
         </c:if>
         <tr class="qnaAnswer" style="display: none;">
            <td>답변 :</td>
            <c:if test="${list.qnaAnswer !=null}">
	            <td>${list.qnaAnswer }</td>
            </c:if>
            <c:if test="${list.qnaAnswer ==null}">
	            <td>답변이 달리지 않았습니다.</td>
            </c:if>
            <td></td>
            <td></td>
         </tr>
   </c:forEach>
      </tbody>
</table>
</div>
<div id="qna-div"></div>
</div>
</article>
<script>
//차트
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(fetchData);

function fetchData() {
  fetch('chartData.do?pno=1')
    .then(function(response) {
      return response.json();
    })
    .then(function(jsonData) {
       let data = new google.visualization.DataTable();
      data.addColumn('string', '성별');
      data.addColumn('number', '구매 수');
      for(let i = 0; i < jsonData.length; i++) {
        data.addRow([jsonData[i].gender, jsonData[i].orderCount]);
      }

      let options = {
        title: '구매자 통계',
        //subtitle: 'Based on most recent and previous census data',
        hAxis: {
          title: '',
          minValue: 0
        },
        vAxis: {
          title: '성별'
        },
        bars: 'horizontal',
        axes: {
          y: {
            0: {side: 'right'}
          }
        }
      };
      
      let chart = new google.charts.Bar(document.getElementById('chart_div'));
      chart.draw(data, google.charts.Bar.convertOptions(options));
    });
}

   //Review
   let review = document.getElementById('review');
   let qna = document.querySelector('#qna');
   let company = document.getElementById('company');
   let rtd = document.getElementById('rtd');
   let divTop = document.getElementById('top');
   let qu = document.getElementById('qna-div');
   let cu = document.getElementById('comapny-div');
   let table = document.querySelector('#qna-table');


   review.addEventListener('click', function () {
	   console.log('aaaa');
      fetch('reviewList.do?bno=${boardInfo.boardNo}', {
            method: "GET",
         })
         .then(resolve => resolve.json())
         .then(result => {
            rtd.innerHTML = "";
            divTop.innerHTML = "";
            if (table.style.display != "none") {
               table.style.display = "none";
            }
            let addBtn = document.createElement('button');
            addBtn.innerText = "후기 등록";
            addBtn.type = "submit";
            rtd.append(addBtn);
            let br = document.createElement('br');
            rtd.append(br);
            rtd.append(br);

            addBtn.addEventListener('click', function () {
               location.href = "addReviewForm.do?boardNo=${boardInfo.boardNo}&boardTitle=${boardInfo.boardTitle}"
            })

            result.forEach(rlist => {
               console.log(rlist);
               let list = makeLi(rlist);

               rtd.append(list);

            }) //end

         })
   })



   function makeLi(rlist) {

      let li = document.createElement('li');
      li.className = "review-li";
      li.id = rlist.reviewNo;
      let br = document.createElement('br');
      li.append(br);


      let div = document.createElement('div');
      div.innerText = rlist.name;
      li.append(div);
      console.log('${id}');
      console.log(rlist.id);

      if ('${id}' == rlist.id) {
         let imgdiv = document.createElement('div');
         imgdiv.className = "renew-imange";
         let img = document.createElement('img');
         img.src = "images/renew.png";
         imgdiv.append(img);
         li.append(imgdiv);

         function createStarRatingHTML() {
            let html = '<div class="startRadio">';
            html += `
                    <fieldset class="rate">
                        <input type="radio" id="rating5" name="score" value="5"><label for="rating5" title="5점"></label>
                        <input type="radio" id="rating4" name="score" value="4"><label for="rating4" title="4점"></label>
                        <input type="radio" id="rating3" name="score" value="3"><label for="rating3" title="3점"></label>
                        <input type="radio" id="rating2" name="score" value="2"><label for="rating2" title="2점"></label>
                        <input type="radio" id="rating1" name="score" value="1"><label for="rating1" title="1점"></label>
                    </fieldset>`;
            html += '</div>'
            return html;
         }

         imgdiv.addEventListener('click', function () {
            fetch('modifyReview.do?rno=' + rlist.reviewNo)
               .then(response => response.json())
               .then(newresult => {
                  console.log(newresult);

                  const html = createStarRatingHTML();
                  div = document.createElement('div');
                  div.className = "renew-star";
                  div.innerHTML = html;
                  li.append(div);


                  div = document.createElement('div');
                  let button1 = document.createElement('button');
                  button1.innerText = "수정";
                  button1.type = 'button';
                  button1.className = 'rno' + rlist.reviewNo;
                  button1.value = 'submit';
                  li.append(div);

                  button1.addEventListener('click', function () {
                     console.log(document.getElementById(rlist.reviewNo));
                     let targetLi = document.getElementById(rlist.reviewNo);
                     let score = targetLi.querySelector('input[name="score"]:checked').value;
                     let content = targetLi.querySelector('textarea').value;
                     console.log(score);
                     console.log(content);


                     fetch('modifyReview.do', {
                           method: "POST",
                           headers: {
                              'Content-Type': 'application/x-www-form-urlencoded'
                           },
                           body: 'rno=' + rlist.reviewNo + '&rcontent=' + content + '&score=' + score
                        })
                        .then(newdata => newdata.json())
                        .then(modify => {
                           console.log(modify)
                           if (modify.retCode == 'Success') {
                              //화면 변경
                              alert('후기 수정 성공');
                              let newLi = makeLi(modify.data);
                              let oldLi = document.getElementById(rlist.reviewNo);

                              rtd.replaceChild(newLi, oldLi);

                           } else if (renew.retCode == 'Fail') {
                              alert('처리중에러');
                           } else {
                              alert('알 수 없는 반환값');
                           }
                        })
                  })
                  div.append(button1);

                  let button2 = document.createElement('button');
                  button2.innerText = "삭제";
                  button2.type = 'button';
                  button2.id = 'submit';
                  button2.value = 'Submit';
                  div.append(button2);
                  li.append(div);

                  button2.addEventListener('click', function () {
                     console.log(rlist.reviewNo);
                     console.log(rlist.boardNo);

                     fetch('removeReview.do', {
                           method: "POST",
                           headers: {
                              'Content-Type': 'application/x-www-form-urlencoded'
                           },
                           body: 'rno=' + rlist.reviewNo
                        })
                        .then(deleteDate => deleteDate.json())
                        .then(remove => {
                           if (remove.retCode == 'Success') {
                              document.getElementById(rlist.reviewNo).remove();
                           } else if (result.retCode == 'Fail') {
                              alert('처리중 에러 발생')
                           } else {
                              alert('알 수 없는 결과값입니다.');
                           }
                        })
                  })

               })
         })
      }

      div = document.createElement('div');
      div.className = "review-date";
      div.innerText = rlist.reviewDate;
      li.append(div);

      div = document.createElement('div');
      div.className = "stars";
      div.id = 'review-score';
      let span = document.createElement('span');
      span.id = 'childSpan';
      span.innerText = rlist.score + '점';
      div.append(span);
      li.append(div);

      li.append(div);
      br = document.createElement('br');
      li.append(br);

      div = document.createElement('div');
      div.className = "review-image";
      img = document.createElement('img');
      img.src = "images/" + rlist.reviewAttach;
      div.append(img);
      li.append(div);

      div = document.createElement('div');
      let textarea = document.createElement('textarea');
      textarea.value = rlist.reviewContent;
      div.append(textarea);

      if ('${id}' != rlist.id) {
         textarea.readonly = true;
      }
      li.append(div);
      return li;
   }

   //Qna
   qna.addEventListener('click', function () {
      rtd.innerHTML = "";
      divTop.innerHTML = "";
      if (table.style.display != "none") {
         table.style.display = "none";
      } else if (table.style.display == "none") {
         let div = document.createElement('div');

         table.style.display = "block";
      }

   })
   
   document.querySelector('#qnaBtn').addEventListener('click',function(){
		location.href="addQnaForm.do?boardNo=${boardInfo.boardNo}";
	})
	
	document.querySelectorAll(".qnaInfo").forEach(qna=>{
		qna.nextElementSibling.style="display:none";
		console.log(qna.dataset.memberNo);
		if(qna.dataset.memberNo=='${mno}'){
			qna.nextElementSibling.nextElementSibling.style="display:none";
			qna.nextElementSibling.nextElementSibling.nextElementSibling.style="display:none";	
		}else{
			qna.nextElementSibling.nextElementSibling.style="display:none";			
		}
		qna.addEventListener('click',function(){
			console.log(this.nextElementSibling.style.display);
			if(this.nextElementSibling.style.display=="none"){
				this.nextElementSibling.style.display="table-row";
				if(this.dataset.memberNo=='${mno}'){
					this.nextElementSibling.nextElementSibling.style.display="table-row";	
					this.nextElementSibling.nextElementSibling.nextElementSibling.style.display="table-row";
					this.nextElementSibling.nextElementSibling.children[2].children[0].addEventListener('click',function(){
						let textarea = document.createElement('textarea');
						qna.nextElementSibling.children[1].replaceChild(textarea,qna.nextElementSibling.children[1].children[0]);
						this.addEventListener('click',function(){
							//디비 수정 필요
							let span = document.createElement('span');
							span.innerText  = textarea.value;
							qna.nextElementSibling.children[1].replaceChild(span,qna.nextElementSibling.children[1].children[0]);
						})
					});
					this.nextElementSibling.nextElementSibling.children[3].children[0].addEventListener('click',function(){
						//디비 삭제 필요
						qna.parentNode.removeChild(qna.nextElementSibling);
						qna.parentNode.removeChild(qna.nextElementSibling);
						qna.parentNode.removeChild(qna.nextElementSibling);
						qna.parentNode.removeChild(qna);
					});
				}else{
					this.nextElementSibling.nextElementSibling.style.display="table-row";						
				}
			}
			
		})
	})
   
   //장바구니 담기
   let orderBtn = document.querySelector('.addOrder-Btn');
   let minusBtn = document.querySelector('.order-count-minus');
   let plusBtn = document.querySelector('.order-count-plus');
   let countInput = document.querySelector('.order-count');

   minusBtn.addEventListener('click', function(){
    if (countInput.value > 1) {
         countInput.value = parseInt(countInput.value) - 1;
      }
    });

    plusBtn.addEventListener('click', function(){
        if (countInput.value < 10) {
           countInput.value = parseInt(countInput.value) + 1;
        }
    });
   orderBtn.addEventListener('click', function(){
      if('${id}'==null){
         alert('로그인 후 이용 가능합니다.');
         return;
      }

      let count = countInput.value;
      console.log(count);
      fetch('addOrder.do', {
         method: "POST",
         headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
         },
         body: 'bno=' + '${boardInfo.boardNo}' +  '&pno=' + '${boardInfo.productNo}' + '&count=' + count
      })
      .then(oresult=>{
         console.log(oresult);
         alert('장바구니 담기 성공');
      })
   })
   
   //구매하기
   let payBtn = document.querySelector('.addPay-Btn');
   payBtn.addEventListener('click', function(){
      if('${id}'==null){
         alert('로그인 후 이용 가능합니다.');
         return;
      }
         
      let countVal = document.querySelector('.order-count');
      let count = countVal.value;
      
      fetch('addOrder.do', {
         method: "POST",
         headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
         },
         body: 'bno=' + '${boardInfo.boardNo}' +  '&pno=' + '${boardInfo.productNo}' + '&count=' + count + '&price' + '${boardInfo.price}'
      })
      .then(oresult=>{
         console.log(oresult);
         alert('구매하기 성공');
      })
   })
</script>