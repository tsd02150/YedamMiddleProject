<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
   rel="stylesheet" />
<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
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
                              <td><input type="text" name="bno"
                                 value="${boardInfo.boardNo }" style="display: none;"></td>
                           </tr>
                        </table>
                        <h4 class="mb-1">${boardInfo.boardTitle }</h4>
                        <img class="card-img-top"
                           src="images/${boardInfo.boardThumbnail }" alt="..." />
                     </div>
                     <div class="col-md-6">
                        <h3 class="display-5 fw-bolder">${boardInfo.productName}</h3>
                        <div class="fs-5 mb-5">
                           <span>
                              <fmt:formatNumber value="${boardInfo.price}" pattern="#,###" /></span>
                        <div class="col-md-6">게시글 내용 : ${boardInfo.boardContent}</div>
                        <div>
                           <select>
                              <option value="${boardInfo.productNo }">${boardInfo.productName}</option>
                           </select>
                           <span>
                              <button type="button">-</button>
                              <input class="order-count" type="text" name="count" title="수량입력" value="1" min="1" max="10" style="width: 35px; text-align: center;">
                              <button type="button">+</button>
                           </span>
                        </div>
                              <button class="addOrder-Btn" type="button">장바구니</button>
                              <a href="#"><button class="addPay-Btn" type="button">구매하기</button></a>
                        </div>
                     </div>
                     <table>
                        <tr>
                           <td><button type="submit">수정</button>
                              <button type="button" onclick="deleteBoard()">삭제</button> <a
                              href="addBoardForm.do?cno=${companyNo }"><button
                                    type="button" id="addBtn">판매 등록</button></a></td>
                        </tr>
                     </table>
                     <!-- 차트 -->
                     <div id="chart_div"></div>
                     <img class="card-img-top" src="images/${boardInfo.boardAttach }"
                        alt="..." />
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>
</form>
<br>
<div id="comapny-div" style="display: block;">
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
</div>
<hr>
<ul>
   <li id="review">상품후기</li>
   <li id="qna">문의내역</li>
</ul>
<hr>
<ul id="rtd">
</ul>
<div id="top"></div>
<table id="qna-table" style="display: none;">
   <thead>
      <tr>
         <th>No</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
      </tr>
   </thead>
   <c:forEach var="list" items="${qnaList }">
      <tbody id="${id}">
         <tr id="${list.name }_tr">
            <td>${list.qnaNo }</td>
            <td>${list.qnaTitle }</td>
            <td id="${list.name}">${list.name }</td>
            <td>${list.qnaDate}</td>
            <!-- <td style="display: none;"><input id="qna-pw">입력</td> -->
         </tr>
         <tr id="${list.name}_content" style="display: none;">
            <td>문의내용 :</td>
            <td>${list.qnaContent }</td>
            <td class="qna-modify-button">수정</td>
            <td class="qna-delete-button">삭제</td>
         </tr>
         <tr id="${list.name}_answer" style="display: none;">
            <td>답변 :</td>
            <td>${list.qnaAnswer }</td>
            <td></td>
            <td></td>
         </tr>
      </tbody>
   </c:forEach>
</table>
<div id="qna-div"></div>

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
               location.href = "addReviewForm.do?id=${id}"
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

   let Atr = document.getElementById('${id}');
   let Btr = document.querySelector('#${name}_tr');
   let Ctr = document.querySelector('#${name}_content');
   let Dtr = document.querySelector('#${name}_answer');
   
   if('${id}'!=null){
      Btr.addEventListener('click', function () {
         fetch('qnaList.do?bno=${boardInfo.boardNo}', {
               method: "GET"
            })
            .then(qresolve => qresolve.json())
            .then(qresult => {
               qresult.forEach(qlist => {
                  if (Ctr.style.display != "none" && Dtr.style.display != "none") {
                     Ctr.style.display = "none";
                     Dtr.style.display = "none";
   
                  } else if (Ctr.style.display == "none" && Dtr.style.display == "none") {
                     //Ctr.innerHTML="";
                     Ctr.style.display = "table-row";
                     Dtr.style.display = "table-row";
                     
                     let qnadeleteBtn = document.querySelector('.qna-delete-button');
                     qnadeleteBtn.addEventListener('click', function(){
                        fetch('removeQna.do', {
                           method: "POST",
                           headers: {
                              'Content-Type': 'application/x-www-form-urlencoded'
                           },
                           body: 'qno=' + qlist.qnaNo + '&bno=' + '${boardInfo.boardNo}'
                        })
                        .then(deleteQna => deleteQna.json())
                        .then(removeQna => {
                           if (result.retCode == 'Success') {
                              document.getElementById(qlist.name+'_tr').remove();
                              alert('문의내역 삭제 성공');
                           } else if (result.retCode == 'Fail') {
                              alert('처리중 에러 발생')
                           } else {
                              alert('알 수 없는 결과값입니다.');
                           }
                        })
                     })
                  }
               })
            })
      })
   }
   //장바구니 담기
   let orderBtn = document.querySelector('.addOrder-Btn');
   orderBtn.addEventListener('click', function(){
      if('${id}'==null){
         alert('로그인 후 이용 가능합니다.');
      }
      let minusBtn = document.querySelector('.order-count-minus');
      let plusBtn = document.querySelector('.order-count-plus');
      let countInput = document.querySelector('.order-count');

      minusBtn.addEventListener('click', () => {
         if (countInput.value > 1) {
            countInput.value = countInput.value - 1;
         }
      });

      plusBtn.addEventListener('click', () => {
         if (countInput.value < 10) {
            countInput.value = countInput.value + 1;
         }
      });

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
         console.log(count);
         alert('장바구니 담기 성공');
      })
   })
   
   //구매하기
   let payBtn = document.querySelector('.addPay-Btn');
   payBtn.addEventListener('click', function(){
      if('${id}'==null){
         alert('로그인 후 이용 가능합니다.');
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
   

}

</script>