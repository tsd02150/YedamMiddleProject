<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
.all {
	margin: 0 auto;
	padding: 50px;
}
</style>

<div id="all">
	<h3>고객센터 문의하신 내용입니다.</h3>

	<table class="table">

		<tr style="display: none">
			<th>글번호</th>
			<td id="no">${vo.noticeNo}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="title" value="${vo.noticeTitle }" readonly
				style="display: none">${vo.noticeTitle }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
					value="${vo.noticeDate }" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" type="text" cols="50" rows="5"
					readonly> ${vo.noticeContent } </textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><input name="attach" value="${vo.noticeAttach }" readonly></td>
		</tr>

		<tr>
			<td colspan="2" align="center"><c:choose>
					<c:when test="${id == vo.id || id.equals('admin')}">
						<button type="button"
							onclick="location.href='modifyCustomer.do?no=${vo.noticeNo}'">수정</button>
						<button type="button"
							onclick="location.href='delCustomer.do?no=${vo.noticeNo}'">삭제</button>
					</c:when>
				</c:choose>
				<button type="button" onclick="location.href='customerCenter.do'">목록으로</button></td>
		</tr>
	</table>


	<!-- 댓글등록 -->

	<div id="reply">
		<table class="table">
			<thead>
				<tr>
					<th colspan="3" align="center">-------------------------- 관리자
						답변 --------------------------</th>
				</tr>

				<!-- 댓글 정보 -->
				<tr>
					<th>NO</th>
					<th>답글</th>
					<th>작성자</th>
					<th>삭제</th>
					<!-- 옆에 삭제버튼 만들기 -->
				</tr>
			</thead>

			<!-- 댓글리스트 -->
			<tbody id="tlist">

			</tbody>
			<div id="replyContent">
			<tr>
				<c:choose>
					<c:when test="${id.equals('admin')}">
					</c:when>
				</c:choose>
				<th>답글쓰기</th>
				<td><input type="text" size="50" id="replyInput">
					<button type="button" id="addBtn">등록</button></td>
			</tr>
			</div>

		</table>
		<!-- 댓글수정.숨겨짐 -->
		<table style="display: none;">
			<tbody>
				<tr id="template">
					<td>번호</td>
					<td><input type="text" class="modi"></td>
					<td><button>수정</button></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>


