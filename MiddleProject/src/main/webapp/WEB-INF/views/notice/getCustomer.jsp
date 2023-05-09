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
			<td><button type="button"
					onclick="location.href='customerCenter.do'">목록으로</button></td>
			<td colspan="2" align="center">
				<c:choose>
					<c:when test="${id == vo.id || id.equals('admin')}">
						<button type="button"
							onclick="location.href='modifyCustomer.do?no=${vo.noticeNo}'">수정</button>
						<button type="button"
							onclick="location.href='delCustomer.do?no=${vo.noticeNo}'">삭제</button>
					</c:when>
				</c:choose></td>
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
				<c:choose>
					<c:when test="${id.equals('admin')}">
					</c:when>
				</c:choose>
						<tr>
							<th>답변등록</th>
							<td><input type="text" size="50" id="replyInput">
								<button type="button" id="addBtn">등록</button></td>
						</tr>
				<!-- 댓글 정보 -->
				<tr>
					<th>작성자</th>
					<th>답변내용</th>   <!-- 옆에 삭제버튼 만들기 -->
				</tr>
			</thead>
			
			<!-- 댓글리스트 -->
			<tbody id="tlist">

			</tbody>
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

	let showFields = ['replyNo', 'reply']
	let xhtp = new XMLHttpRequest();
	xhtp.open('get', 'replyListCenter.do?no=${vo.noticeNo}');
	xhtp.send();
	xhtp.onload = function () {
		console.log(xhtp.response);
		//목록생성
		let tlist = document.querySelector('#tlist');
		let data = JSON.parse(xhtp.response); //json ->object
		for (let reply of data) {
			console.log(reply);
			let tr = makeTrFunc(reply);
			tlist.append(tr);
		}
	}
	
	//등록 이벤트
	document.querySelector('#addBtn').addEventListener('click', addReplyFnc);

	function addReplyFnc(e) {
		
		//console.log('click',e);
		console.log(document.querySelector('#replyInput').value);
		let reply = document.querySelector('#replyInput').value; //reply값을 가져와서 reply변수에 입력한다.

		//Ajax 호출
		xhtp = new XMLHttpRequest();
		xhtp.open('post', 'addReplyCustomer.do');//post방식으로 보냄.
		xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');//post방식일때만 쓰는코드
		xhtp.send('noticeNo=${vo.noticeNo}&reply=' + reply);//파라미터 넘김
		xhtp.onload = function () {
			console.log(xhtp.response);
			let result = JSON.parse(xhtp.response);
			if (result.retCode == 'Success') {
				//값을 이용해서 tr생성
				let tr = makeTrFunc(result.data);
				tlist.append(tr);
			} else if (result.retCode == 'Fail') {
				//alert('처리중 에러')
			}
		}

	}
	
	//tr생성해주는 함수
	function makeTrFunc(reply = {}) {
		let tr = document.createElement('tr');
		//tr에 속성추가: 댓글번호;
		tr.id = reply.replyNo;
		//this 1) Object 안에서 사용되면 object자체를 가리킴 
		//				let obj ={name:"hong",age=20,showInfo:function(){this.age+this.name}};
		//		 2)function 선언안에서 this는 window 전역객체 
		//			 function add(){console.log(this)}->window가 나옴
		//		 3)event 안에서 사용되는 this는 이벤트 받는 대상
		//			 document.getElementById('tlist').addEventListener('click',function(e){console.log(this)})->id=tlist인 요소를 가져옴 
		//tr 더블클릭 이벤트
		tr.addEventListener('dblclick', function (e) {
			if(!id.equals('admin')){
				alert('관리자만 수정할 수 있습니다');
				return;
			}
			let template = document.querySelector('#template').cloneNode(true);
			console.log(template);
			// template.children[0].innerText=reply.replyId;
			// template.children[1].innerText=reply.replyWriter;
			// template.children[2].children[0].value=reply.reply;
			template.querySelector('td:nth-of-type(1)').innerText = reply.replyId;
			template.querySelector('td:nth-of-type(2)').innerText = reply.replyWriter;
			template.querySelector('td:nth-of-type(3)>input').value = reply.reply;
			template.querySelector('button').addEventListener('click', function (e) {
				//데이테을 서버에 반영후 보이는 곳도 변경
				//Ajax호출
				let replyId = reply.replyId;
				let replyCon = this.parentElement.parentElement.children[2].children[0].value;
				console.log(replyId, replyCon);
				let xhtp = new XMLHttpRequest();
				xhtp.open('post', 'modifyReply.do');
				xhtp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhtp.send('rid='+replyId +'&reply=' + replyCon);
				xhtp.onload = function () {
					let result = JSON.parse(xhtp.response);
					if (result.retCode == 'Success') {
						alert('변경를 성공을 했습니다');
						//화면 변경
						let newTr=makeTrFunc(result.data);
						let oldTr =document.querySelector('#template');
						document.querySelector('#tlist').replaceChild(newTr,oldTr );
					} else if (result.retCode == 'Fail') {
						alert('처리중 에러.');
					} else {
						alert('알수 없는 결과값입니다');
					}
				}

			})
			document.querySelector('#tlist').replaceChild(template, tr);

		})
		for (let prop of showFields) {
			let td = document.createElement('td');
			td.innerText = reply[prop];
			tr.append(td);
		}

		/* 
		
		//삭제버튼
		let btn = document.createElement('button');
		btn.addEventListener('click', function (e) {
			let writer = btn.parentElement.previousElementSibling.previousElementSibling.innerText;
			console.log(writer, '${memberInfo.email}');
			if (writer != '${memberInfo.email}') {
				alert('권한이 없습니다')
				return;
			}
			//db에서 삭제 화면에서 삭제.
			let xhtp = new XMLHttpRequest();
			xhtp.open('post', 'removeReply.do');
			xhtp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			console.log(btn.parentElement.parentElement.id);
			//post방식이면 send에 parameter를 적음
			xhtp.send('rid=' + btn.parentElement.parentElement.children[0].innerText);
			xhtp.onload = function () {
				let result = JSON.parse(xhtp.response);
				console.log(result);
				if (result.retCode == 'Success') {
					alert('삭제를 성공을 했습니다');
					//화면에서 지우기.
					btn.parentElement.parentElement.remove();
				} else if (result.retCode == 'Fail') {
					alert('처리중 에러발생');
				} else {
					alert('알수 없는 결과값입니다');
				}
			}
		})
		btn.innerText = '삭제';
		let td = document.createElement('td');
		td.append(btn);
		tr.append(td)
		return tr; //생성한 tr을 반환
		
		 */
		
	}
	
</script>
