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

<form action="addBoard.do" method="post" enctype="multipart/form-data">
	 <!-- Add Product -->
    <div class="w3-row-padding">
      <div class="w3-col s4">
        ${id}<br>
        ${companyNo}
        <br>
             <select id="mainCategoryName">
			<option value="">대분류</option>
		<c:forEach var="list" items="${myProductList }">
			<option value="${list.mainCategoryNo}">${list.mainCategoryName}</option>
		</c:forEach>
		</select>
      <select id="subCategoryName">
			<option value="">소분류</option>
		<c:forEach var="list" items="${myProductList }">
			<option value="${list.subCategoryNo}">${list.subCategoryName}</option>
		</c:forEach>
		</select>
        
<hr>
 
      <select id="searchProduct">
		<option value="">상품 이름</option>
		<c:forEach var="list" items="${myProductList }">
			<option value="${list.productNo}">${list.productName}</option>
		</c:forEach>
	  </select>

		<br>
        
        <h4>게시글 등록</h4>
        <table style="margin-left:auto;margin-right:auto;">
	        <tr>
	        	<th>제목</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="제목" name="title" required></td>
	        </tr>
	        <tr>
	        	<th>내용</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="내용" name="content" required></td>
	        </tr>
	        <tr>
	        	<th>Thumbnail</th>
	        	<td><input class="w3-input w3-border" type="file" placeholder="thumbnail" name="thumbnail" required></td>
	        </tr>
	        <tr>
	        	<th>Attach</th>
	        	<td><input class="w3-input w3-border" type="file" placeholder="attach" name="attach" required></td>
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
    
var mainCategoryNameSelect = document.getElementById("mainCategoryName");
var mainCategoryNames = [];

// 중복 제거된 값
function showUniqueMainCategoryNames() {
    for (var i = 0; i < mainCategoryNameSelect.options.length; i++) {
        var mainCategoryName = mainCategoryNameSelect.options[i].value;
        if (mainCategoryNames.indexOf(mainCategoryName) === -1) {
            mainCategoryNames.push(mainCategoryName);
            var option = document.createElement("option");
            option.value = mainCategoryName;
            option.text = mainCategoryName || "대분류";
            mainCategoryNameSelect.add(option);
        } else {
            mainCategoryNameSelect.remove(i);
            i--;
        }
    }
}

showUniqueMainCategoryNames();
	//select 중복 제거
    var subCategoryNameSelect = document.getElementById("subCategoryName");
    var subCategoryNames = [];

    // 중복 제거된 값
    function showUniqueSubCategoryNames() {
        for (var i = 0; i < subCategoryNameSelect.options.length; i++) {
            var subCategoryName = subCategoryNameSelect.options[i].value;
            if (subCategoryNames.indexOf(subCategoryName) === -1) {
                subCategoryNames.push(subCategoryName);
                var option = document.createElement("option");
                option.value = subCategoryName;
                option.text = subCategoryName;
                subCategoryNameSelect.add(option);
            } else {
                subCategoryNameSelect.remove(i);
                i--;
            }
        }
    }
    showUniqueSubCategoryNames();

    
</script>