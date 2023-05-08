<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<form action="modifyBoard.do" method="GET">
	<div class="md-prod-page">
		<div class="md-prod-page-in">
			<div class="page-preview">
				<div class="preview">

					<div class="container px-4 px-lg-5 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
							<div class="col-md-6">
							
							<table><tr><td><input type="text" name="bno" value="${boardInfo.boardNo }"  style="display:none;"></td></tr></table>
								<h4 class="mb-1">${boardInfo.boardTitle } </h4>
								<img class="card-img-top" src="images/${boardInfo.boardAttach }" alt="..." />
							</div>
							<div class="col-md-6">
								<h3 class="display-5 fw-bolder">${boardInfo.productName}</h3>
								<div class="fs-5 mb-5">
									<span><fmt:formatNumber value="${boardInfo.price}" pattern="#,###" /></span>
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

<table class="table" width="960px">
<tr>
<th><div id="review">상품후기</div></th>
<th><div id="qna">문의내역</div></th>
<th><div id="company">업체정보</div></th>
</tr>
</table>


</table>
<script>

</script>