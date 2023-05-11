<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
		<td><c:if test="${vo.noticeAttach !=null}">
				<c:choose>
					<c:when test="${fileType =='image'}">
						<img width="200px" height="200px" src="images/${vo.noticeAttach }">
					</c:when>
					<c:otherwise>
						<a href="images/${vo.noticeAttach }">${vo.noticeAttach }</a>
					</c:otherwise>
				</c:choose>

			</c:if></td>
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

<!-- 댓글------------------기능 -->
<table class="table">
	<thead>
		<!-- 댓글 정보 -->
		<tr>
			<th>NO</th>
			<th>답변</th>
			<th>작성자</th>
			<th>삭제</th>
		</tr>
	</thead>
	<!-- 댓글리스트 -->
	<tbody id="tlist">
	</tbody>
</table>

<!-- 댓글등록 -->
<div id="replyContent">

	<span>답글쓰기</span> <input type="text" size="50" id="reply">
	<button type="button" id="addBtn">등록</button>

</div>
<!-- 댓글수정.숨겨짐 -->
<table style="display: none;">
	<tbody>
		<tr class="template">
			<td>NO</td>
			<td><input type="text" class="reply"></td>
			<td>작성자</td>
			<td><button>수정</button></td>
		</tr>
	</tbody>
</table>


<script>


	let showFields = ['replyNo','replyContent','replyWriter']
	let xhtp = new XMLHttpRequest();
	xhtp.open('get', 'replyListCustomer.do?no=${vo.noticeNo}');
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

	
	// 등록이벤트...
	  document.querySelector("#addBtn").addEventListener('click', addReplyFnc);

	  function addReplyFnc(e) {
		  console.log("${id}")
	    // 로그인 여부를 체크해서 로그인 정보가 없으면 로그인화면으로 이동하기.
	    //let id = document.querySelector('#replyContent span').innerText;
	    if ("${id}" != "admin") {
	      alert("권한이 없습니다.");
	      return;
	    } 
	    console.log('reply', document.querySelector("#reply").value)
	    console.log('id', "${id }");
	    
	    let reply = document.querySelector("#reply").value;
		console.log(reply);
		
	    if (reply == null || reply == '') {
	      alert('댓글을 등록하세요.');
	      document.querySelector("#reply").focus();
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
	        //document.getElementById("replyInput").value = '';
	        //document.getElementById("replyInput").focus();
	      } else if (result.retCode == 'Fail') {
	        alert('처리중 에러.');
	      }
	    }
	  }
	
	
	 // tr 생성해주는 함수.
	  function makeTrFunc(reply = {}) {
	    let tr = document.createElement('tr');
	    tr.id = reply.replyNo; // tr 속성추가: 댓글번호.
	    
	    document.querySelector("#addBtn").addEventListener('click', addReplyFnc);
	    //tr더블클릭 이벤트: 수정
	    tr.addEventListener('dblclick', function (e) {
	    	if("${id}"!=reply.replyWriter){
				alert('수정 권한 없음');
				return;
			}
	    	let writer = this.children[2].innerText;
	  
	        if (writer != '${id }') {
	          alert('권한이 없습니다.')
	          return;
	        }
	      console.log(this);
	        
	      let template = document.querySelector('.template').cloneNode(true);
	      console.log(template);
	      //template.children[0].innerText = reply.replyId;
	      //template.children[1].children[0].value = reply.reply;
	      //template.children[2].innerText = reply.replyWriter;
	      template.querySelector('td:nth-of-type(1)').innerText = reply.replyNo;
	      template.querySelector('td:nth-of-type(2)>input').value = reply.replyContent;
	      template.querySelector('td:nth-of-type(3)').innerText = reply.replyWriter;
	      template.querySelector('button').addEventListener('click', function (e) {
	    	//데이터를 서버에 반영후 보이는 곳도 변경
	    	
	        // Ajax 호출.
	        let replyId = reply.replyNo;
	        let replyCon = this.parentElement.parentElement.children[1].firstChild.value;
	        console.log(replyId, replyCon);

	        let xhtp = new XMLHttpRequest();
	        xhtp.open('post', 'modifyReplyCustomer.do');
	        xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	        xhtp.send('rid=' + replyId + '&reply=' + replyCon);
	        xhtp.onload = function () {
	          let result = JSON.parse(xhtp.response);
	          if (result.retCode == 'Success') {
	            alert('수정 완료.');
	            
	            // 화면변경.
	            let newTr = makeTrFunc(result.data);
	            let oldTr = document.querySelector('.template');
	            document.querySelector('#tlist').replaceChild(newTr,oldTr );
	            //document.getElementById('#tlist').replaceChild(newTr, oldTr);

	          } else if (result.retCode == 'Fail') {
	            alert('처리중 에러.');
	          } else {
	            alert('알수 없는 반환값.');
	          }
	        }

	      })
	      // 화면전환.
	      //document.getElementById('tlist').replaceChild(template, tr);
	  	  document.querySelector('#tlist').replaceChild(template, tr);
	    })
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
	      console.log('${id }');

 	      if('${mno}' == 0){
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
	          alert('삭제완료.')
	          // 화면에서 지우기.
	          btn.parentElement.parentElement.remove();

	        } else if (result.retCode == 'Fail') {
	          alert('처리중 에러발생.');

	        } else {
	          alert('알수 없는 결과값입니다.');
	        }
	      }

 	      }else{
 		   		alert('권한이 없습니다.')
 		   	return;
 			}

	    })
	    btn.innerText = '삭제'
	    let td = document.createElement('td');
	    td.append(btn);
	    tr.append(td);

	    return tr; // 생성한 tr 을 반환.
	  }

	  
</script>
