<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
 #container{
  text-align: center;
  justify-content: center;
 }
 .button {
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.button1 {background-color: #3b5d50;} /* Green */
.button2 {background-color: #008CBA;} /* Blue */
</style>

<div id="container">

<form action="addReview.do" method="post" enctype="multipart/form-data">
	 <!-- Add Product -->
    <div class="w3-row-padding">
      <div class="w3-col s4">
        ${id}<br>
        ${companyNo}<br>
        
             <select id="porductName">
                 <option value="">상품 이름</option>
                 <c:forEach var="my" items="${myOrder }"><option value="${my.productNo }">${my.productName }</option></c:forEach>
             </select>
             <select id="orderDate">
                 <option value="">구매 날짜</option>
                 <c:forEach var="my" items="${myOrder }"><option value="${my.orderDate }">${my.orderDate }</option></c:forEach>
             </select>
		<br>

        <h4>게시글 등록</h4>
        <table style="margin-left:auto;margin-right:auto;">
	        <tr>
	        	<th>내용</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="내용" name="rcontent" required></td>
	        </tr>
	        <tr>
	        	<th>평점</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="1~5" name="socre" required></td>
	        </tr>
	        <tr>
	        	<th>Attach</th>
	        	<td><input class="w3-input w3-border" type="file" placeholder="attach" name="attach" required></td>
	        </tr>
	        <tr>
	        	<th>MemberNo</th>
	        	<td><c:forEach var="list" items="${myOrder }"><input class="w3-input w3-border" type="text" name="mno" value="${list.memberNo}" readonly></c:forEach></td>
	        	<!-- style="display: none;" -->
	        </tr>
	        <tr>
	        	<th>boardNo</th>
	        	<td><c:forEach var="list" items="${myOrder }"><input class="w3-input w3-border" type="text" name="bno" value="${list.boardNo}" readonly></c:forEach></td>
	        	<!-- style="display: none;" -->
	        </tr>
	        <tr>
	        	<td>
		          <button type="submit" class="button button1">등록</button>
		          <button type="reset" class="button button2">취소</button>
	         	</td>
	        </tr>
        </table>
      </div>
    </div>
</form>
</div>



<script>


</script>