<script>

	let showFields = ['replyNo', 'reply','replyWriter']
	let xhtp = new XMLHttpRequest();
	xhtp.open('get', 'replyListCustomer.do?no=${vo.noticeNo}');
	xhtp.send();
	xhtp.onload = function () {
		console.log(xhtp.response);
		//목록생성
		let reply = document.querySelector('#tlist');
		let data = JSON.parse(xhtp.response); //json ->object
		for (let reply of data) {
			console.log('reply='+reply);
			let tr = makeTrFunc(reply);
			tlist.append(tr);
		}
	}
	
	 // tr 생성해주는 함수.
	  function makeTrFunc(reply = {}) {
	    let tr = document.createElement('tr');
	    tr.id = reply.replyNo; // tr 속성추가: 댓글번호.
	    tr.addEventListener('dblclick', function (e) {
	    	let writer = this.children[2].innerText;

	        console.log(writer, '${id }');
	        /* if (writer != '${id }') {
	          alert('권한이 없습니다.')
	          return;
	        } */
	      console.log(this);
	      let template = document.querySelector('.template').cloneNode(true);
	      console.log(template);
	      //template.children[0].innerText = reply.replyId;
	      //template.children[1].children[0].value = reply.reply;
	      //template.children[2].innerText = reply.replyWriter;
	      template.querySelector('td:nth-of-type(1)').innerText = reply.replyNo;
	      template.querySelector('td:nth-of-type(2)>input').value = reply.reply;
	      template.querySelector('td:nth-of-type(3)').innerText = reply.replyWriter;
	      template.querySelector('button').addEventListener('click', function (e) {
	        // Ajax 호출.
	        let replyId = reply.replyNo;
	        let replyCon = this.parentElement.parentElement.children[1].children[0].value;
	        console.log(replyId, replyCon);

	        let xhtp = new XMLHttpRequest();
	        xhtp.open('post', 'modifyReplyCustomer.do');
	        xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	        xhtp.send('rid=' + replyId + '&reply=' + replyCon);
	        xhtp.onload = function () {
	          let result = JSON.parse(xhtp.response);
	          if (result.retCode == 'Success') {
	            // 화면변경.
	            alert('성공.');
	            let newTr = makeTrFunc(result.data);
	            oldTr = document.querySelector('.template');
	            document.getElementById('tlist').replaceChild(newTr, oldTr);

	          } else if (result.retCode == 'Fail') {
	            alert('처리중 에러.');
	          } else {
	            alert('알수 없는 반환값.');
	          }
	        }

	      });
	      // 화면전환.
	      document.getElementById('tlist').replaceChild(template, tr);
	    });
	    // td생성.
	    for (let prop of showFields) {
	      let td = document.createElement('td');
	      td.innerText = reply[prop];
	      tr.append(td);
	    }
	    // 삭제버튼.
	    let btn = document.createElement('button');
	    btn.addEventListener('click', function (e) {
	      let writer = btn.parentElement.previousElementSibling.innerText;

	      console.log(writer, '${id }');
/* 	      if (writer != '${id }') {
	        alert('권한이 없습니다.')
	        return;
	      } */

	      console.log(btn.parentElement.parentElement);
	      let delNo = btn.parentElement.parentElement.id;
	      // db에서 삭제 후... 화면에서 삭제.
	      let xhtp = new XMLHttpRequest();
	      xhtp.open('post', 'delReplyCustomer.do')
	      xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	      xhtp.send('rid=' + delNo); // 요청방식post일 경우에 parameter를 send() 포함.

	      xhtp.onload = function () {
	        let result = JSON.parse(xhtp.response);
	        if (result.retCode == 'Success') {
	          // 화면에서 지우기.
	          alert('삭제완료.')
	          btn.parentElement.parentElement.remove();

	        } else if (result.retCode == 'Fail') {
	          alert('처리중 에러발생.');

	        } else {
	          alert('알수 없는 결과값입니다.');

	        }
	      }

	    })
	    btn.innerText = '삭제'
	    let td = document.createElement('td');
	    td.append(btn);
	    tr.append(td);

	    return tr; // 생성한 tr 을 반환.
	  }

	  // 등록이벤트...
	  document.querySelector("#addBtn").addEventListener('click', addReplyFnc);

	  function addReplyFnc(e) {
	    // 로그인 여부를 체크해서 로그인 정보가 없으면 로그인화면으로 이동하기.
	    /* let id = document.querySelector('#replyContent span').innerText;
	    if (id != 'admin') {
	      alert("권한이 없습니다.");
	      return;
	    } */

	    console.log('click', e.target);
	    console.log('reply', document.querySelector("#replyInput").value)
	    console.log('id', "${id }");
	    let reply = document.querySelector("#replyInput").value;
		console.log(reply);
	    if (reply == null || reply == '') {
	      alert('댓글을 등록하세요.');
	      document.querySelector("#replyInput").focus();
	      return;
	    }

	    // Ajax 호출.
	    let xhtp = new XMLHttpRequest();
	    xhtp.open('post', 'addReplyCustomer.do');
	    xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	    xhtp.send('id=${id }&reply=' + reply + "&noticeNo=${vo.noticeNo}");
	    xhtp.onload = function () {
	      console.log(xhtp.response); // 
	      let result = JSON.parse(xhtp.response);
	      if (result.retCode == 'Success') {
	        // 값을 활용해서 tr 생성.
	        alert("등록완료.");
	        let tr = makeTrFunc(result.data);
	        tlist.append(tr);

	        // 입력값 초기화하기.
	        document.getElementById("replyInput]").value = '';
	        document.getElementById("replyInput").focus();
	      } else if (result.retCode == 'Fail') {
	        alert('처리중 에러.');
	      }
	    }
	  }
</script>
