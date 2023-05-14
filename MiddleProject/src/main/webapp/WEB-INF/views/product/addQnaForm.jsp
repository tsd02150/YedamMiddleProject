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


	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

</style>

<div id="container">

<form action="addQna.do" method="get">
	 <!-- Add Product -->
    <div class="w3-row-padding">
      <div class="w3-col s4">
        <h4>문의 등록</h4>
        <table style="margin-left:auto;margin-right:auto;">
        	<tr>
        		<th>문의 종류</th>
        		<td>
	        		<select name="qnaCategory">
	        			<option value="">선택하세요</option>
	        			<option value="교환">교환</option>
	        			<option value="배송">배송</option>
	        			<option value="상품">상품</option>
	        			<option value="환불">환불</option>
	        			<option></option>
	        		</select>
				</td>
        	</tr>
	        <tr>
	        	<th>문의 제목</th>
	        	<td><input name="qnaTitle"></td>
	        </tr>
	        <tr>
	        	<th>문의 내용</th>
	        	<td><textarea name="qnaContent"></textarea></td>
	        </tr>

	        <tr style="display:none;">
	        	<th>boardNo</th>
	        	<td><input class="w3-input w3-border" type="text" name="bno" value="${boardNo}"  readonly></td>
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