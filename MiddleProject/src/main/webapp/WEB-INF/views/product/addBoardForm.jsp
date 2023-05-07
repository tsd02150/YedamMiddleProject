<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<form action="addBoard.do" method="post" enctype="multipart/form-data">
	 <!-- Add Product -->
    <div class="w3-row-padding">
      <div class="w3-col s4">
      <select id="searchProduct">
		<c:forEach var="list" items="${baordList }">
			<option value="${list.productName}">${list.productName}</option>
		</c:forEach>
		</select>
        ${id}<br>
        ${companyNo}
        
        <h4>게시글 등록</h4>
        <table style="margin-left:auto;margin-right:auto;">
	        <tr>
	        	<th>제목</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="제목" name="Title" required></td>
	        </tr>
	        <tr>
	        	<th>내용</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="내용" name="Content" required></td>
	        </tr>
	        <tr>
	        	<th>Thumbnail</th>
	        	<td><input class="w3-input w3-border" type="file" placeholder="Attach" name="Attach" required></td>
	        </tr>
	        <tr>
	        	<th>Attach</th>
	        	<td><input class="w3-input w3-border" type="file" placeholder="내용" name="Content" required></td>
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